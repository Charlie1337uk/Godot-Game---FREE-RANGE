extends Node2D


const IDLE_DURATION = 1.0

export var move_to = Vector2(700,550)

export var speed = 3.0

const size = 32

onready var platform = $Platform1
onready var tween = $MoveTween1

func _ready():
	_init_tween()
		
func _init_tween():
	var duration = move_to.length() / float(speed * size)
	tween.interpolate_property(self, "position", Vector2(700,50), move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "position", move_to, Vector2(700,50), duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration+IDLE_DURATION)
	tween.start()
	

 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
