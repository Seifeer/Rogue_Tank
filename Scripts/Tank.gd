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
		if get_tree().get_nodes_in_group("cannon_bullets").size()<3:
			var bullet=pre_bullet.instance()
			#Coloca o objeto na mesma posição do referenciado
			bullet.global_position=$Barrel/Muzzle.global_position
			get_parent().add_child(bullet)
			#Retorna o tamanho de uma lista com todos os nós de um grupo em uma arvore
			#print(get_tree().get_nodes_in_group("cannon_bullets").size())
	
	translate(Vector2(dir_x,dir_y)*delta*SPEED)
	pass