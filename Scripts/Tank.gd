tool
extends KinematicBody2D

#Carregaa variavel quanto todo o script ta pronto
onready var BULLET_TANK_GROUP="Bullet-"+str(self)
var SPEED=100
#preload carrega uma packed scene,como se pre carregasse a cena para rodar no nó(esperando um comando)
var pre_bullet=preload("res://Scenes/Bullet.tscn")

#Variavel Export é importante para diferenciar os objetos sem precisar reprogramar
export(int, "Huge", "BigRed", "DarkLarge", "Sand", "Red", "Blue", "Dark", "Green") var bodie=0 setget set_bodie
export(int, "TankDark", "Special5", "TankBlue", "TankGreen", "TankRed", "TankSand", "Special1", "Special2") var barrel=0 setget set_barrel

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
	pass
	
func _draw():#Usada quando um objeto precisar ser redesenhado
	$Sprite.texture=load(bodies[bodie])
	$Barrel/Sprite.texture=load(barrels[barrel])

func _process(delta):
	
	#Para não executar o _process durante o modo editor
	if Engine.editor_hint:
		return
		
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
		if get_tree().get_nodes_in_group(BULLET_TANK_GROUP).size()<6:
			var bullet=pre_bullet.instance()
			bullet.global_position=$Barrel/Muzzle.global_position
			bullet.dir=Vector2(cos(rotation),sin(rotation)).normalized()#Normalized normaliza a velocidade(ou comprimento) do objeto
			#Adiciona a bala aou grupo do tank
			bullet.add_to_group(BULLET_TANK_GROUP)
			get_parent().add_child(bullet)
			$Barrel/Anim.play("Fire")	
			
	look_at(get_global_mouse_position())
	
	move_and_slide(Vector2(dir_x,dir_y)*SPEED)
	
#Função para atualizar texturas durante o modo de edição(legal)	
func set_bodie(val):
	bodie=val
	if Engine.editor_hint:#Se eu estiver no editor
		update()

func set_barrel(val):
	barrel=val
	if Engine.editor_hint:
		update()