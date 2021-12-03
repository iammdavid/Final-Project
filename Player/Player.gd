extends KinematicBody2D

onready var SM = $StateMachine

var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1


export var gravity = Vector2(0,30)

onready var player_variables = get_node("/root/Player_Variables")

var timer = 100

func _on_Timer_timeout():
	timer -= 1

func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-player_variables.max_move,player_variables.max_move)

	if direction < 0 and not $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = true
	if direction > 0 and $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = false


	$Countdown.text = "Time: " + str(timer)
	
	if timer <= 0:
		get_tree().change_scene("res://UI/Game_Over.tscn")

func set_direction(d):
	direction = d

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func _on_AudioStreamPlayer_finished():
	$Music.play()


func _on_Enemy_body_entered(body):
	pass # Replace with function body.
