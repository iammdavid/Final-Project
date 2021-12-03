extends Area2D
var positions = [
	Vector2(450,40)
	,Vector2(200,0)
	,Vector2(0,0)
	]
var p = 0

func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.queue_free()
func _ready():
	$Tween.interpolate_property(self,"position",position,positions[p],3.0,Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT)
	p = wrapi(p + 1,0, positions.size())
	$Tween.start()


func _on_Tween_tween_all_completed():
	$Tween.interpolate_property(self,"position",position,positions[p],3.0,Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT)
	p = wrapi(p + 1,0, positions.size())
	$Tween.start()
