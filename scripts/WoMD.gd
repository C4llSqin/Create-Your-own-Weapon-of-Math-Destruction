extends Node

class_name WoMD

var components: Array[Dictionary]

func _init(dict):
	components = dict

func process_person(persona: person) -> float:
	var score = 0
	for sub_step in components:
		score += (sub_step['call'].call(persona) * sub_step['weight'])
	return score

func sort_array(people: Array[person]):
	people.sort_custom(process_person)
