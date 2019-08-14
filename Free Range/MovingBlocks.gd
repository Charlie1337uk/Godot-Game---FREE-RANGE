#

extends Node2D


const IDLE_DURATION = 1.0

export var move_to = Vector2(750,332)

export var speed = 3.0


const size = 32

onready var platform = $Platform
onready var tween = $MoveTween

func _ready():
	_init_tween()

func _init_tween():
	
	var duration = move_to.length() / float(speed * size)
	tween.interpolate_property(self, "position", Vector2(500,332), move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "position", move_to, Vector2(500,332), duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDLE_DURATION)
	tween.start()
	
