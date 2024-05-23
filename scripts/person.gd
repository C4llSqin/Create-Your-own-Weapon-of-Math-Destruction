extends Node

class_name person

enum AGE {FIFTEEN, SEVENTEEN, EIGHTTEEN}
enum GENDER {MALE, FEMALE, NONBINARY}
enum INCOME {NONE, FIFTEEN, THIRTY, FORTYFIVE, SIXTY, SEVENDYFIVE, NINETYPLUS}
enum CREDITSCORE {POOR, FAIR, GOOD, VERYGOOD, EXCEPTIONAL}
enum SATSCORE {NO, NINE, TEN, ELEVEN, TWELVE, THIRTEEN, FORTEEN}
enum CRIMINALRECORD {NO, YES}

var age: int
var income: int
var gender: int
var credit_score: int
var sat_score: int
var criminal_record: int

func _init(ag, incom, gende, credit_scor, sat_scor, criminal_recor):
	age = ag
	income = incom
	gender = gende
	credit_score = credit_scor
	sat_score = sat_scor
	criminal_record = criminal_recor

func save():
	return {
		"age": age,
		"income": income,
		"gender": gender,
		"credit_score": credit_score,
		"sat_score": sat_score,
		"criminal_record": criminal_record
	}
