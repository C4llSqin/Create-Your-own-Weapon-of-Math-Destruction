class_name components

static func normal(enumval: int, bounds: int):
	return (float(enumval) / bounds)

static func inverse(enumval: int, bounds: int):
	return (1 - normal(enumval, bounds))

static func evaluate_gender(per: person):
	return inverse(per.gender, 2)

static func evaluate_age(per: person):
	return normal(per.age, 2)

static func evaluate_income(per: person):
	return normal(per.income, 6)

static func evaluate_creditscore(per: person):
	return normal(per.credit_score, 4)

static func evaluate_satscore(per: person):
	return normal(per.sat_score, 6)

static func evaluate_criminalrecord(per: person):
	return 1 - per.criminal_record
