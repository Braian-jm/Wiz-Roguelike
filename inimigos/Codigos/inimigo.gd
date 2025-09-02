extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $Inimigo_animation
const def = preload("res://Mapa/definitivo.gd");
var mapa = def.new()

var vida = 2
var char  
var enemy_actual_speed = 50; 
func _ready() -> void:
	char = get_tree().root.get_node("mapa/player")

func _physics_process(delta: float) -> void:
	perseguir()

func perseguir() -> void:
	if char and char.is_inside_tree():
		var enemy_dir: Vector2 = global_position.direction_to(char.global_position)
		velocity = enemy_dir * enemy_actual_speed
		if enemy_dir.x >= 0:
			animation.play("Right");
		else: 
			animation.play("Left");
			
			
		move_and_slide()
func dano(): 
	vida -= 1; 
	print(vida)
	if vida <= 0: 
		mapa.inimigos_vivos -= 1; 
		print(mapa.inimigos_vivos)
		queue_free();  
