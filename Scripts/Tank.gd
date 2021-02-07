extends KinematicBody2D

var speed = 100
var preBullet = preload("res://Scenes/Bullet.tscn")

func _ready():
	pass

func _process(delta):
	var dirX = 0
	var dirY = 0
	
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	
	if Input.is_action_pressed("ui_left"):
		dirX -= 1
		
	if Input.is_action_pressed("ui_up"):
		dirY += 1
	
	if Input.is_action_pressed("ui_down"):
		dirY -= 1
		
	if Input.is_action_just_pressed("ui_shoot"):
		var bullet = preBullet.instance()
		bullet.global_position = $Barrel/Muzzle.global_position
		get_parent().add_child(bullet)
	
	translate(Vector2(dirX, -dirY) * delta * speed)
	pass
