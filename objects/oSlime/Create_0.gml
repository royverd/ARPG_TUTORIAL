/// @desc

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
sprMove = sprSlime;

// Enemy Functions

enemyScript[ENEMYSTATE.WANDER] = SlimeWander;