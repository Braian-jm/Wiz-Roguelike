extends Control

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Mapa/definitivo.tscn"); 

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/Cenas/Title.tscn"); 
