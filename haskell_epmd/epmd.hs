module EPMD where

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.Char as C
import qualified Data.ByteString.Lazy as BL
import Data.Word
import Network
import Data.Binary

data MessageId = MessageId {
    num :: Int
    , char :: Char       
} deriving Show

-- Registration and queries
_ALIVE2_REQ         = MessageId { num = 120, char = 'x' } -- 120
_ALIVE2_RESP        = MessageId { num = 121, char = 'y' } -- 121
_PORT_PLEASE2_REQ   = MessageId { num = 122, char = 'z' } -- 122
_PORT2_RESP         = MessageId { num = 119, char = 'w' } -- 119
_NAMES_REQ          = MessageId { num = 110, char = 'n' } -- 110

-- Interactive client command codes
_STOP_REQ = MessageId { num = 115, char = 's' } -- 115
_DUMP_REQ = MessageId { num = 100, char = 'd' } -- 100
_KILL_REQ = MessageId { num = 107, char = 'k' } -- 107

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
} deriving (Show)

-- sends a message to EPMD when node is started
compose_ALIVE2_REQ 