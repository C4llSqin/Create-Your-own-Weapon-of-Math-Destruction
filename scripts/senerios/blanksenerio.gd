class_name senario

var button_array: Array[WoMDButton]
var term: terminal

var order_array: Array[int]

var SIMULATION_TARGET: int = 10

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
	

func _init(buttonarr, ter):
	button_array = buttonarr
	term = ter
	order_array = []

func handle_button_press(id):
	if id in order_array: 
		order_array.erase(id)
		button_array[id].set_order(0)
	else: 
		order_array.append(id)
		button_array[id].set_order(order_array.size())

func hide_all():
	for button in button_array: button.hide()

func handle_dialog_end():
	pass

func offer_choice(dict: Array[Dictionary]):
	hide_all()
	for offer in dict:
		button_array[offer['id']].initalize(true, offer['text'], offer['icon'])
		
