{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Servant.Crud where

import Data.Text (Text)
import Servant

-- | A `PUT` request against `/:file` with a `JSON`-encoded request body
type PutFile =
    Capture "file" FilePath :> ReqBody '[JSON] Text :> Put '[JSON] ()

-- | A `GET` request against `/:file` with a `JSON`-encoded response body
type GetFile =
    Capture "file" FilePath :> Get '[JSON] Text

-- | A `DELETE` request against `/:file`
type DeleteFile =
    Capture "file" FilePath :> Delete '[JSON] ()

{-| The type of our REST API

    The server uses this to ensure that each API endpoint's handler has the
    correct type

    The client uses this to auto-generate API bindings
-}
type API =   PutFile
        :<|> GetFile
        :<|> DeleteFile
