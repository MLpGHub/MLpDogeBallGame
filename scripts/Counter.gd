extends Label

var coinsCounter = 0

func _ready():
	text = String(coinsCounter)


func _on_coin_coinCollected():
	coinsCounter = coinsCounter + 1
	_ready()
	if coinsCounter == 2:
			$Timer.start()
func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/YouWinScreen.tscn")
