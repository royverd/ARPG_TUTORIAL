
// Graphics
#macro RESOLUTION_W 320
#macro RESOLUTION_H 180
#macro FRAME_RATE 60
#macro OUT 0
#macro IN 1
#macro TRANSITION_SPEED 0.04
#macro TRANSITION_OFFSET 20
#macro FLASH_DURATION 0.5
#macro FLASH_DECAY 0.04
#macro CARRY_HEIGHT 13

// Text
#macro T_STROKE 8
#macro T_ISTROKE 1
#macro TEXT_BOX_HEIGHT 70
#macro DEFAULT_TBG_FRAME 1

// Instances
#macro INTERACTION_DISTANCE 10
#macro INTERACTION_RADIUS 4
#macro BOUNCE_HEIGHT_FALLOFF 0.6
#macro DEFAULT_THROW_DISTANCE 52
#macro THROW_SPEED 3
#macro THROW_GRAVITY 0.1

// Player
#macro PLAYER_SWIPE_ATTACK_DAMAGE 5
#macro PLAYER_SWIPE_ATTACK_KNOCKBACK 10
#macro DEFAULT_PLAYER_HP 3.25
#macro DEFAULT_PLAYER_HP_MAX 5
#macro PLAYER_INVULNERABLE_DUR 120
#macro PLAYER_COLLECT_RADIUS 5

// Enemies
#macro DEFAULT_ENEMY_HP 50
#macro DEFAULT_ENEMY_DMG 0.5
#macro DEFAULT_ENEMY_KNOCKBACK 32
#macro ENEMY_WANDER_RADIUS 32
#macro ENEMY_DEFAULT_SPEED 0.35
#macro DEFAULT_ENEMY_WAIT_DUR 120
#macro DEFAULT_ENEMY_AGGRO 5
#macro ENEMY_DEFAULT_RADIUS 48
#macro ENEMY_DEFAULT_ATTACK_RADIUS 16
#macro ENEMY_ATTACK_OFFSET 8
#macro DEFAULT_ENEMY_STATE_WAIT_DURATION 15
#macro ENEMY_CHASE_SPD 1.25

// Hard Numbers
#macro MAX 9999
#macro MIN -9999
#macro PROGRESS_PERCENTAGE_ZERO 0
#macro PROGRESS_PERCENTAGE_ONE 1
#macro EOF -1
#macro NULL 0
#macro HALF 0.5
#macro QUARTER 0.25

// Geometric
#macro CARDINAL_DIR round(direction/90)
#macro FULL_CIRCLE 360
#macro RIGHT_ANGLE 90
#macro HALF_ANGLE 45

// Items
#macro ARROW_OFFSET 7
#macro ARROW_SPEED 6
#macro ARROW_DMG 10
#macro ARROW_KNB 20
#macro EXPLOSION_DMG 25
#macro EXPLOSION_KNB 40
#macro HOOK_DMG 2
#macro HOOK_KNB 5
#macro HOOK_THROW_OFFSET 7

// Miscellanous
#macro TILE_SIZE 16
#macro ROOM_START rTitle
#macro CAM_OFF 15
#macro ATTEMPT 2
#macro DEF_MAGNET_RADIUS 16
#macro MARGIN 8
#macro COIN_UI_YY 31
#macro PLAYER_ITEM_MARGIN 24



// Enums

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT,
	COUNT // HAS TO BE LAST
}

enum ITEM
{
	NONE,
	BOMB,
	BOW,
	HOOK,
	TYPE_COUNT
}

enum HOOKSTATUS
{
	EXTENDING,
	PULLTOPLAYER,
	PULLTOENTITY,
	MISSED
}