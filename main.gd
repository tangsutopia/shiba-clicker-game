extends Node2D

var score = 0
var points_per_click = 1
var num_points_per_click = 1

# windows
@onready var win_window = $WinWindow

# sound effects
@onready var hooray_effect = $HooraySoundEffect
@onready var click_effect = $ClickSoundEffect
@onready var cash_effect = $CashSoundEffect

# labels
@onready var score_label = $ScoreLabel
@onready var add_1_price_label = $ScrollContainer/VBoxContainer/AddOne/AddOneLabel
@onready var add_5_price_label = $ScrollContainer/VBoxContainer/AddFive/AddFiveLabel
@onready var add_10_price_label = $ScrollContainer/VBoxContainer/AddTen/AddTenLabel
@onready var add_20_price_label = $ScrollContainer/VBoxContainer/AddTwenty/AddTwentyLabel

# price tracking
var add_1_price = 10
var add_5_price = 40
var add_10_price = 200
var add_20_price = 500

# buttons
@onready var add_1_button = $ScrollContainer/VBoxContainer/AddOne/AddOneButton
@onready var add_5_button = $ScrollContainer/VBoxContainer/AddFive/AddFiveButton
@onready var add_10_button = $ScrollContainer/VBoxContainer/AddTen/AddTenButton
@onready var add_20_button = $ScrollContainer/VBoxContainer/AddTwenty/AddTwentyButton

# sprites
@onready var hat_sprite = $HatSprite
@onready var bandana_sprite = $BandanaSprite

@onready var accessories = [
	$HatSprite,
	$BandanaSprite
]

func _ready():
	score_label.text = "Click the Shiba to earn points!"
	add_1_price_label.text = "+1 points per click (10)"
	add_5_price_label.text = "+5 points per click (40)"
	add_10_price_label.text = "+10 points per click (200)"
	add_20_price_label.text = "+20 points per click (500)"
	hat_sprite.visible = false
	bandana_sprite.visible = false
	win_window.hide()
	
func show_accessory(accessory: Node):
	for acc in accessories:
		acc.visible = false
	accessory.visible = true
	
	# main shiba button
func _on_shiba_button_pressed():
	score += points_per_click
	click_effect.play()
	update_score_label()
	if_win()
	
	# update scores
func update_score_label():
	score_label.text = "Score: " + str(score)

# add one button
func _on_add_one_button_pressed():
	if score >= add_1_price:
		score -= add_1_price
		cash_effect.play()
		points_per_click += 1
		add_1_price += 5
		add_1_price_label.text = "+1 points per click (" + str(add_1_price) + ")"
		update_score_label()

# hat button
func _on_hat_button_pressed():
	print("Hat button works!")
	if score >= 20:
		score -= 20
		cash_effect.play()
		show_accessory(hat_sprite)
		update_score_label()

# add five button
func _on_add_five_button_pressed():
	if score >= add_5_price:
		score -= add_5_price
		cash_effect.play()
		if num_points_per_click == 1:
			points_per_click += 4
			num_points_per_click += 1
		else:
			points_per_click += 5
		add_5_price += 20
		add_5_price_label.text = "+5 points per click (" + str(add_5_price) + ")"
		update_score_label()

# bandana button
func _on_bandana_button_pressed() :
	if score >= 80:
		score -= 80
		cash_effect.play()
		show_accessory(bandana_sprite)
		update_score_label()

func _on_add_ten_button_pressed():
	if score >= add_10_price:
		score -= add_10_price
		cash_effect.play()
		if num_points_per_click == 1:
			points_per_click += 9
			num_points_per_click += 1
		else:
			points_per_click += 10
		add_10_price += 100
		add_10_price_label.text = "+10 points per click (" + str(add_10_price) + ")"
		update_score_label()
		
func _on_add_twenty_button_pressed():
	if score >= add_20_price:
		score -= add_20_price
		cash_effect.play()
		if num_points_per_click == 1:
			points_per_click += 19
			num_points_per_click += 1
		else:
			points_per_click += 20
		add_20_price += 250
		add_20_price_label.text = "+20 points per click (" + str(add_20_price) + ")"
		update_score_label()

func if_win():
	if score >= 1000:
		win_window.popup_centered()
		hooray_effect.play()

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://start.tscn")

func _on_replay_button_pressed():
	score = 0
	points_per_click = 1
	num_points_per_click = 1
	add_1_price = 10
	add_5_price = 40
	add_10_price = 200
	add_20_price = 500
	_ready()
