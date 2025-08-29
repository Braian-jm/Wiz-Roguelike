extends Area2D

@export var damage := 28   # quanto de dano essa área causa

# Este método é chamado quando algum corpo entra na área
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):   # confere se quem entrou é o player
		if body.has_method("take_damage"):
			body.take_damage(damage)
