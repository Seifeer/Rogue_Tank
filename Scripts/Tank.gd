extends KinematicBody2D

var SPEED=100
#preload carrega uma packed scene,como se pre carregasse a cena para rodar no nó(esperando um comando)
var pre_bullet=preload("res://Scenes/Bullet.tscn")

var bodies=[
	"res://sprites/tankBody_huge.png",
	"res://sprites/tankBody_bigRed.png",
	"res://sprites/tankBody_darkLarge.png",
	"res://sprites/tankBody_sand.png",
	"res://sprites/tankBody_red.png",
	"res://sprites/tankBody_blue.png",
	"res://sprites/tankBody_dark.png",
	"res://sprites/tankBody_green.png"
]
var barrels=[
	"res://sprites/tankDark_barrel1.png",
	"res://sprites/specialBarrel5.png",
	"res://sprites/tankBlue_barrel1.png",
	"res://sprites/tankGreen_barrel1.png",
	"res://sprites/tankRed_barrel1.png",
	"res://sprites/tankSand_barrel1.png",
	"res://sprites/specialBarrel1.png",
	"res://sprites/specialBarrel2.png",
]

func _ready():
	#Carrega a textura da Sprite de acordo com o indice
	$Sprite.texture=load(bodies[0])
	$Barrel/Sprite.texture=load(barrels[5])
	pass

func _process(delta):
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
			bullet.dir=Vector2(cos(rotation),sin(rotation)).normalized()#Normalized normaliza a velocidade(ou comprimento) do objeto
			get_parent().add_child(bullet)
			$Barrel/Anim.play("Fire")	
			
	look_at(get_global_mouse_position())
	
	translate(Vector2(dir_x,dir_y)*delta*SPEED)
	pass