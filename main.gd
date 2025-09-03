extends Node2D

var score = 0
var points_per_click = 1
var num_points_per_click = 1

@onready var win_window = $WinWindow
@onready var score_label = $ScoreLabel
@onready var hat_sprite = $HatSprite
@onready var bandana_sprite = $BandanaSprite
@onready var add_5_button = $AddFiveButton
@onready var add_10_button = $AddTenButton
@onready var add_20_button = $AddTwentyButton

@onready var accessories = [
	$HatSprite,
	$BandanaSprite
]

func _ready():
	score_label.text = "Click the Shiba to earn points!"
	hat_sprite.visible = false
	bandana_sprite.visible = false
	win_window.visible = false

func show_accessory(accessory: Node):
	for acc in accessories:
		acc.visible = false
	accessory.visible = true

# main shiba button
func _on_shiba_button_pressed():
	score += points_per_click
	update_score_label()
	if_win()

# update scores
func update_score_label():
	score_label.text = "Score: " + str(score)

# hat button
func _on_hat_button_pressed():
	print("Hat button works!")
	if score >= 20:
		score -= 20
		show_accessory(hat_sprite)
		update_score_label()

# add five button
func _on_add_five_button_pressed():
	if score >= 40:
		score -= 40
		print(num_points_per_click)
		print(points_per_click)
		if num_points_per_click == 1:
			points_per_click += 4
			num_points_per_click += 1
		else:
			points_per_click += 5
		update_score_label()

# bandana button
func _on_bandana_button_pressed() :
	if score >= 80:
		score -= 80
		show_accessory(bandana_sprite)
		update_score_label()


func _on_add_ten_button_pressed():
	if score >= 150:
		score -= 150
		print(num_points_per_click)
		print(points_per_click)
		if num_points_per_click == 1:
			points_per_click += 9
			num_points_per_click += 1
		else:
			points_per_click += 10
		update_score_label()


func _on_add_twenty_button_pressed():
	if score >= 500:
		score -= 500
		print(num_points_per_click)
		print(points_per_click)
		if num_points_per_click == 1:
			points_per_click += 19
			num_points_per_click += 1
		else:
			points_per_click += 20
		update_score_label()

func if_win():
	if score >= 1000:
		win_window.visible = true
