/// @desc Initialization & Global Variables

// Randomize Game Seed
randomize();

global.gamePaused = false;
global.textSpeed = 0.75;
global.targetRoom = EOF;
global.targetX = EOF;
global.targetY = EOF;
global.targetDirection = NULL;
global.iLifted = noone;
global.playerHealthMax = DEFAULT_PLAYER_HP_MAX;
global.playerHealth = DEFAULT_PLAYER_HP;

global.insCamera = instance_create_layer(0, 0, layer, oCamera);
global.iUI = instance_create_layer(0, 0, layer, oUI);

// Resize Application Surface to Defined Resolution
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

// Go To First Room 
room_goto(ROOM_START);










