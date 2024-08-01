{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "pEnemy",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "Parents",
    "path": "folders/Objects/Parents.yy",
  },
  "parentObjectId": {
    "name": "pEntity",
    "path": "objects/pEntity/pEntity.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"enemyWanderDistance","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"ENEMY_WANDER_RADIUS","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"enemySpeed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"ENEMY_DEFAULT_SPEED","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"enemyAggroRadius","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"ENEMY_DEFAULT_RADIUS","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"enemyAttackRadius","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"ENEMY_DEFAULT_ATTACK_RADIUS","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"enemyHP","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"DEFAULT_ENEMY_HP","varType":0,},
  ],
  "solid": false,
  "spriteId": null,
  "spriteMaskId": null,
  "visible": true,
}