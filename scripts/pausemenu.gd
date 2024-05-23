extends Control

signal resume

func _on_resume_pressed():
	emit_signal("resume")

func _on_quit_pressed():
	get_tree().quit()
