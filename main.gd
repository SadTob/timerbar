extends Node2D

func attempt():
	if Input.is_action_just_pressed("space") and $Bar/Target.has_overlapping_areas():
		$Bar/Target.position.x = randf_range(-310, 310)
		var width = randf_range(1, 5)
		scaleTarget(width)

func scaleTarget(width):
	$Bar/Target/TargetSprite.scale.x = width
	$Bar/Player/CollisionShape2D.shape.set_size(Vector2(10*width,32))

func _ready():
	scaleTarget(2.5)
	var tween = create_tween().set_loops()
	tween.tween_property($Bar/Player, "position", Vector2(-310,0), 1)
	tween.tween_property($Bar/Player, "position", Vector2(310,0), 2)
	tween.tween_property($Bar/Player, "position", Vector2(0,0), 1)
	

func _physics_process(delta: float):
	attempt() 
