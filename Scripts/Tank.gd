extends KinematicBody2D

var SPEED=100
#preload carrega uma packed scene
var pre_bullet=preload("res://Scenes/Bullet.tscn")

func _ready():
	pass

func _process(delta):
	#Seleciona o codigo e clica em Ctrl+B para duplicar
	var dir_x=0
	var dir_y=0
	if Input.is_action_pressed("ui_right"):
		dir_x+=1
	if Input.is_action_pressed("ui_left"):
		dir_x-=1
	if Input.is_action_pressed("ui_up"):
		dir_y-=1
	if Input.is_action_pressed("ui_down"):
		dir_y+=1
	if Input.is_action_just_pressed("ui_shoot"):
		if get_tree().get_nodes_in_group("cannon_bullets").size()<6:
			var bullet=pre_bullet.instance()
			bullet.global_position=$Barrel/Muzzle.global_position
			#Modificar a direção dos tiros
			bullet.dir=Vector2(cos(rotation),sin(rotation)).normalized()#Normalized normaliza a velocidade(ou comprimento) do objeto
			get_parent().add_child(bullet)	
			
	#Faz o objeto girar na direção do mouse
	look_at(get_global_mouse_position())
	
	translate(Vector2(dir_x,dir_y)*delta*SPEED)
	pass