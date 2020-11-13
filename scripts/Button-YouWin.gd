extends Button


func _ready():
	pass


func _on_PlayAgain_pressed():
	get_tree().change_scene("res://StartMenue.tscn")
