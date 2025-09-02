extends Node2D

@onready var char: CharacterBody2D = $player
@export var enemy_scene: PackedScene
@export var spawn_margin := -10; 
var inimigos_vivos: int; 

func _ready() -> void:
	var time = $spawn_enemy_timer
	time.start()

func spawn_enemy() -> void: 
	if inimigos_vivos <= 10:
		var enemy = enemy_scene.instantiate(); 
		add_child(enemy);
		inimigos_vivos += 1; 
		enemy.global_position = calcular_spawn(); 
		enemy.char = char; 
		print(enemy.global_position)
	else: return
	
func calcular_spawn() -> Vector2:
	var spawn_area = $spawn_area/CollisionShape2D.shape as RectangleShape2D
	var area_pos = $spawn_area.global_position
	var extents = spawn_area.extents

	# pega coordenada aleatória dentro do retângulo
	var rand_x = randf_range(-extents.x, extents.x)
	var rand_y = randf_range(-extents.y, extents.y)

	return area_pos + Vector2(rand_x, rand_y)




func _on_spawn_enemy_timer_timeout() -> void:
	print("foi aq")
	spawn_enemy();
	

func lose_game():
	get_tree().change_scene_to_file("res://Menus/Cenas/voce_perdeu.tscn")
	
	
