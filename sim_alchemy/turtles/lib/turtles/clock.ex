defmodule Turtles.Clock do
  use GenServer
  alias Turtles.World
  alias Turtles.Turtle

  def start_link(world, size, starter) do
    GenServer.start_link(__MODULE__, {world, size, starter})
  end

  def advance(clock) do
    GenServer.call(clock, :advance)
  end

  def init({world, {width, height} = size, starter} = state) do
    plant_count = round(width * height * 0.2)

    all = grid_locations(width, height)
    plant_locations = grid_locations(width, height) |> Enum.shuffle |> Enum.take(plant_count)
    turtle_locations = grid_locations(width, height) |> Enum.shuffle |> Enum.take(300)

    World.place_plants(world, plant_locations)
    World.place_turtles(world, turtle_locations)
     
    turtle_pids = turtle_locations |> Enum.map(fn location ->
      starter.([world, size, starter, location])
    end) |> elem(1)
    {:ok, {world, {width, height} = size, starter, turtle_pids}}
  end

  def grid_locations(width, height) do
      for x <- 0..(width-1),
          y <- 0..(height-1),
          do: {x, y}
  end

  def handle_call(:advance, _from, {world, {width, height} = size, starter, turtle_pids} = state) do
    turtle_pids |> Enum.map(fn turtle ->
      case Turtle.act(turtle) do
        :ok -> [turtle]
        new_turtle -> [new_turtle, turtle]
      end
    end)
    {:reply, :ok, state}

  end


end

