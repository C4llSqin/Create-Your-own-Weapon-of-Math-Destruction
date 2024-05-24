extends senario

class_name senario_nuke

static func get_name() -> String:
	return "Nuke"

func _init(buttonarr, ter):
	super(buttonarr, ter)
	button_offers = [
		{"name": "age", "asset": load("res://assets/button_icons/red.png"), "callable": components.evaluate_age},
		{"name": "sat scores", "asset": load("res://assets/button_icons/blue.png"), "callable": components.evaluate_satscore},
		{"name": "crime rec.", "asset": load("res://assets/button_icons/green.png"), "callable": components.evaluate_criminalrecord},
		{"name": "income", "asset": load("res://assets/button_icons/yellow.png"), "callable": components.evaluate_income},
		{"name": "credit", "asset": load("res://assets/button_icons/red.png"), "callable": components.evaluate_creditscore}
	]
	#diolog("")
	introdiolog = "A nuke just launched and you are the person in task of making the math mathical model of the 1000 people that get into the bunker, the other 1500 get left outside. [color=yellow]It's your job to select the Smartest people who can enter the bunker[/color]"
	missiondiolog = "Choose the wisest people to rebuild humanity"
	num_simulate = 2500
	intro()
