extends Button


func _ready():
	pass


func _on_Button_PlayAgain_pressed():
	get_tree().change_scene("res://scenes/StartMenue.tscn")
