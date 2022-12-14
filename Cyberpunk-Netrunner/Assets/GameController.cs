using CyberpunkServer.Models.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UIElements;
using System.Security.Cryptography;

public enum DamageType
{
    HP,
    Stat,
    Skill,
    Strength
}
public class Damage
{
    public DamageType Type=DamageType.HP;
    public string key = "";
    public int Value = 0;
}
public enum PlayerInteractionState
{
    Idle,
    Selecting
}
public class GameController : MonoBehaviour
{
    List<PlayerController> Players = new List<PlayerController>();
    List<ProgramController> Programs = new List<ProgramController>();
    List<NetActor> Initiative = new List<NetActor>();
    Stack<NetActor> InitiativeStack = new Stack<NetActor>();
    Stack<String> Messages = new Stack<string>();
    NetActor CurrentActorInInitiative;
    public MenuController MenuController;
    public UIDocument Document;
    public PlayerInteractionState PlayerState = PlayerInteractionState.Idle;
    int currentRound = 0;
    public GridController grid;
    // Start is called before the first frame update
    void Start()
    {
        MenuController= Document.rootVisualElement.Query<MenuController>("MenuController");
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    ProgramController WaitingProgram;
    public void OrderProgramMove(ProgramController program)
    {
        WaitingProgram = program;
        PlayerState = PlayerInteractionState.Selecting;
    }
    public void OrderProgramAttack(ProgramController program, NetItem Target)
    {
        WaitingProgram = program;
        PlayerState = PlayerInteractionState.Selecting;
    }
    public void TileSelect(TileController tile)
    {
        PlayerState = PlayerInteractionState.Idle;
        WaitingProgram.OrderMove(tile);
    }
    public async Task<bool> DoISeeTarget(NetActor Target, NetActor Seeker)
    {

        var targetHide = Target.doEvasionCheck();
        var SeekerSeek = Seeker.doDetectionCheck();
        if (Target is ProgramController)
        {
            var targetProgram = (ProgramController)Target;
            if(targetProgram.Options.ContainsKey("Invisibility") && !Seeker.DetectInvisibility)
            {
                targetHide = 999;
            }
        }

        if(SeekerSeek>targetHide)
        {
            await SendUIMessage($"{Seeker.Name} Spotted {Target.Name}!");
            return true;
        }
        else
        {
            return false;
        }
    }
    string getNameFromDamageType(Damage damage)
    {
        switch(damage.Type)
        {
            case DamageType.HP:
                return "HP";
            case DamageType.Skill:
                return damage.key;
            case DamageType.Stat:
                return damage.key;
            case DamageType.Strength:
                return "Strength";
            default:
                return "";
        }
    }
    public void BeginGame()
    {
        rollInitiative();
        foreach(var Actor in Initiative)
        {
            Actor.Continue = false;
            Actor.WaitForSignal = true;
        }
        Initiative[0].Continue = true;
        CurrentActorInInitiative = Initiative[0];
    }
    public async Task<bool> RollToHit(NetActor target,NetActor Attacker)
    {
        List<Task> Messages = new List<Task>();
        bool ret = false;
        Messages.Add(SendUIMessage($"{Attacker.Name} is Attacking {target.Name}"));
        int attack = Attacker.RollToHit();
        int defense = target.RollToBeHit();
        if(attack>=defense)
        {
            Messages.Add(SendUIMessage("HIT!!"));
            ret = true;
            //return true;
        }
        else
        {
            Messages.Add(SendUIMessage("MISS!!"));
            ret = false;
            //return false;
        }
        await Task.WhenAll(Messages);
        return ret;

    }
    public async Task SendUIMessage(string Message)
    {
        await MenuController.ShowMessage(Message);
    }
    public async Task DoDamage(NetActor Target, Damage damage)
    {
        
        var damageTaken=Target.TakeDamage(damage);
        await SendUIMessage($"{Target.Name} takes {damageTaken} of damage to {getNameFromDamageType(damage)}");
        if (Target is ProgramController)
        {
            if (((ProgramController)Target).Strength <= 0)
            {
                await DestroyProgram(((ProgramController)Target));
            }
        }
        
    }
    public void SetPlayerStunned(PlayerController player, bool stunned)
    {
        MenuController.Stunned = stunned;
    }
    public async Task DestroyProgram(ProgramController Program)
    {
        await SendUIMessage($"{Program.Name} Has Been Destroyed");
        Program.Rezzed = false;
        int index = Initiative.IndexOf(Program);
        if (index >= 0)
        {
            if (CurrentActorInInitiative == Initiative[index])
            {
                if (index + 1 > Initiative.Count - 1)
                {
                    index = 0;
                }
                else
                {
                    index++;
                }
                CurrentActorInInitiative = Initiative[index];
                CurrentActorInInitiative.Continue = true;
            }
            Initiative.Remove(Program);
        }
        Program.gameObject.SetActive(false);
    }
    public void ReRezz(ProgramController target)
    {
        target.Strength = target.Program.Strength;
        target.Rezzed = true;

        var summonerIndex = Initiative.IndexOf(((PlayerController)target.Owner));
        target.Initiative = ((PlayerController)target.Owner).Initiative + 1;
        if (target.canBePlaced)
        {
            target.Continue = false;
            Initiative.Insert(summonerIndex + 1, (NetActor)target);
        }
        else
        {
            target.Continue = true;
        }
        target.gameObject.SetActive(false);
    }
    public void EndTurn(NetActor actor)
    {
        int index = Initiative.IndexOf(CurrentActorInInitiative);
        if(index+1 > Initiative.Count -1)
        {
            index = 0;
        }
        else
        {
            index++;
        }
        CurrentActorInInitiative = Initiative[index];
        actor.Continue = false;
        actor.path.Clear();
        actor.ActionsDone = 0;
        CurrentActorInInitiative.Continue = true;
        CurrentActorInInitiative.BeginTurn();
    }
    /// <summary>
    /// Generates a random integer within a specified range using the 
    /// System.Security.Cryptography.RandomNumberGenerator class.
    /// </summary>
    /// <param name="low">The minimum value for the random integer.(Inclusive)</param>
    /// <param name="high">The maximum value for the random integer.(Exclusive)</param>
    /// <returns>A random integer within the specified range.</returns>
    static int GetRandomRange(int low, int high)
    {
        int rand;
        using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
        {
            byte[] randomBytes = new byte[1];
            rng.GetBytes(randomBytes);
            rand = (int)(randomBytes[0] % (high - low)) + low;
        }
        return rand;
    }
    /// <summary>
    /// Generates a random integer within the range of 1 to 10 using the 
    /// GenerateRandomInt function and the "exploding dice" rule, where 
    /// if a 10 is rolled, another roll is added to the result until a 
    /// number other than 10 is rolled.
    /// </summary>
    /// <param name="canCrit">Determines whether or not to apply the "exploding dice" rule. 
    /// If set to true, the function will keep generating random 
    /// integers until a number other than 10 is rolled. If set to false, the function will 
    /// only roll once</param>
    /// <returns>The final result of the "exploding dice" roll.</returns>
    public static int RollD10(bool canCrit = true)
    {
        int ret = 0;
        int rand;

        ret= rand = GetRandomRange(1, 11);

        Debug.Log($"First Roll {rand}");
        if (canCrit)
        {
            while (rand == 10)
            {
                Debug.Log("CRIT");
                Debug.Log($"CritRoll {rand}");
                rand =GetRandomRange(1, 11);
                Debug.Log(rand);
                ret += rand;
            }
        }
        Debug.Log($"Total {rand}");
        return ret;
    }
    public static int RollND10(int n)
    {
        var ret = 0;
        for(var i=0;i<n;i++)
        {
            ret += RollD10(false);
        }
        return ret;
    }

    //public static int RollD10(bool canCrit = true)
    //{
    //    var ret = 0;
    //    int rand = ret = UnityEngine.Random.Range(1, 11);
    //    Debug.Log(rand);
    //    if (canCrit)
    //    {
    //        while (rand == 10)
    //        {
    //            Debug.Log("CRIT");
    //            rand = UnityEngine.Random.Range(1, 11);
    //            Debug.Log(rand);
    //            ret += rand;
    //        }
    //    }
    //    Debug.Log(ret);
    //    return ret;
    //}
    public static int RollND6(int n)
    {
        var ret = 0;
        for (var i = 0; i < n; i++)
        {
            int rand = GetRandomRange(1, 7);
            ret += rand;
        }
        return ret;
    }
    public static int RollD6()
    {
        return RollND6(1);
    }
    public void addProgram(ProgramController program, ProgramSummoner summoner,RunningProgram ProgramData)
    {
        program.GameController = this;
        if (summoner is FortressController)
        {
            program.addProgram(grid, ((FortressController)summoner).Fortress, (FortressProgramsData)ProgramData, (FortressController)summoner);
        }
        else if (summoner is PlayerController)
        {
            program.addProgram(grid, ProgramData, summoner);
            var summonerIndex = Initiative.IndexOf(((PlayerController)summoner));
            program.Initiative = ((PlayerController)summoner).Initiative + 1;
            if(program.canBePlaced)
            {
                program.Continue = false;
                Initiative.Insert(summonerIndex + 1, (NetActor)program);
            }
            else
            {
                program.Continue = true;
            }

        }
        Programs.Add(program);
    }
    public Dictionary<string, RunningProgram> Utilities = new Dictionary<string, RunningProgram>();
    public void addUtility(RunningProgram program)
    {
        Utilities.Add(program.Program.name, program);
    }
    public void addPlayer(PlayerController player)
    {
        player.GameController = this;
        Players.Add(player);
    }
    public void rollInitiative()
    {
        List<Tuple<int, NetActor>> lstNetActors = new List<Tuple<int, NetActor>>();
        foreach(NetActor actor in Players)
        {
            lstNetActors.Add(new Tuple<int, NetActor>(actor.RollInitiative(), actor));
        }
        foreach (NetActor actor in Programs)
        {
            lstNetActors.Add(new Tuple<int, NetActor>(actor.RollInitiative(), actor));
        }
        lstNetActors.Sort((x, y) => y.Item1 - x.Item1);
        Initiative=lstNetActors.Select(x => x.Item2).ToList();
        for (var i = Initiative.Count - 1; i > 0; i--)
        {
            InitiativeStack.Push(Initiative[i]);
        }
    }
}
