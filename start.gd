extends Node2D

@onready var rules_popup = $Window
@onready var animation_player = $Movement

func _ready():
	rules_popup.hide()
	animation_player.play("Movement")


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	print("button pressed")

func _on_instruction_button_pressed():
	rules_popup.show()
# need to figure out pop up and then upload


func _on_window_close_requested() -> void:
	rules_popup.hide()
