extends TextureProgressBar
@onready var mapa: Node2D = $"../../.."
func _ready():
	value = 100
	max_value = 100
	min_value = 0


func dano(): 
	value = clamp(value - 1, min_value, max_value)
	if value <= min_value:
		print("morreu")
		mapa.lose_game();
