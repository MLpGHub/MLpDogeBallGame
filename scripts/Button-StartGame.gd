extends Button


func _ready():
	pass


func _on_ButtonStartGame_pressed():
	get_tree().change_scene("res://Level.tscn")


func _on_ButtonAbout_pressed():
	get_tree().change_scene("res://AboutScreen.tscn")
	pass
