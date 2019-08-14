extends KinematicBody2D

signal healh_updated(health)
signal killed()

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -600

var motion = Vector2()


export var max_health = 100
onready var health = max_health 

var amount = 25

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	

	
	var area = get_node("Area2D").get_overlapping_bodies()
	var health_bar = get_node("HealthBar")
	for body in area:
		if body.name == "Enemy":
			$Sprite.flip_v = true
			health_bar = health - amount
	
			print("DMGDMGDMG")
			
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("idle")
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("idle")
		
	else:
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$Sprite.play("jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
		else:
			$Sprite.play("idle")
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.02)
		
			
		
	motion = move_and_slide(motion, UP)
	pass


			