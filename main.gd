extends Node2D
class_name Main


signal on_something_happen
signal health_signal

@onready var sprite_2d = $Sprite2D


var my_variable : bool = false:
	set(value):
		my_variable = value
		on_something_happen.emit()
	get:
		return my_variable


var health : float = 100.0:
	set(value):
		health = clamp(value, 0, 100)
		health_signal.emit()
		if health == 90:
			connect("health_signal", rotasi_image)
	get:
		return health

func _ready():
	my_variable = true
	print(my_variable)
	

func rotasi_image():
	print("Rotation")
	sprite_2d.rotation = PI/2


func _on_button_pressed():
	health -= 5
	%Label.text = str(health)
	print(health)
