extends Control

signal resume

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_resume_pressed():
	emit_signal("resume")


func _on_quit_pressed():
	get_tree().quit()
