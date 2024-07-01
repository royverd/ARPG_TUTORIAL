/// @desc Initialization & Global Variables

// Randomize Game Seed
randomize();

global.gamePaused = false;

global.insCamera = instance_create_layer(0, 0, layer, oCamera);

// Go To First Room 
room_goto(ROOM_START);










