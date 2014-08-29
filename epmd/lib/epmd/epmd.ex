defmodule Epmd do 
    use Application

    def start(_, _) do 
        {:ok, :port} = Application.get_env(:epmd, :port)
    end

    
end