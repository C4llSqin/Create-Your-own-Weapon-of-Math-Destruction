extends senario

class_name senario_job_application

static func get_name() -> String:
	return "Job App."

func _init(buttonarr, ter):
	super(buttonarr, ter)
	button_offers[3] = {"name": "gender", "asset": load("res://assets/button_icons/yellow.png"), "callable": components.evaluate_gender}
	introdiolog = "You are an consultant for some generic super market chain. [color=yellow]Your job is to make a model to pick the best candidate[/color] even though per the stores [i]personality blind[/i] policy you have no quantifyable metric for how good they are as a worker. But you might be able to find some proxys."
	missiondiolog = "Pick the best candidate"
	num_simulate = 6
	intro()

func report_simulation():
	hide_all()
	var player = person.read_from_file()
	var stats = simulate(player)
	var data = {}
	var winner = stats[3][0]
	if winner.equal(player):
		winner = stats[3][1]
	
	if winner.gender == 2: data["gender"] = "non-binary person"
	elif winner.gender == 1: data["gender"] = "female"
	else: data["gender"] = "male"
	
	if winner.criminal_record == 0: data["crim"] = "no"
	else: data["crim"] = "a"
	
	if winner.credit_score == 5: data["creditscore"] = "800-850"
	elif winner.credit_score == 4: data["creditscore"] = "740-799"
	elif winner.credit_score == 3: data["creditscore"] = "670-739"
	elif winner.credit_score == 2: data["creditscore"] = "580-669"
	elif winner.credit_score == 1: data["creditscore"] = "300-579"
	else: data["creditscore"] = "0"
	
	if winner.credit_score == 1: data["satscore"] =   "400-900"
	elif winner.credit_score == 2: data["satscore"] = "900-1000"
	elif winner.credit_score == 3: data["satscore"] = "1000-1100"
	elif winner.credit_score == 4: data["satscore"] = "1100-1200"
	elif winner.credit_score == 5: data["satscore"] = "1200-1300"
	elif winner.credit_score == 6: data["satscore"] = "1300+"
	else: data["satscore"] = "0"

	var text = "[color=red]WoMD Stats:[/color]\n - [color=yellow]Your Job Hire:[/color]\n   * A {gender} with {crim} crimal reccord, a credit score of {creditscore} and a sat score of {satscore}".format(
		data
	)
	
	
	return [stats, text]
