extends CharacterBody2D
@onready var atacar_sfx = $atacar_sfx as AudioStreamPlayer
@export var speed: float = 150.0

func _physics_process(delta):
	var player_position = Manager.player_position
	var distancia = player_position - position
	var sensor_distancia = abs(distancia)
	var input_direction = distancia.normalized()
	
	velocity = input_direction * speed
	
	enemy_animation(sensor_distancia,player_position)
	
func enemy_animation(sensor_distancia,player_position):
	if sensor_distancia.x < 301  and  sensor_distancia.y < 301:
		direcao_enemy(player_position)
		if sensor_distancia.x < 50 and sensor_distancia.y < 50:
			var direcao_ataque = player_position.y - position.y
			atacar_sfx.play()
			if direcao_ataque > 10 :
				$AnimatedSprite2D.animation = "attack_down"
			elif direcao_ataque < -10 :
				$AnimatedSprite2D.animation = "attack_up"
			else :
				$AnimatedSprite2D.animation = "atacar"
		else :
			$AnimatedSprite2D.animation = "andar"
			move_and_slide()
	else:
		$AnimatedSprite2D.animation = "parado"
	
func direcao_enemy(player_position):
	if position > player_position:
		$AnimatedSprite2D.flip_h = true
	elif position < player_position:
		$AnimatedSprite2D.flip_h = false
