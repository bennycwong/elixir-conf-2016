defmodule Turtles.TurtleSupervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, nil, [name: __MODULE__])
  end

  def init(nil) do
    children = [
      worker(Turtles.Turtle, [], [restart: :transient])
    ]
    supervise(children, [strategy: :simple_one_for_one])
  end


end
