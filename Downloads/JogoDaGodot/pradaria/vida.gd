extends TextureProgressBar

func _ready():
	value = 100
	max_value = 100
	min_value = 0

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT: # botão esquerdo
			value = clamp(value - 5, min_value, max_value)

			if value == min_value:
				get_tree().reload_current_scene()
