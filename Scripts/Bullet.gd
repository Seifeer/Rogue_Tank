extends Area2D

var SPEED=250
var dir=Vector2(0, -1)


func _ready():
	pass

func _process(delta):
	translate(dir*delta*SPEED)
	pass
