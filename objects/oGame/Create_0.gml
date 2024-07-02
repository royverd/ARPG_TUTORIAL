/// @desc Initialization & Global Variables

// Randomize Game Seed
randomize();

global.gamePaused = false;
global.textSpeed = 0.75;

global.insCamera = instance_create_layer(0, 0, layer, oCamera);

// Resize Application Surface to Defined Resolution
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

// Go To First Room 
room_goto(ROOM_START);










