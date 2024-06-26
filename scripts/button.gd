extends Control

class_name WoMDButton

signal pressed

var pos_indicator: Sprite2D
var button_icon: Sprite2D
var text: RichTextLabel
var button: Button

var RESOURCEMAP_POSITION_INDICATOR = {
	1: preload("res://assets/order_numbers/1.png"),
	2: preload("res://assets/order_numbers/2.png"),
	3: preload("res://assets/order_numbers/3.png"),
	4: preload("res://assets/order_numbers/4.png"),
	5: preload("res://assets/order_numbers/5.png"),
	6: preload("res://assets/order_numbers/6.png"),
	7: preload("res://assets/order_numbers/7.png"),
	8: preload("res://assets/order_numbers/8.png"),
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pos_indicator = $position_indicator
	button_icon = $button_icon
	text = $button_name
	button = $Button

func initalize(m_show, button_text, icon_asset):
	pos_indicator.hide()
	button_icon.texture = icon_asset
	text.text = button_text
	if m_show: show()

func set_text(button_text):
	text.text = button_text

func set_order(pos):
	if pos == 0: pos_indicator.hide()
	else:
		pos_indicator.texture = RESOURCEMAP_POSITION_INDICATOR[pos]
		pos_indicator.show()
		
func _on_button_pressed():
	emit_signal("pressed")
