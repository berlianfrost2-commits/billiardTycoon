extends Control

var uang = 500.0
var pendapatan = 5.0
var level = 1

@onready var lbl_uang: Label
@onready var lbl_pendapatan: Label
@onready var btn_upgrade: Button

func _ready():
	var lbl_uang = Label.new()
	lbl_uang.text = "💰 Uang: %.0f" % uang
	lbl_uang.add_theme_font_size_override("font_size", 24)
	lbl_uang.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lbl_uang.position = Vector2(100, 100)
	add_child(lbl_uang)
	
	var lbl_pendapatan = Label.new()
	lbl_pendapatan.text = "+%.1f/detik" % pendapatan
	lbl_pendapatan.add_theme_font_size_override("font_size", 18)
	lbl_pendapatan.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lbl_pendapatan.position = Vector2(150, 150)
	add_child(lbl_pendapatan)
	
	var btn_upgrade = Button.new()
	btn_upgrade.text = "⬆️ Upgrade (100💰)"
	btn_upgrade.custom_minimum_size = Vector2(200, 50)
	btn_upgrade.position = Vector2(140, 250)
	btn_upgrade.pressed.connect(_on_upgrade)
	add_child(btn_upgrade)
	
	var btn_tambah = Button.new()
	btn_tambah.text = "💵 Klaim 50💰"
	btn_tambah.custom_minimum_size = Vector2(200, 50)
	btn_tambah.position = Vector2(140, 320)
	btn_tambah.pressed.connect(func(): uang += 50)
	add_child(btn_tambah)

func _process(delta):
	uang += pendapatan * delta
	get_child(0).text = "💰 Uang: %.0f" % uang

func _on_upgrade():
	if uang >= 100:
		uang -= 100
		pendapatan *= 1.5
		level += 1
		get_child(1).text = "+%.1f/detik" % pendapatan
    
