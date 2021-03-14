extends Sprite

const spriteSize = 250
const sizeRandMin = 0.1
const sizeRandMax = 0.5
const spawnDisplacement = (spriteSize/4)*sizeRandMax
const risingSpeed = Vector2(0,-10*sizeRandMax)

const tintR = 180
const tintG = 180
const tintB = 180
const maxA = 200


const rDecayModifier = 0.01
const gDecayModifier = 0.02
const bDecayModifier = 0.09
const aDecayRate = 3
const scaleDecayRate = 0.01*sizeRandMax


var spawnOrigin = Vector2(0,0)
var directionToOrigin
var size = 0
var distance = 0

var _r = tintR
var _g = tintG
var _b = tintB 
var alpha = maxA


func _ready():
	reset()

func _process(delta):
	move()
	decay()

func move():
	#MOVEMENT
	directionToOrigin = position.direction_to(spawnOrigin)
	position = position + directionToOrigin + risingSpeed

func decay():
	#DECAY
	distance = position.distance_to(get_global_mouse_position())
	
	_r = _r - (distance*rDecayModifier)
	_g = _g - (distance*gDecayModifier)
	_b = _b - (distance*bDecayModifier)
	alpha = alpha - aDecayRate
	self_modulate = Color8(_r, _g, _b,alpha)
	
	scale.x = scale.x - scaleDecayRate
	scale.y = scale.y - scaleDecayRate
	
	#ON DEATH
	if alpha < 1 || scale.x < 0:
		reset()

func reset():
	alpha = maxA
	_r = tintR
	_g = tintG
	_b = tintB
	self_modulate = Color8(_r, _g, _b,alpha)
	
	size = rand_range(sizeRandMin,sizeRandMax)
	scale.x = size
	scale.y = size
	
	position.x = get_global_mouse_position().x + rand_range(-spawnDisplacement, spawnDisplacement)
	position.y = get_global_mouse_position().y + rand_range(-spawnDisplacement, spawnDisplacement)

	spawnOrigin = self.position
