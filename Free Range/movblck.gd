extends Node2D

const IDLE_DURATION = 1.0
export var move_to = Vector2(200,0)
export var speed = 3.0

var follow = Vector2.ZERO
const size = 64

onready var platform = $Platform
onready var tween = $MoveTween

func _ready():
	_init_tween()
		
func _init_tween():
	var duration = move_to.length() / float(speed * size)
	tween.interpolate_property(self, "position", Vector2(110,0), move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "position", move_to, Vector2(110,0), duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	
func _physics_process(delta):
	platform.position = platform.position.linear_interpolate(follow, 0.01)

