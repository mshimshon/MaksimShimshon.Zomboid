
require "TetristPackProvider";

Events.OnGameBoot.Add(function() 
	TetrisItemPackLoader.LoadAllItems()
	TetrisItemPackLoader.LoadAllContainers()
	DebugLog.log(DebugType.Lua,"[Tetris] ✓ Tetris Pack Load Loaded")
end)
