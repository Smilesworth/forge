extends Control

var meleePoints = 0
var armorPoints = 0
var resourcePoints = 0
var shards = 0

@onready var progressBar: ProgressBar = $ProgressBar

@onready var meleePointButton: Button = $MeleePoint
@onready var armorPointButton: Button = $ArmorPoint
@onready var resourcePointButton: Button = $ResourcePoint
@onready var label: Label = $Label

func _ready() -> void:
	progressBar.value_changed.connect(_on_bar_value_changed)

func _on_melee_point_pressed() -> void:
	if progressBar.value > 0:
		progressBar.value -= 25
	
func _on_bar_value_changed(newValue: float) -> void:
	if newValue <= 0:
		meleePoints += 1
		progressBar.value = 100
		meleePointButton.text = "Melee Points: " + str(meleePoints)
		
	
func _on_armor_point_pressed() -> void:
	if is_processing:
		return
	
	progressBar.value = 0
	
	var tween = create_tween()
	tween.tween_property(progressBar, "value", 100.0, 1.0)
	await tween.finished
	
	armorPoints += 1
	armorPointButton.text = "Armor Points: " + str(armorPoints)
	progressBar.value = 0
	
func _on_enemy_killed_pressed() -> void:
	shards += 1
	label.text = "Shards: " + str(shards)
	
