extends Node2D

@onready var timer_label = $Panel/CountdownLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/CountdownLabel.text = str("%3.2f" % $Timer.time_left)


func _on_timer_timeout():
	print("gameover")
