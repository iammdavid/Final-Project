extends KinematicBody2D

onready var player = get_node_or_null("root/Game/Player")

func _on_Area2D_area_entered(player):
	player.set_timer_damage()


func _on_Area2D_area_exited(player):
	player.set_timer_damage()
