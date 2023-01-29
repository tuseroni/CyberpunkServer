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
    Strength,
    WallStrength
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
    List<ProgramSummoner> Players = new List<ProgramSummoner>();
    List<ProgramController> Programs = new List<ProgramController>();
    List<ProgramSummoner> Initiative = new List<ProgramSummoner>();
    Stack<ProgramSummoner> InitiativeStack = new Stack<ProgramSummoner>();
    Stack<String> Messages = new Stack<string>();
    ProgramSummoner CurrentActorInInitiative;
    MenuController _menuController;
    public MenuController MenuController
	{
        get
		{
            if(_menuController==null)
			{
                MenuController = Document.rootVisualElement.Query<MenuController>("MenuController");
            }
            return _menuController;
		}
        set
		{
            _menuController = value;
		}
	}
    public UIDocument Document;
    public PlayerInteractionState PlayerState = PlayerInteractionState.Idle;
    int currentRound = 0;
    public GridController grid;
    public delegate void ProgramDestroyed(ProgramController program);
    public event ProgramDestroyed onProgramDestroyed;
    public delegate void ItemSelected(Selectable item);
    public event ItemSelected onItemSelect;
    public bool offline = false;
    Selectable SelectedItem { get; set; }
    // Start is called before the first frame update
    void Start()
    {
        MenuController= Document.rootVisualElement.Query<MenuController>("MenuController");
    }

	public void HandleFumble(NetItem codeGateController)
	{
		//do fumble things
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
    public void OrderProgramAttack(ProgramController program)
    {
        WaitingProgram = program;
        PlayerState = PlayerInteractionState.Selecting;
    }
    public void OrderProgramPatrol(ProgramController program)
	{
        program.State = ProgramState.patrolling;
    }
    public void TileSelect(TileController tile)
    {
        PlayerState = PlayerInteractionState.Idle;
        WaitingProgram.OrderMove(tile);
        WaitingProgram.Continue = true;
        WaitingProgram.BeginTurn();
    }
    public bool DebugMode = true;
    public async Task<bool> DoISeeTarget(NetActor Target, NetActor Seeker)
    {

        var targetHide = Target.doEvasionCheck(Target.DetectInvisibility);
        var SeekerSeek = Seeker.doDetectionCheck();
        if(SeekerSeek>targetHide)
        {
            if (Seeker.Owner is not PlayerController || DebugMode)
            {
                await SendUIMessage($"{Seeker.Name} Spotted {Target.Name}!");
            }
            else
            {
            }
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
            case DamageType.WallStrength:
                return "Wall Strength";
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
        CurrentActorInInitiative.BeginTurn();
    }
    public async Task<bool> RollToHit(NetItem target,NetActor Attacker)
    {
        List<Task> Messages = new List<Task>();
        bool ret = false;
        Messages.Add(SendUIMessage($"{Attacker.Name} is Attacking {target.Name}"));
        int attack = await Attacker.RollToHit();
        int defense =await  target.RollToBeHit();
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
    public async Task DoDamage(NetItem Target, Damage damage)
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


    internal void TargetSelect(NetItem _target)
    {
        PlayerState = PlayerInteractionState.Idle;
        WaitingProgram.Attack(_target);
        WaitingProgram.Continue = true;
        WaitingProgram.BeginTurn();
    }

    public void SetPlayerStunned(PlayerController player, bool stunned)
    {
        MenuController.Stunned = stunned;
    }
    public async Task DestroyProgram(ProgramController Program)
    {
        await SendUIMessage($"{Program.Name} Has Been Destroyed");
        onProgramDestroyed.Invoke(Program);
        Program.Rezzed = false;
        Program.gameObject.SetActive(false);
        SignalrHandler.InvokeProgramDerezzed(Program.FortressProgram);
        //
    }
    public async Task DeactivateProgram(ProgramController Program)
	{
        onProgramDestroyed.Invoke(Program);
        Program.Rezzed = false;
        Destroy(Program.gameObject);
        SignalrHandler.InvokeProgramDeactivated(Program.FortressProgram);
        await Task.Yield();
    }
    public void ReRezz(ProgramController target)
    {
        target.Strength = target.Program.Strength;
        target.Rezzed = true;
        if (target.canBePlaced)
        {
            if (target.currentTile != null && !target.currentTile.ContainedItem.Contains(target))
            {
                target.currentTile.ContainedItem.Add(target);
            }
            target.Continue = false;
        }
        else
        {
            target.Continue = true;
        }
        target.gameObject.SetActive(true);
    }
    public void EndTurn(ProgramSummoner actor)
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
        if (actor is NetActor)
        {
            ((NetActor)actor).path.Clear();
        }
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
    public static int GetRandomRange(int low, int high)
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
    public static int RollD10(bool canCrit = false) 
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

    public Dictionary<string, RunningProgram> Utilities = new Dictionary<string, RunningProgram>();
    public void addUtility(RunningProgram program)
    {
        Utilities.Add(program.Program.name, program);
        if(program.Program.name== "Flip Switch 3.0")
		{
            MenuController.HasGlogo = true;
		}
        if(program.Program.name=="Cartographer")
		{
            MenuController.HasCartographer = true;
			MenuController.onMapClick += MenuController_onMapClick;
		}
    }

	private void MenuController_onMapClick()
	{
        FortressController fort = (FortressController)((CPUController)Initiative.Where(x => x is CPUController).First()).Owner;
        var fortRoll = (fort.NumCPU * (3 / 2)) + RollD10();
        var utilityRoll=Utilities["Cartographer"].Strength + RollD10();
        if(utilityRoll>fortRoll)
		{

		}
    }

	public void addPlayer(ProgramSummoner player)
    {
        player.Ref = this;
        Players.Add(player);
    }
    public void rollInitiative()
    {
        List<Tuple<int, ProgramSummoner>> lstNetActors = new List<Tuple<int, ProgramSummoner>>();
        foreach(var actor in Players)
        {
            lstNetActors.Add(new Tuple<int, ProgramSummoner>(actor.RollInitiative(), actor));
        }
        //foreach (NetActor actor in Programs)
        //{
        //    lstNetActors.Add(new Tuple<int, NetActor>(actor.RollInitiative(), actor));
        //}
        lstNetActors.Sort((x, y) => y.Item1 - x.Item1);
        Initiative=lstNetActors.Select(x => x.Item2).ToList();
        for (var i = Initiative.Count - 1; i > 0; i--)
        {
            InitiativeStack.Push(Initiative[i]);
        }
    }
}
