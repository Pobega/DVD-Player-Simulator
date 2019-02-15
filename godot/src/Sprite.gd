extends Sprite

var colors = [Color(1,0,0),
			  Color(0,1,0),
			  Color(0,0,1),
			  Color(1,1,0),
			  Color(0,1,1),
			  Color(0,0,1)]
var current_color = null

func _ready():
	_change_color()

func _on_DVDLogo_bounce():
	_change_color()

func _change_color():
	# Since there's no do..while in GDScript, we use a color that
	# we'll never have in our color list (black) to force-enter the
	# while loop.
	var color = Color(0,0,0) # Black
	while(color != current_color):
		randomize()
		var random = randi() % colors.size()
		color = colors[random-1]
		current_color = color
	self.set_modulate(color)
