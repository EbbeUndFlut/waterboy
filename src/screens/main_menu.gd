extends Node2D

func _process(delta):
	pass


func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://src/tests/test_level.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_how_to_play_btn_pressed():
	get_tree().change_scene_to_file("res://src/screens/faqs.tscn")
