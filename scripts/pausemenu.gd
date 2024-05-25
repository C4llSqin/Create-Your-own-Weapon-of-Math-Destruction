extends Control

signal resume

signal mainmenu

func _on_resume_pressed():
	emit_signal("resume")

func _on_main_menu_pressed():
	emit_signal("mainmenu")

func _on_quit_pressed():
	get_tree().quit()
