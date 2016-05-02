require_relative "pc"

module Map

  class StartMap

  	@@scenes = {
  		'mypc' => Computer::MyPC.new,
  		'target' => Computer::Target.new,
  		'completed' => Computer::Completed.new
  	}

  	def initialize(place)
  		@place = place
  	end

    def opening_scene
      next_scene(@place)
    end

  	def next_scene(nextscene)
  		@@scenes[nextscene]
  	end

  end

end
