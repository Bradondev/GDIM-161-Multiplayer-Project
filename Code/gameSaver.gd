extends Node

var LoadButton = preload("res://Scenes/SaveLoaderButton.tscn")
func  Save_Game():
	var saveData = SavedData.new()
	

	
	
func MakeNewSave():
	var NewSave = SavedData.new()
	for x in range(4):
		var Leveldata =LevelData.new()
		if x == 1:
			Leveldata.Unlocked =true
			
		NewSave.Leveldata.append(Leveldata)
	ResourceSaver.save(NewSave,"res://saves/savegame.tres")
	var NewButton = LoadButton.instantiate()
	$"../LoadGamePanel/SaveHolder".add_child(NewButton)
	
	
	
func LoadGameData():
	var Data = load("res://saves/savegame.tres") as SavedData
	return Data
	#UpDate the over world
	
	
	
	
	
	
	
#func AddLoadSaves():
	#var Temp = 0
	#print_debug("load save")
	#var dir = DirAccess.open("res://saves/")
	#print_debug(dir.get_files())
	#for Saves in dir.get_files():
		#Temp+=1
		#var NewButton = LoadButton.instantiate()
		#NewButton.text = "save " + str( Temp)
		#$"../LoadGamePanel/SaveHolder".add_child(NewButton)
		
