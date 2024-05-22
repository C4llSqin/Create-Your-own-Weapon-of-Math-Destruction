extends Control

var buttons
var terminal
var button_box
var term_sheild
var background
var pause_menu
var paused
var senario

# Called when the node enters the scene tree for the first time.
func _ready():
	buttons = [
		$ButtonBox/button0,
		$ButtonBox/button1,
		$ButtonBox/button2,
		$ButtonBox/button3,
		$ButtonBox/button4,
		$ButtonBox/button5,
		$ButtonBox/button6,
		$ButtonBox/button7
	]
	terminal = $Terminal
	button_box = $ButtonBox
	term_sheild = $term_sheild
	background = $background
	pause_menu = $PauseMenu
	paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if paused: pause_menu.hide()
		else: pause_menu.show()
		paused = !paused
	if not paused:
		if event.is_action_pressed("ui_accept"):
			terminal.skip()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not paused: 
		terminal.process_type(delta)

func handle_button(id):
	

func _on_pause_menu_resume():
	paused = false
	pause_menu.hide() # Replace with function body.

func _on_terminal_done_typing():
	for button in buttons: button.show()

func _on_button_0_pressed(): handle_button(0)
func _on_button_1_pressed(): handle_button(1) 
func _on_button_2_pressed(): handle_button(2)
func _on_button_3_pressed(): handle_button(3)
func _on_button_4_pressed(): handle_button(4)
func _on_button_5_pressed(): handle_button(5)
func _on_button_6_pressed(): handle_button(6)
func _on_button_7_pressed(): handle_button(7)
