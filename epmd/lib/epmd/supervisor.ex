defmodule Epmd.Supervisor do 
    use Supervisor

    def start_link do 
        Supervisor.start_link(__MODULE__, [])
    end

    def init(_opt) do 
        children = [
            worker(Epmd, [[]]),
        ]
        supervise(children, strategy: :one_for_all)
    end
end 