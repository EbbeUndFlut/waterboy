extends Node2D

@onready var music:AudioStreamPlayer = $Music
@onready var anpfiff:AudioStreamPlayer = $Anpiff
@onready var matchTimer:Timer = $MatchTimer
@onready var waterboy:WaterBoy = $Waterboy
@onready var menuPacked:PackedScene = preload("res://src/screens/main_menu.tscn")

var matchRunning:bool=false
# Called when the node enters the scene tree for the first time.

func _ready():
	var time = matchTimer.wait_time
	waterboy.connect("main", change_to_main)
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
	anpfiff.play()
	waterboy.get_node("MatchOverLabel").visible = true
	var players = get_tree().get_nodes_in_group("friends")
	var basePoints = 100 * players.size()
	print(basePoints)
	var temp = 0.0
	for soc  in players:
		temp += soc.thirst
	var matchpoints = basePoints - temp
	var text = "%d" % matchpoints
	waterboy.get_node("MatchPointsLabel").text="Points " +text
	waterboy.get_node("MatchPointsLabel").visible = true
	waterboy.get_node("Button").visible = true
	
func change_to_main()->void:
	print("hier")
	get_tree().paused = false
	get_tree().change_scene_to_packed(menuPacked)
