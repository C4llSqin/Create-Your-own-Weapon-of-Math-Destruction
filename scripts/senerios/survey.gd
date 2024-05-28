extends senario

class_name survey

var progress: int

static func get_name() -> String:
	return "Retake Survey"

var RESOURCEMAP_BUTTON_ICONS = [
	load("res://assets/button_icons/red.png"),
	load("res://assets/button_icons/green.png"),
	load("res://assets/button_icons/blue.png"),
	load("res://assets/button_icons/yellow.png"),
	load("res://assets/button_icons/random.png")
]
var person_parts: Array[int]
var pers: person
var DIOLOGPARTS = [
	"Hello this is a game where you create WoMD(Weapons of Math Destruction)s, but inorder to make the senerio's more personalized we need to run through a few personal questions, If you don't feel comfirtable with the entire survey you can press the [color=yellow]'John Doe'[/color] right now to create a random person. or if you continue there is a [color=yellow]'Random'[/color] per survey question\nStarting off, [color=yellow]what is your age[/color]",
	"Next up, [color=yellow]what is your gender?[/color]",
	"Next up, [color=yellow]what is your yearly salory?[/color]",
	"Next up, [color=yellow]what is your sat scores?[/color]",
	"Next up, [color=yellow]what is your FICO® credit score?[/color]",
	"Next up, [color=yellow]do you have a criminal record[/color]",
	"Your person has been saved, loading senerio picker..."
]

func _init(buttonarr, ter):
	super(buttonarr, ter)
	progress = 0
	num_simulate = 0
	button_offers = []
	diolog("Hello this is a game where you create WoMD(Weapons of Math Destruction)s, but inorder to make the senerio's more personalized we need to run through a few personal questions, If you don't feel comfirtable with the entire survey you can press the [color=yellow]'John Doe'[/color] right now to create a random person. or if you continue there is a [color=yellow]'Random'[/color] per survey question\nStarting off, [color=yellow]what is your age[/color]")

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
		if person_parts[0] == 0: 
			person_parts.append_array([0, 0, 0, 0])
			pers = person.new(person_parts[0], person_parts[2], person_parts[1], person_parts[4], person_parts[3], person_parts[5])
			pers.save()
			progress = 6
		else: progress += 1
	
	elif progress == 2:
		if id == 7:
			id = rng.randi_range(0, 6)
		person_parts.append(id)
		progress += 1
	
	elif progress == 3:
		if id == 7:
			id = rng.randi_range(0, 5)
		person_parts.append(id)
		if person_parts[0] == 1:
			person_parts.append_array([0, 0])
			pers = person.new(person_parts[0], person_parts[2], person_parts[1], person_parts[4], person_parts[3], person_parts[5])
			pers.save()
			progress = 6
		else: progress += 1
	
	elif progress == 4:
		if id == 7:
			id = rng.randi_range(0, 4)
		person_parts.append(id)
		progress += 1
		
	elif progress == 5:
		if id == 7:
			id = rng.randi_range(0, 1)
		person_parts.append(id)
		pers = person.new(person_parts[0], person_parts[2], person_parts[1], person_parts[4], person_parts[3], person_parts[5])
		pers.save()
		progress += 1
	
	elif progress == 6: pass
	
	progress_diolog()

func progress_diolog():
	diolog(DIOLOGPARTS[progress])

func handle_dialog_end():
	if progress == 0:
		offer_manual_choice([
			{'id': 0, "text": "0-15", "icon": RESOURCEMAP_BUTTON_ICONS[0]},
			{'id': 1, "text": "16-17", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 
			{'id': 2, "text": ">=18", "icon": RESOURCEMAP_BUTTON_ICONS[2]}, 
			{'id': 7, "text": "[color=yellow]John Doe[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[4]}
		])
	elif progress == 1:
		offer_manual_choice([
			{'id': 0, "text": "[color=cyan]Male[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[2]},
			{'id': 1, "text": "[color=pink]Female[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[0]}, 
			{'id': 2, "text": "[color=purple]Non Binary[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[3]}, 
			{'id': 7, "text": "[color=yellow]Random[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[4]}
		])
	elif progress == 2:
		offer_manual_choice([
			{'id': 0, "text": "no job :(", "icon": RESOURCEMAP_BUTTON_ICONS[0]},
			{'id': 1, "text": "1 - 15k", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 
			{'id': 2, "text": "15k - 30k", "icon": RESOURCEMAP_BUTTON_ICONS[2]}, 
			{'id': 3, "text": "30k - 45k", "icon": RESOURCEMAP_BUTTON_ICONS[3]}, 
			{'id': 4, "text": "45k - 60k", "icon": RESOURCEMAP_BUTTON_ICONS[0]}, 
			{'id': 5, "text": "60k - 75k", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 
			{'id': 6, "text": "75k - 90k", "icon": RESOURCEMAP_BUTTON_ICONS[2]}, 
			{'id': 7, "text": "[color=yellow]Random[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[4]}
		])
	elif progress == 3:
		offer_manual_choice([
			{'id': 0, "text": "never took one", "icon": RESOURCEMAP_BUTTON_ICONS[0]},
			{'id': 1, "text": "400-900", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 
			{'id': 2, "text": "900-1000", "icon": RESOURCEMAP_BUTTON_ICONS[2]}, 
			{'id': 3, "text": "1000-1100", "icon": RESOURCEMAP_BUTTON_ICONS[3]}, 
			{'id': 4, "text": "1100-1200", "icon": RESOURCEMAP_BUTTON_ICONS[0]}, 
			{'id': 5, "text": "1200-1300", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 
			{'id': 6, "text": "1300-1400", "icon": RESOURCEMAP_BUTTON_ICONS[2]}, 
			{'id': 7, "text": "[color=yellow]Random[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[4]}
		])
	elif progress == 4:
		offer_manual_choice([
			{'id': 0, "text": "I have no credit", "icon": RESOURCEMAP_BUTTON_ICONS[0]},
			{'id': 1, "text": "300-579", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 
			{'id': 2, "text": "580-669", "icon": RESOURCEMAP_BUTTON_ICONS[2]}, 
			{'id': 3, "text": "670-739", "icon": RESOURCEMAP_BUTTON_ICONS[3]}, 
			{'id': 4, "text": "740-799", "icon": RESOURCEMAP_BUTTON_ICONS[0]}, 
			{'id': 5, "text": "800-850", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 

			{'id': 7, "text": "[color=yellow]Random[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[4]}
		])
	elif progress == 5:
		offer_manual_choice([
			{'id': 0, "text": "No.", "icon": RESOURCEMAP_BUTTON_ICONS[0]},
			{'id': 1, "text": "Yes.", "icon": RESOURCEMAP_BUTTON_ICONS[1]}, 

			{'id': 7, "text": "[color=yellow]Random[/color]", "icon": RESOURCEMAP_BUTTON_ICONS[4]}
		])
	elif progress == 6:
		emit_signal("senarioOver")
	
