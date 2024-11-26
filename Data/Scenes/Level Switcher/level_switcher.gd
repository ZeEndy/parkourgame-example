extends Control

class DLL:
	var Prev
	var Next
	var Data # we use this data as a path to the next level

var Head = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Head = DLL.new()
	Head.Data="res://Data/Scenes/Levels/Level 1.tscn"
	Head.Next=DLL.new()
	Head.Next.Data="res://Data/Scenes/Levels/Level 2.tscn"
	Head.Next.Prev=Head
	Head.Next.Next=DLL.new()
	Head.Next.Next.Data="res://Data/Scenes/Levels/Level 3.tscn"
	Head.Next.Next.Prev=Head.Next
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func SwitchToNextLevel():
	get_tree().call_deferred("change_scene_to_file",Head.Data)
	if Head.Next!=null:
		Head=Head.Next
		Head.Prev=null
		var CurrentIndex=Head
		while CurrentIndex!=null:
			CurrentIndex=CurrentIndex.Next
