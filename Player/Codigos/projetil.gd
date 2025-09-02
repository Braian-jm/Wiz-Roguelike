extends Area2D

var projectil_dir = Vector2.ZERO
var velocidade_projétil = 400
var inimigo
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	if projectil_dir.x >= 0: 
		sprite_2d.play("left")
	else: 
		sprite_2d.play("right")



func _physics_process(delta):
	position += projectil_dir * velocidade_projétil * delta

	if not get_viewport_rect().has_point(global_position):
		queue_free()




func _on_body_entered(_body) -> void:
	if _body.is_in_group("inimigo"):
		inimigo = _body; 
		inimigo.dano()
		print("foi")
		queue_free(); 
