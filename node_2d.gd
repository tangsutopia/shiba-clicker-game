extends Node2D

@onready var audio = $TestEffect
@onready var bgm = $BGM

func _ready():
	print("playing test audio")
	audio.play()
	bgm.play()
