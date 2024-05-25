extends Node

class_name WoMD

var componentss

func _init(dict):
	componentss = dict

func process_person(persona) -> float:
	var score = 0.0
	for sub_step in componentss:
		score += (sub_step['call'].call(persona) * sub_step['weight'])
	return score

func compare_two(persona, personb):
	return process_person(persona) > process_person(personb)

func sort_array(people):
	people.sort_custom(compare_two)
