extends Area2D

var SPEED=250
var dir=Vector2(0, -1) setget set_dir


func _ready():
	pass

func _process(delta):
	translate(dir*delta*SPEED)
	
#Sinal de notificação quando o tiro sair da tela
func _on_Notifier_screen_exited():
	#print("Bullet Exited")
	queue_free()

#Função para girar a bullet na direção do clique do mouse
func set_dir(val):
	#Mostra o angulo do val
	#print(val)
	dir=val
	#altera a rotação de acordo com o angulo da direção do tiro
	rotation=dir.angle()
	