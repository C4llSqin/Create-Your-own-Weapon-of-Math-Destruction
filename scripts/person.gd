extends Node

class_name person

enum AGE {FIFTEEN, SEVENTEEN, EIGHTTEEN}
enum GENDER {MALE, FEMALE, NONBINARY}
enum INCOME {NONE, FIFTEEN, THIRTY, FORTYFIVE, SIXTY, SEVENDYFIVE, NINETYPLUS}
enum SATSCORE {NO, NINE, TEN, ELEVEN, TWELVE, THIRTEEN, FORTEEN}
enum CREDITSCORE {POOR, FAIR, GOOD, VERYGOOD, EXCEPTIONAL}
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

func equal(other):
	return other.get_instance_id() == get_instance_id()

func save():
	var data = {
		"age": age,
		"income": income,
		"gender": gender,
		"credit_score": credit_score,
		"sat_score": sat_score,
		"criminal_record": criminal_record
	}
	var jay_son = JSON.stringify(data)
	var file = FileAccess.open("user://person.json", FileAccess.WRITE)
	file.store_string(jay_son)
	

static func read_from_file() -> person:
	var file = FileAccess.open("user://person.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	return person.new(data["age"], data["income"], data["gender"], data["credit_score"], data["sat_score"], data["criminal_record"])
