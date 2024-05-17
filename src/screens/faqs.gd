extends Node2D


func _on_back_to_menu_btn_pressed():
	get_tree().change_scene_to_file("res://src/screens/main_menu.tscn")
