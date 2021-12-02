extends Node

onready var SM = get_parent()
onready var player = get_node("../..")
onready var player_variables = get_node("/root/Player_Variables")

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Jumping")

func physics_process(_delta):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		var input_vector = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),1.0)
		player.jump_power.x = clamp(player.jump_power.x + (input_vector.x * player_variables.leap_speed), -player_variables.max_leap, player_variables.max_leap)
	if Input.is_action_pressed("jump"):
		player.jump_power.y = clamp(player.jump_power.y - player_variables.jump_speed, -player_variables.max_jump, 0)
	else:
		player.velocity += player.jump_power
		SM.set_state("Falling")
