extends CanvasLayer

@onready var resume_button = %ResumeButton
@onready var quit_button = %QuitButton

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS # Make sure this node runs even when paused
	visible = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	var new_pause_state = !get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	
	if new_pause_state:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # Or HIDDEN depending on project

func _on_resume_button_pressed():
	toggle_pause()

func _on_quit_button_pressed():
	get_tree().quit()
