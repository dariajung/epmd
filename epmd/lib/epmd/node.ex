defmodule Epmd.Node do 
    defstruct [port: 0, type: 77, protocol: 0, high_version: 5, 
    low_version: 5, nlen: 0, name: "", elen: 0, extra: 0, pid: nil, ref: nil]
end