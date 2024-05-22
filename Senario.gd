class_name senario

var button_array: Array[WoMDButton]
var terminal

var order_array: Array[int]

var SIMULATION_TARGET: int = 10

func initilize_senario(buttonarr, term):
	button_array = buttonarr
	terminal = term
	order_array = []

func handle_button_press(id):
	if id in order_array: 
		order_array.erase(id)
		button_array[id].set_order(0)
	else: 
		order_array.append(id)
		button_array[id].set_order(order_array.size())

func handle_dialog_end():
	pass
