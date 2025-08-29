extends Area2D

var projectil_dir = Vector2.ZERO
var velocidade_projétil = 400
var inimigo
func _physics_process(delta):
	position += projectil_dir * velocidade_projétil * delta

	if not get_viewport_rect().has_point(global_position):
		queue_free()



func hit_verify(_body) -> void:
	if _body.is_in_group("Inimigo"):
		inimigo = _body; 
		inimigo.vida -= 1;
		queue_free(); 
