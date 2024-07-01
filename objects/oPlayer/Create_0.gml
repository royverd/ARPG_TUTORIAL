/// @description Player Creation Logic

//playerState = PlayerStateFree;

collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

image_speed = 0;

hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;

spriteRun = sprPlayerRun;
spriteIdle = sprPlayer;
spriteRoll = sprPlayerRoll;

localFrame = 0;







