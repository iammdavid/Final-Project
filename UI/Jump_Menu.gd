extends Control

onready var player_variables = get_node("/root/Player_Variables")

func _on_Jump1_pressed():
	player_variables.move_speed = 20
	player_variables.max_move = 400
	get_tree().change_scene("res://Game.tscn")


func _on_Jump2_pressed():
	player_variables.jump_speed = 200
	player_variables.max_jump = 1600
	get_tree().change_scene("res://Game.tscn")
	


func _on_Jump3_pressed():
	player_variables.glide = true
	get_tree().change_scene("res://Game.tscn")
