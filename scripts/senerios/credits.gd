extends senario

class_name senario_credits

static func get_name() -> String:
	return "Credits"

func _init(buttonarr, ter):
	super(buttonarr, ter)
	introdiolog = """Game Credits:
 - Game by Zachary Wilke
 - Based of the book entitled [i][font_size=24]Weapons of Math Destruction[/font_size][/i] by Cathy O'Neil
 - Writen in the Godot Engine, version 4.2.2
 - Source code is available at: [url]https://github.com/C4llSqin/Create-Your-own-Weapon-of-Math-Destruction[/url] [font_size=18](sorry no clickable link for you)[/font_size]
 - Shoutouts to Mr. Ruffer for being an overall cool dude."""
	intro()
	
func handle_button_press(id):
	hide_all()
	emit_signal("senarioOver")
