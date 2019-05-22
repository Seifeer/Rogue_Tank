extends KinematicBody2D

var SPEED=100

func _ready():
	pass

func _process(delta):
	#Seleciona o codigo e clica em Ctrl+B para duplicar
	var dir_x=0
	var dir_y=0
	if Input.is_action_pressed("ui_right"):
		dir_x+=1
		print("Right Pressed")
	if Input.is_action_pressed("ui_left"):
		dir_x-=1
		print("Left Pressed")
	if Input.is_action_pressed("ui_up"):
		dir_y-=1
		print("Up Pressed")
	if Input.is_action_pressed("ui_down"):
		dir_y+=1
		print("Down Pressed")
		
	translate(Vector2(dir_x,dir_y)*delta*SPEED)
	pass
