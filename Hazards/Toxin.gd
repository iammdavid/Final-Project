extends Node2D

onready var player = get_node("root/Game/Player")

func _on_Area2D_area_entered(player):
	player.set_timer_damage_on()


func _on_Area2D_area_exited(player):
	player.set_timer_damage_off()
