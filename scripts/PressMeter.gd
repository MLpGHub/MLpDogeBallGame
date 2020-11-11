extends Node2D

var stamina = 0;
var current_angle = -1.6
var max_angle = 4.7
var min_angle = -1.6
func draw():
	#draw_arc(center: Vector2, radius: float, start_angle: float, end_angle: float, point_count: int, color: Color, width: float = 1.0, antialiased: bool = false)
	#draw_arc(Vector2(0,0),40,4.7,0,800,Color('#71e958'),10,true)
	draw_stamina_meter(Vector2(0,0),40,37,current_angle,Color('#71e958'))
	draw_stamina_meter(Vector2(0,0),70,11,current_angle,Color('#ff3434'))
func draw_stamina_meter(pos,size,width,current,color):
	# Background Circle
	draw_arc(pos,size,max_angle,min_angle,800,Color(0,0,0,0.5),width,true)
	# Foreground Circle
	draw_arc(pos,size,max_angle,current,800,color,width,true)
func _process(delta):
		if Input.is_action_pressed("press_spacebar"):
			if stamina<100:
				stamina += 1
		elif stamina > 0:
			stamina -= 1
		#if Input.is_action_just_released("press_spacebar"):
			#while(true):
				#stamina -= 1
		#stamina = clamp(stamina,0,100)
		var value =((min_angle *-1) + max_angle) / 100
		current_angle = max_angle - (stamina * value)
		print(stamina)
   
		#if Input.is_action_pressed("press_spacebar") or Input.is_action_just_released("press_spacebar"):
		update()
