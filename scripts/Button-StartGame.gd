extends Button


func _ready():
	pass


func _on_ButtonStartGame_pressed():
	get_tree().change_scene("res://scenes/Level.tscn")


func _on_ButtonAbout_pressed():
	get_tree().change_scene("res://scenes/AboutScreen.tscn")
	pass
