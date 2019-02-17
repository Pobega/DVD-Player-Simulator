extends RigidBody2D

export(int) var speed = 60

signal bounce

onready var sprite = get_node("Sprite")
onready var viewport = get_viewport().get_visible_rect().size

func _ready():
	# Start in center
	position = Vector2(viewport.x/2, viewport.y/2)

	# Initialize movement in a random direction
	var linear_velocity_x = speed*.75
	var linear_velocity_y = speed

	randomize()
	if ((randi() % 2) - 1): linear_velocity_x = - speed*.75
	if ((randi() % 2) - 1): linear_velocity_y = - speed

	set_linear_velocity(Vector2(linear_velocity_x, linear_velocity_y))

func _process(delta):
	viewport = get_viewport().get_visible_rect().size

func _integrate_forces(state):
	var transform = state.get_transform()
	var size = sprite.texture.get_size() * sprite.scale
	var velocity = state.get_linear_velocity()

	if transform.origin.x < 0 + size.x/2 or transform.origin.x > viewport.x - size.x/2:
		velocity = Vector2(-velocity.x, velocity.y)
		emit_signal("bounce")
	if transform.origin.y < 0 + size.y/2 or transform.origin.y > viewport.y - size.y/2:
		velocity = Vector2(velocity.x, -velocity.y)
		emit_signal("bounce")

	state.set_linear_velocity(velocity)
