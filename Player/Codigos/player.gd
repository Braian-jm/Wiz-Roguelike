extends CharacterBody2D

@onready var anim = $sprites
var cooldown: float; 
var quantidade_projeteis:int = 1;
var cena_projetil = preload("res://Player/Cenas/projetil.tscn")
# -----------------------
# VARIÁVEIS DE MOVIMENTO
# -----------------------
var speed :int= 70
var last_direction := "down"

# -----------------------
# MOVIMENTAÇÃO
# -----------------------
func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	if input_vector.length() > 0:
		input_vector = input_vector.normalized()
		velocity = input_vector * speed

		# Define direção
		if abs(input_vector.x) > abs(input_vector.y):
			last_direction = "right" if input_vector.x > 0 else "left"
		else:
			last_direction = "down" if input_vector.y > 0 else "up"

		anim.play(last_direction)
	else:
		velocity = Vector2.ZERO
		anim.play("idle_" + last_direction)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("M1") && cooldown == 0:
		for i in range(quantidade_projeteis): 
			atirar();


func _process(delta: float) -> void:
	if cooldown > 0:
		cooldown -= delta
	if cooldown < 0:
			cooldown = 0

func atirar(): 
	var projetil_instace = cena_projetil.instantiate()
	projetil_instace.global_position =  global_position
	var pos_mouse = get_global_mouse_position()
	var dir_mouse = (pos_mouse - global_position).normalized()
	projetil_instace.projectil_dir = dir_mouse
	get_parent().add_child(projetil_instace);
	cooldown = 0.5; 
# -----------------------
# VIDA
# -----------------------
