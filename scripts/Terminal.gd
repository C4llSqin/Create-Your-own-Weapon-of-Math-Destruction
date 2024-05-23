extends Node

class_name terminal

signal done_typing

var TIME_PER_CHAR = 0.03
var textbox: RichTextLabel
var time: float

func _ready():
	textbox = $contents
	time = 0
	
func skip():
	textbox.visible_ratio = 1
	emit_signal("done_typing")

func typeout(text: String):
	textbox.visible_characters = 0
	textbox.text = text

func process_type(delta):
	if textbox.visible_ratio == 1:
		time = 0
		return
	time += delta
	while time > TIME_PER_CHAR:
		textbox.visible_characters += 1
		if textbox.visible_ratio == 1: 
			emit_signal("done_typing")
			return
		time -= TIME_PER_CHAR
