module EPMD where

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import Data.Word
import Network

data MessageId = MessageId Char

_ALIVE2_REQ  = MessageId 'x' -- 120
_ALIVE2_RESP = MessageId 'y' -- 121

_PORT_PLEASE2_REQ = MessageId 'z' -- 122
_PORT2_RESP       = MessageId 'w' -- 119

_NAMES_REQ = MessageId 'n' -- 110

_STOP_REQ = MessageId 's' -- 115

_DUMP_REQ = MessageId 'd' -- 100

_KILL_REQ = MessageId 'k' -- 107

data NodeInfo = NodeInfo { 
    fullName :: String
    , name :: String
    , domain :: String
    , port :: Word16
    , _type :: Word8
    , protocol :: Word8
    , highVsn :: Word16
    , lowVsn :: Word16
    , extra :: [B.ByteString]
    , creation :: Word16
}

-- sends a message to EPMD when node is started
-- alive2_req 