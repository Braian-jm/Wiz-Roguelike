extends Area2D

@onready var damage_timer = $damage_timer
var player_in_area: bool = false
@onready var vida_instance = get_tree().root.get_node("mapa/player/hud/vida");


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and damage_timer.is_stopped():
		player_in_area = true
		vida_instance.dano()
		print("tomou dano")
		damage_timer.start(10.0)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false
		damage_timer.stop()

func _on_damage_timer_timeout() -> void:
	if player_in_area:
		vida_instance.dano()
		print("tomou dano de novo")
		damage_timer.start(1) 
