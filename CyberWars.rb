require "./assets/objects/engine"
require "./assets/objects/map"
require "./assets/objects/pc"

newmap = Map::StartMap.new('mypc')

newgame = Engine::StartEngine.new(newmap)

newgame.play
