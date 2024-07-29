/// @desc

// Inherit the parent event
event_inherited();

// Intrinsic Variables

state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = DEFAULT_ENEMY_WAIT_DUR;
wait = 0;

// Enemy Sprites

sprMove = sprSlime;

// Enemy Functions
enemyScript = array_create(ENEMYSTATE.COUNT, EOF);

/*
enemyScript[ENEMYSTATE.IDLE] = EOF;
enemyScript[ENEMYSTATE.WANDER] = EOF;
enemyScript[ENEMYSTATE.CHASE] = EOF;
enemyScript[ENEMYSTATE.ATTACK] = EOF;
enemyScript[ENEMYSTATE.HURT] = EOF;
enemyScript[ENEMYSTATE.DIE] = EOF;
enemyScript[ENEMYSTATE.WAIT] = EOF;
*/



