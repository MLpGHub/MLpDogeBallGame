
extends KinematicBody

#var playerName ="MLpGolfBall"
var coinCounter
var velocity = Vector3(0,0,0)
const SPEED = 10
const ROTATESPEED = 6.5
var dir = Vector3()

onready var camera = $CameraPivot/Camera
onready var joystick = get_parent().get_node("Joystick/joyStick_Button")

func _ready():
	pass
	
func _process(delta):
	#var target_direction = Vector2(0,0)
	#target_direction = -joystick.get_value()
	#move_and_slide(joystick.get_value() * 800)
	pass
	
func process_input(delta):
	
	dir = Vector3()
	var cam_xform = camera.get_global_transform()

	var input_movement_vector = Vector2()
	input_movement_vector.y = -joystick.get_value().y #joystick input gonkee's
	input_movement_vector.x = joystick.get_value().x #joystick input gonkee's

	if Input.is_action_pressed("ui_up"):
		input_movement_vector.y += 1
	if Input.is_action_pressed("ui_down"):
		input_movement_vector.y -= 1
	if Input.is_action_pressed("ui_left"):
		input_movement_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_movement_vector.x += 1
	
	input_movement_vector = input_movement_vector.normalized()
	dir += -cam_xform.basis.z.normalized() * input_movement_vector.y
	dir += cam_xform.basis.x.normalized() * input_movement_vector.x
	
func _physics_process(delta):
	
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROTATESPEED))
	elif Input.is_action_pressed("ui_left"):	
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROTATESPEED))
	else:
		velocity.x = lerp(velocity.x,0,0.1)
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROTATESPEED))
	elif Input.is_action_pressed("ui_down"):	
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROTATESPEED))
	else:
		velocity.z = lerp(velocity.z,0,0.1)
	#TODO Gravity is within the (velocity) by using (velocity, ... ) 
	move_and_slide(velocity)

func _on_enemy_body_entered(body):
	if body.name == "Ball":
		get_tree().change_scene("res://scenes/GameOver.tscn")

