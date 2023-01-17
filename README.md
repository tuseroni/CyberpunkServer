# CyberpunkServer
This is a project I am developing to help with netrunning in cyberpunk 2020

The Server is asp.net (framework 4.8) with microsoft MVC, the web page is used to manage aspects of the game (players, data fortresses, gear, etc) as well as  giving a place for ref to manage campaigns. 
The app allows for net running as its own kind of minigame (as it kinda IS with rules as written) within the app the user will be able to create players, set up gear and stats and all the things in the website but ALSO be able to do a net run and create an avatar. When a user choses net run they will send a jack in request to the ref, the ref will then either accept or reject this request, if they accept it they will chose a subgrid and place the netrunner on the grid, at this point the netrunner will see the net and can move about. the program will track the player's movement to keep track of the number of turns that have passed and to coordinate the movements of programs on the net. Traffic controlls will be implemented to manage this (eg. restricting them to one turn until the ref allows them to go or simply allowing them to go whenever they like.)

As the player moves about the net their location and actions are relayed to the ref who can see them on the grid. This is accomplished using signalr.  
video showing off progress so far (1/17/2023)

[![Watch the video](https://img.youtube.com/vi/Z2g8xccuEQ4/maxresdefault.jpg)](https://youtu.be/Z2g8xccuEQ4)

current features: 
* activating programs
* ordering programs
* a number of individual programs have been implemented
* utility programs, intrusion programs, and defensive programs are implemented as well as generic programs and anti-ic/anti-personnel.
* doing my best to build rules as written

planned features:
* diceware
* ref overrides (changing the grid mid run, adding programs, moving programs, destroying programs)
* game log (most the way in, just need some place to show it)
* campaign management (this is a big one, campaigns and sessions, where a ref can manage players, award IP, can also be able to track skill usage to make it easier on a ref to award IP, this is where a number of other features will reside, one reason i went with blazor is i can develop those individual areas first and then put them together into a session or campaign screen)
* Messaging (let players message one another or message the ref, could allow for games being played online)
* the other parts of player area (weapons, cybernetics, vehicles, other gear, clothes, armor, etc)
* friday night firefight (this is lower priority because the main focus is netrunning but when that is at a good point a simple grid that you can project onto a surface using AR with your phone would be pretty cool, it would have a similar map editing as for fortresses)
* demons (i expect they will be a place you can install programs to, the code already kinda handles this with subroutines but i may need to refactor that since it's many-many and that doesn't allow duplicates...but...why would you have a duplicate subroutine in a demon? daemons...idk what i'm doing with daemons if anything, they may just be above the board sorta things)
* area for editing and creating programs
* get all the programs functioning (this ones just a slog, there's like 200 programs. many work fine as generics, like ninja or killer, but a lot of them have special function, like defensive programs are normally activated in response to an attack, accept DeckShield One. little things like that)
* working out a system for people to make homebrew programs beyond generics (a generic, btw is one which has no unique features beyond its functions and options)
* getting all the functions and options to work
* making a competent AI.
