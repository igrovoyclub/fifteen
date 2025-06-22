extends Label

var start_time_unix:int = 0

func _ready() -> void:
	if Globals.player_state.start_time == 0:
		start_time_unix = Time.get_unix_time_from_system()
		Globals.player_state.start_time = start_time_unix
	else:
		start_time_unix = Globals.player_state.start_time
	_on_timer_timeout()

func reset():
	start_time_unix = Time.get_unix_time_from_system()
	Globals.player_state.start_time = start_time_unix

func _on_timer_timeout() -> void:
	var dict_time = Time.get_datetime_dict_from_unix_time(Time.get_unix_time_from_system() - start_time_unix)
	#day, hour, minute, second
	text = "{0}:{1}:{2}:{3}".format(["%02d"%(dict_time.get("day", "00") - 1),
	 "%02d"%dict_time.get("hour", "00"),
	 "%02d"%dict_time.get("minute", "00"),
	 "%02d"%dict_time.get("second", "00")])
	
func pause():
	$Timer.stop()
	
func start():
	start_time_unix = Time.get_unix_time_from_system()
	Globals.player_state.start_time = start_time_unix
	$Timer.start()
