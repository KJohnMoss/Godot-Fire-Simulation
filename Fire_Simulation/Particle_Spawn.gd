extends Node2D


var particleDensity = 250
func _ready():
	var _particle = load("res://Particle.tscn")
	for i in particleDensity:
		var particle = _particle.instance()
		add_child(particle)
