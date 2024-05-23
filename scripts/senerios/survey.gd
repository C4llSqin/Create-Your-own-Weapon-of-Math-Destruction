extends senario

class_name survey

var progress: int
var RESOURCEMAP_BUTTON_ICONS = [
	load("res://assets/button_random.png")
]
var person_parts: Array[int]
var pers

func _init(buttonarr, ter):
	super(buttonarr, ter)
	progress = 0
	diolog("Hello this is a game where you create WoMD(Weapons of Math Destruction)s, but inorder to make the senerio's more personalized we need to run through a few personal questions, If you don't feel comfirtable with the entire survey you can press the [color=yellow]'John Doe'[/color] right now to create a random person. or if you continue there is a [color=yellow]'Random'[/color] per survey question\nStarting off, [color=yellow]what is your age[/color]")

func diolog(text: String):
	term.typeout(text)
	hide_all()

func handle_button_press(id):
	var rng = RandomNumberGenerator.new()
	if progress == 0:
		if id == 7:
			pers = create_person()
			progress = 6
		else: 
			person_parts.append(id)
			progress += 1
			diolog("Next up, [color=yellow]what is your gender[/color]?")
	
	elif progress == 1:
		if id == 7:
			id = rng.randi_range(0, 2)
		person_parts.append(id)
		if person_parts[0] == 0: progress = 6
	
	elif progress == 2:
		if id == 7:
			id = rng.randi_range(0, 2)
		person_parts.append(id)
		if person_parts[0] == 0: progress = 6
	
	

func handle_dialog_end():
	if progress == 0:
		offer_choice([
			{'id': 0, "text": "0-15", "icon": RESOURCEMAP_BUTTON_ICONS[0]},
			{'id': 1, "text": "16-17", "icon": RESOURCEMAP_BUTTON_ICONS[0]}, 
			{'id': 2, "text": ">=18", "icon": RESOURCEMAP_BUTTON_ICONS[0]}, 
			{'id': 7, "text": "[color=yellow]John Doe[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[0]}
		])
	elif progress == 1:
		pass
