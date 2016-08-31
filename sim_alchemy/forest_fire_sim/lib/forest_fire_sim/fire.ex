defmodule ForestFireSim.Fire do
  def ignite(world, xy, intensity) do
    spawn_link(__MODULE__, :advance_fire, [world, xy, intensity])
  end

  def advance_fire(_world, _xy, 0) do
    nil
  end

  def advance_fire(world, xy, intensity) do
    receive do
      :advance -> send(world, {:advance_fire, xy})
    end
    advance_fire(world, xy, intensity-1)
  end

end
