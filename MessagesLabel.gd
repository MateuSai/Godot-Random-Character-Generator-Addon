extends Label

onready var timer: Timer = get_node("Timer")


func show_message(msg: String) -> void:
	timer.stop()
	text = msg
	timer.start()


func _on_Timer_timeout() -> void:
	text = ""
