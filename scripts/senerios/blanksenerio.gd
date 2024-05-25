class_name senario

signal senarioOver

var button_array: Array[WoMDButton]
var term: terminal
var proceed = load("res://assets/button_icons/proceed.png")
var order_array: Array[int]

var num_simulate: int
var button_offers: Array
var required_components: int
var proceedopt: bool

var introdiolog: String
var missiondiolog: String

static func get_name() -> String:
	return "Null Senrio"

func create_person():# -> person:
	var rng = RandomNumberGenerator.new()
	var age = rng.randi_range(0, 2)
	var crime = 0
	var credit = 0
	var income = 0
	var sat = 0
	var gender = rng.randi_range(0, 2)
	if age > 0: 
		income = rng.randi_range(0, 6)
		sat = rng.randi_range(0, 6)
	if age == 2:
		crime = rng.randi_range(0, 1)
		credit = rng.randi_range(0, 4)
	
	return person.new(age, income, gender, credit, sat, crime)

func diolog(text: String):
	term.typeout(text)
	hide_all()

func _init(buttonarr, ter):
	button_array = buttonarr
	term = ter
	order_array = []
	button_offers = [
		{"name": "age", "asset": load("res://assets/button_icons/red.png"), "callable": components.evaluate_age},
		{"name": "sat scores", "asset": load("res://assets/button_icons/blue.png"), "callable": components.evaluate_satscore},
		{"name": "crime rec.", "asset": load("res://assets/button_icons/green.png"), "callable": components.evaluate_criminalrecord},
		{"name": "income", "asset": load("res://assets/button_icons/yellow.png"), "callable": components.evaluate_income},
		{"name": "credit", "asset": load("res://assets/button_icons/red.png"), "callable": components.evaluate_creditscore}
	]
	#diolog("null")
	num_simulate = 10
	required_components = 3
	proceedopt = false
	
	introdiolog   = "Heya#1"
	missiondiolog = "Heya#2"
	intro()

func intro():
	diolog(introdiolog)
	proceedopt = true

func report_simulation():
	hide_all()
	var player = person.read_from_file()
	var stats = simulate(player)
	var text = "[color=red]WoMD Stats:[/color]\n - [color=yellow]Your Stats:[/color]\n   * Your position in the sea of people: [color=yellow]{pos}[/color]\n   * Your [color=red]WoMD[/color] Score: {score}".format(
		{"pos": 1 + stats[0], "score": stats[1]}
	)
	
	return [stats, text]

func simulate(added: person):# -> Array:
	var people = []
	var diolog_text = ""
	var componentss = []
	var i = 0
	var max = 0
	for id in order_array:
		componentss.append({'call': button_offers[id]["callable"], 'weight': len(order_array) - i})
		max += len(order_array) - i
		i += 1
		
	for j in range(num_simulate - 1):
		people.append(create_person())
	people.append(added)
	var model = WoMD.new(componentss)
	model.sort_array(people)
	var pos = -23
	for k in range(people.size()):
		if added.equal(people[k]): 
			pos = k
			break
	return [pos, model.process_person(added), max, people]

func handle_order():
	for button in button_array: button.set_order(0)
	var i = 1
	for id in order_array: 
		button_array[id].set_order(i)
		i += 1

func handle_button_press(id):
	if proceedopt:
		if order_array.size() == required_components:
			emit_signal("senarioOver")
			return
		else:
			diolog(missiondiolog)
			proceedopt = false
			return
	
	if id == 7:
		if order_array.size() == required_components:
			diolog(report_simulation()[1])
			proceedopt = true
		return
		
	if id in order_array: 
		order_array.erase(id)
	else: 
		order_array.append(id)
	
	if len(order_array) == required_components: button_array[7].set_text("Submit WoMD")
	else: button_array[7].set_text("[color=#7f7f7f]Submit WoMD[/color]")
	
	handle_order()

func hide_all():
	for button in button_array: button.hide()

func proceed_buttons():
	proceedopt = true
	offer_manual_choice([{'id': 7, 'text': "Continue", 'icon': proceed}])

func handle_dialog_end():
	if proceedopt:
		proceed_buttons()
	else:
		offer_choice()

func offer_choice():
	hide_all()
	var i = 0
	for offer in button_offers:
		button_array[i].initalize(true, offer['name'], offer['asset'])
		i += 1
	button_array[7].initalize(true, "[color=#7f7f7f]Submit WoMD[/color]", proceed)

func offer_manual_choice(dict):
	hide_all()
	for offer in dict:
		button_array[offer['id']].initalize(true, offer['text'], offer['icon'])
