# CyberpunkServer
This is a project I am developing to help with netrunning in cyberpunk 2020

The Server is asp.net (framework 4.8) with microsoft MVC, the web page is used to manage aspects of the game (players, data fortresses, gear, etc) as well as  giving a place for ref to manage campaigns. 
The app allows for net running as its own kind of minigame (as it kinda IS with rules as written) within the app the user will be able to create players, set up gear and stats and all the things in the website but ALSO be able to do a net run and create an avatar. When a user choses net run they will send a jack in request to the ref, the ref will then either accept or reject this request, if they accept it they will chose a subgrid and place the netrunner on the grid, at this point the netrunner will see the net and can move about. the program will track the player's movement to keep track of the number of turns that have passed and to coordinate the movements of programs on the net. Traffic controlls will be implemented to manage this (eg. restricting them to one turn until the ref allows them to go or simply allowing them to go whenever they like.)

As the player moves about the net their location and actions are relayed to the ref who can see them on the grid. This is accomplished using signalr.  
video showing off progress so far (1/17/2023)
[![Watch the video](https://img.youtube.com/vi/Z2g8xccuEQ4/default.jpg)](https://youtu.be/Z2g8xccuEQ4)
