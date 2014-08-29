defmodule Epmd do 
    use Application

    def start(_, _) do 
        import Supervisor.Spec
    
        {:ok, port} = Application.fetch_env(:epmd, :port)

        children = [
            supervisor(Task.Supervisor, [[name: Epmd.Pool]]),
        ]

        opts = [strategy: :one_for_all, name: Epmd.Supervisor]
        Supervisor.start_link(children, opts)
    end

    def accept(port) do 
        {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: 0, active: false, reuseaddr: true])
    end

    
end