extends Node2D

@onready var music:AudioStreamPlayer = $Music
@onready var anpfiff:AudioStreamPlayer = $Anpiff
@onready var matchTimer:Timer = $MatchTimer
@onready var waterboy:WaterBoy = $Waterboy

var matchRunning:bool=false
# Called when the node enters the scene tree for the first time.

func _ready():
	var time = matchTimer.wait_time
	waterboy.get_node("MatchTimerLabel").set_text(str(time))

func _process(delta):
	if  matchRunning:
		var text = "%d" % matchTimer.time_left
		waterboy.get_node("MatchTimerLabel").set_text(text)
	
func _on_anpiff_finished():
	music.play()
	get_tree().call_group("soccer","anpfiff")
	matchRunning = true
	matchTimer.start()


func _on_match_timer_timeout():
	get_tree().paused = true
	waterboy.get_node("MatchOverLabel").visible = true
