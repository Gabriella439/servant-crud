import Control.Monad.IO.Class (liftIO)
import Servant (Proxy(..), (:<|>)(..))
import Servant.Crud (API, DeleteFile, GetFile, PutFile)
import Servant.Server (Server, serve)

import qualified Data.Text.IO             as Text
import qualified Network.Wai.Handler.Warp as Warp
import qualified System.Directory         as Directory

-- | Handler for the `PutFile` endpoint
putFile :: Server PutFile
putFile file contents = liftIO (Text.writeFile file contents)

-- | Handler for the `GetFile` endpoint
getFile :: Server GetFile
getFile file = liftIO (Text.readFile file)

-- | Handler for the `DeleteFile` endpoint
deleteFile :: Server DeleteFile
deleteFile file = liftIO (Directory.removeFile file)

-- | Handler for the entire REST `API`
server :: Server API
server = putFile
    :<|> getFile
    :<|> deleteFile

-- | Serve the `API` on port 8080
main :: IO ()
main = Warp.run 8080 (serve (Proxy :: Proxy API) server)
