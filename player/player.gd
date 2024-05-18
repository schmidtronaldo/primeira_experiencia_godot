extends CharacterBody2D

@onready var atacar_sfx = $atacar_sfx 
@onready var andar_sfx = $andar_sfx 
@export var speed: float = 300
@export var input_direction = false

func get_input_value():
	input_direction = Input.get_vector("mover_esquerda", "mover_direita", "mover_cima", "mover_baixo")
	var movimento = input_direction * speed
	velocity = lerp(velocity , movimento , 0.1)
	
func player_animation():	
	if input_direction :
		
		if input_direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif input_direction.x < 0:
			$AnimatedSprite2D.flip_h = true
			
		andar_sfx.play()
		$AnimatedSprite2D.animation = "andar"
		
	else:
		if Input.is_action_pressed("atacar"):
			$AnimatedSprite2D.animation = "atacar"
			atacar_sfx.play()
		else:
			$AnimatedSprite2D.animation = "parado"
	
func _physics_process(delta):
	Manager.player_position = position
	get_input_value()
	player_animation()
	move_and_slide()


