extends senario

class_name senario_chooser

var CHOICES = [
	#senario,
	senario_nuke,
	senario_job_application,
	senario_credits,
	survey
]

var ICON = load("res://assets/button_icons/green.png")

var target

static func get_name() -> String:
	return "Senerio Chooser"

func make_button_offers():
	var arr = []
	var id = 0
	for choice in CHOICES:
		arr.append({'id': id, 'text': choice.get_name(), 'icon': ICON})
		id += 1
	return arr

func _init(buttonarr, ter):
	super(buttonarr, ter)
	num_simulate = 0
	button_offers = []
	diolog("Chose Your Senerio")
	offer_manual_choice(make_button_offers())
	target = null

func handle_dialog_end(): pass

func handle_button_press(id):
	target = CHOICES[id]
	emit_signal("senarioOver")
