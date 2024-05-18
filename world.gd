extends Node2D
@onready var bgMusic = $bgMusic as AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	bgMusic.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
