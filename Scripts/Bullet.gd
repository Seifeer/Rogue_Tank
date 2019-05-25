extends Area2D

var SPEED=250
var dir=Vector2(0, -1)


func _ready():
	pass

func _process(delta):
	translate(dir*delta*SPEED)
	pass

#Sinal de notificação quando o tiro sair da tela
func _on_Notifier_screen_exited():
	#print("Bullet Exited")
	queue_free()
