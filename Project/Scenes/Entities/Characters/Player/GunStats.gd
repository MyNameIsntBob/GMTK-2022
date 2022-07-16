extends Spatial

export var shoot_speed : float
export var shoot_damage : int
export var shoot_distance : float
export var bullet_speed : int

#var side_stats = {
#	1: {'shoot_speed': 2, 'shoot_damage': 10, 'special': 'Sniper', 'shoot_distance': 5, 'bullet_speed': 15},
#	2: {'shoot_speed': 0.5, 'shoot_damage': 2, 'special': 'DoubleShot', 'shoot_distance': 5, 'bullet_speed': 10},
#	3: {'shoot_speed': 2, 'shoot_damage': 5, 'special': 'Shotgun', 'shoot_distance': 0.3, 'bullet_speed': 25},
#	4: {'shoot_speed': 1, 'shoot_damage': 3, 'special': 'CornerShot', 'shoot_distance': 5, 'bullet_speed': 10},
#	5: {'shoot_speed': 2, 'shoot_damage': 1, 'special': 'Other', 'shoot_distance': 5, 'bullet_speed': 10},
#	6: {'shoot_speed': 0.3, 'shoot_damage': 1, 'special': 'MachineGun', 'shoot_distance': 5, 'bullet_speed': 10}
#}
