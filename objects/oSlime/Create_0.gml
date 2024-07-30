/// @desc

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
sprMove = sprSlime;
sprAttack = sprSlimeAttack;

// Enemy Functions

enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;