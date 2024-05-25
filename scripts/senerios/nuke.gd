extends senario

class_name senario_nuke

static func get_name() -> String:
	return "Nuke"

func _init(buttonarr, ter):
	super(buttonarr, ter)
	
	introdiolog = "A nuke just launched. In the small town you stay in, there are 2500 people and a bunker, however that bunker can only house 1000 people. You are the person in task of making the mathematical model of that deems the worthyness of the 1000 people that get into the bunker, the other 1500 get left outside. [color=yellow]It's your job to select the Smartest people who can enter the bunker[/color]"
	missiondiolog = "Choose the wisest people to rebuild humanity"
	num_simulate = 2500
	intro()

func report_simulation():
	var res = super.report_simulation()
	var stats = res[0]
	var text = res[1]
	if stats[0] > 1000: text += "\n   * You were left out side. In your final moments you camped out in the target refregerated pizza isle, due to your calculations the pizza would be in the perfect range where they would be perfectly cooked. Unfortunatly you were also perfectly cooked."
	else : text += "\n   * You made it into the bunker."
	return [stats, text]
