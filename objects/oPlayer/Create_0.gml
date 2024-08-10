/// @description Player Creation Logic

state = PlayerStateFree;
stateLast = state;
stateAttack = AttackSlash;
hitByAttack = EOF;
skipStepEvent = false;
invulnerable = PLAYER_INVULNERABLE_DUR;
flash = 0;
flashShader = shWhiteFlash;
animationEndScript = EOF;

collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

image_speed = 0;

hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;
distanceBonk = 30;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

spriteRun = sprPlayerRun;
spriteIdle = sprPlayer;
spriteRoll = sprPlayerRoll;

localFrame = 0;
animationEndScript = EOF;

if (global.targetX != EOF)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
	
}







