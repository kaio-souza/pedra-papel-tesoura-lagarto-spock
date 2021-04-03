extends Node2D

func _on_Button_pressed():
 get_tree().change_scene("res://views/instructions.tscn")


func _on_Multiplayer_pressed():
 get_tree().change_scene("res://views/multiplayer_menu.tscn")
