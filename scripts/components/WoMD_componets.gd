extends Node

class_name components

func normal(enumval: int, bounds: int):
	return float(enumval) / bounds

func inverse(enumval: int, bounds: int):
	return (1 - normal(enumval, bounds))

func evaluate_gender(per: person): #sexism
	return inverse(per.gender, 2)

func evaluate_age(per: person):
	return normal(per.age, 2)

func evaluate_
