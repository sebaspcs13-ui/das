extends Node

# This script is an autoload, that can be accessed from any other script!

@onready var jump_sfx = $JumpSfx
@onready var coin_pickup_sfx = $CoinPickup
@onready var death_sfx = $DeathSfx
@onready var respawn_sfx = $RespawnSfx
@onready var level_complete_sfx = $LevelCompleteSfx
@onready var music_player = $MusicPlayer

func play_jump():
	_play_sfx(jump_sfx)

func play_coin():
	_play_sfx(coin_pickup_sfx)

func play_death():
	_play_sfx(death_sfx)

func play_respawn():
	_play_sfx(respawn_sfx)

func play_level_complete():
	_play_sfx(level_complete_sfx)

func play_music(stream: AudioStream):
	if music_player.stream == stream and music_player.playing:
		return
	music_player.stream = stream
	music_player.play()

func stop_music():
	music_player.stop()

# Internal helper to play SFX with a bit of pitch variation for "juice"
func _play_sfx(player: AudioStreamPlayer):
	if player:
		# Save original pitch if not already saved (Godot doesn't have a built-in "original_pitch" property)
		# We'll just randomize around 1.0 or the current value
		player.pitch_scale = randf_range(0.9, 1.1)
		player.play()
