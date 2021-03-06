module Cardano.Db
  ( module X
  , showProtVer
  , transactionCommit

  -- Data types from Cardano.Db.Schema:
  , Block (..)
  , Tx (..)
  , TxIn (..)
  , TxOut (..)
  ) where

import           Cardano.Db.Delete as X
import           Cardano.Db.Error as X
import           Cardano.Db.Insert as X
import           Cardano.Db.Migration as X
import           Cardano.Db.Migration.Version as X
import           Cardano.Db.PGConfig as X
import           Cardano.Db.Query as X
import           Cardano.Db.Run as X
import           Cardano.Db.Schema as X
import           Cardano.Db.Schema.Orphans (showProtVer)
import           Cardano.Db.Types as X

import           Control.Monad.IO.Class (MonadIO)
import           Control.Monad.Trans.Reader (ReaderT)

import           Database.Persist.Sql (IsolationLevel (Serializable), SqlBackend,
                   transactionSaveWithIsolation)

transactionCommit :: MonadIO m => ReaderT SqlBackend m ()
transactionCommit = transactionSaveWithIsolation Serializable
