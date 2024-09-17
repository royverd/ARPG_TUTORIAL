{
  "$GMObject":"",
  "%Name":"oShopItem",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"oShopItem",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entActivateScript","path":"objects/pEntity/pEntity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"NewTextBox",},
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entActivateArgs","path":"objects/pEntity/pEntity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"[\"Item Description\", 1,[\"6:Purchase\",\"0:No Thanks.\"]]",},
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entShadow","path":"objects/pEntity/pEntity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"False",},
  ],
  "parent":{
    "name":"Managers",
    "path":"folders/Objects/Managers.yy",
  },
  "parentObjectId":{
    "name":"pEntity",
    "path":"objects/pEntity/pEntity.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"item","filters":[],"listItems":[],"multiselect":false,"name":"item","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"ITEM.BOMB","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"itemCost","filters":[],"listItems":[],"multiselect":false,"name":"itemCost","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"10","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"itemAmount","filters":[],"listItems":[],"multiselect":false,"name":"itemAmount","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"5","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"sprShopItemUI",
    "path":"sprites/sprShopItemUI/sprShopItemUI.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}