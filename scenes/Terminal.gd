extends Node

var textbox: RichTextLabel
var frame: int
# Called when the node enters the scene tree for the first time.
func _ready():
	textbox = $contents
	frame = 0
	#textbox = RichTextLabel.new()
	#textbox
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		textbox.visible_ratio = 1

func typeout(text: String):
	textbox.add_text(text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if textbox.visible_characters == -1:
		frame = 0
		return
	if frame % 10 == 0:
		print(textbox.visible_characters)
		textbox.visible_characters += 1
	frame += 1
	pass
