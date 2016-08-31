defmodule ForestFireSim.World do
  alias ForestFireSim.Forest
  def create(forest, fire_starter) do
    fire_starter.({{0,0}, 4})
    spawn_link(__MODULE__, :loop, [forest]) 
  end

  def loop(forest) do
    forest = receive do
      {:advance_fire, xy} -> 
        forest
        |> Forest.reduce_fire(xy)
        |> Forest.spread_fire(xy)
        |> elem(0)
      {:debug_location, xy, reply_to} -> 
        send(reply_to, {:debug_location_response, Forest.get_location(forest, xy)})
        forest
    end
    loop(forest)
  end
end
