extends Control

var buttons: Array[WoMDButton]
var term: Node
var button_box: Sprite2D
var term_sheild: Sprite2D
var background: Sprite2D
var pause_menu: Control
var paused: bool
var situation: senario

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
	term = $Terminal
	button_box = $ButtonBox
	term_sheild = $term_sheild
	background = $background
	pause_menu = $PauseMenu
	situation = null
	paused = false
	
	if not FileAccess.file_exists("user://person.json"): loadSenerio(survey)
	else: loadSenerio(senario_chooser)
	
func loadSenerio(type):
	if situation != null:
		situation.senarioOver.disconnect(on_senario_Over)
	situation = type.new(buttons, term)
	situation.connect("senarioOver", on_senario_Over)
	
func on_senario_Over():
	if is_instance_of(situation, senario_chooser):
		loadSenerio(situation.target)
	else:
		loadSenerio(senario_chooser)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if paused: pause_menu.hide()
		else: pause_menu.show()
		paused = !paused
	
	if event.is_action_pressed("ui_load_senerio_chooser"):
		if FileAccess.file_exists("user://person.json"): 
			loadSenerio(senario_chooser)
			if paused:
				paused = false
				pause_menu.hide()
	
	if not paused:
		if event.is_action_pressed("ui_accept"):
			term.skip()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not paused: 
		term.process_type(delta)

func handle_button(id): 
	situation.handle_button_press(id)

func _on_pause_menu_resume():
	paused = false
	pause_menu.hide()

func _on_main_menu():
	if FileAccess.file_exists("user://person.json"): 
		loadSenerio(senario_chooser)
		paused = false
		pause_menu.hide()

func _on_terminal_done_typing():
	situation.handle_dialog_end()

func _on_button_0_pressed(): handle_button(0)
func _on_button_1_pressed(): handle_button(1) 
func _on_button_2_pressed(): handle_button(2)
func _on_button_3_pressed(): handle_button(3)
func _on_button_4_pressed(): handle_button(4)
func _on_button_5_pressed(): handle_button(5)
func _on_button_6_pressed(): handle_button(6)
func _on_button_7_pressed(): handle_button(7)

