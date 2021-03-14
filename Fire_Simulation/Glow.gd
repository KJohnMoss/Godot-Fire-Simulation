extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var size = rand_range (0.8, 1)
	self.scale.x = size
	self.scale.y = size
	self_modulate = Color8(180,180,130, 100)



func _process(delta):
	#FLICKER
	#var size = rand_range (0.9, 1)
	#self.scale.x = size
	#self.scale.y = size
	
	#FOLLOW
	self.position = get_global_mouse_position() - Vector2(0,75)
