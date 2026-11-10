extends Control

var uang: float = 500.0
var pendapatan: float = 5.0

func _process(delta):
	uang += pendapatan * delta
	queue_redraw()

func _draw():
	var font = ThemeDB.get_default_font()
	var font_size = 24
	var color = Color(1, 1, 1)
	
	draw_string(font, Vector2(30, 80), "💰 Uang: %.0f" % uang, HORIZONTAL_ALIGNMENT_LEFT, 400, font_size, color)
	draw_string(font, Vector2(30, 130), "+%.1f/detik" % pendapatan, HORIZONTAL_ALIGNMENT_LEFT, 400, 18, color)
	draw_string(font, Vector2(30, 230), "👇 Ketuk layar = Upgrade (100💰)", HORIZONTAL_ALIGNMENT_LEFT, 440, 16, color)

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		if uang >= 100:
			uang -= 100
			pendapatan *= 1.5
