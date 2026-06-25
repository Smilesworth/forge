extends Control

var meleePoints = 0
var armorPoints = 0
var resourcePoints = 0

var is_processing = false
@onready var progressBar: ProgressBar = $ProgressBar

@onready var meleePointButton: Button = $MeleePoint
@onready var armorPointButton: Button = $ArmorPoint
@onready var resourcePointButton: Button = $ResourcePoint

func _on_melee_point_pressed() -> void:
	if is_processing:
		return
	
	is_processing = true
	progressBar.value = 0
	
	var tween = create_tween()
	tween.tween_property(progressBar, "value", 100.0, 1.0)
	await tween.finished
	
	meleePoints += 1
	meleePointButton.text = "Melee Points: " + str(meleePoints)
	progressBar.value = 0
	is_processing = false
	
func _on_armor_point_pressed() -> void:
	if is_processing:
		return
	
	is_processing = true
	progressBar.value = 0
	
	var tween = create_tween()
	tween.tween_property(progressBar, "value", 100.0, 1.0)
	await tween.finished
	
	armorPoints += 1
	armorPointButton.text = "Armor Points: " + str(armorPoints)
	progressBar.value = 0
	is_processing = false
