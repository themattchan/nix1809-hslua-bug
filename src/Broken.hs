module Broken where

import Control.Arrow
import Control.Applicative
import Control.Monad
import Data.Bool
import Data.Either
import Data.Foldable
import Data.Functor
import Data.Function
import Data.Maybe
import Data.Monoid
import Control.Monad.Trans.Reader
import Control.Monad.Trans.Class (lift)
import Control.Monad.IO.Class (MonadIO, liftIO)

import qualified Text.Printf
import qualified Data.Map as M
import qualified Data.Set as S
import qualified Data.List as L
import qualified Text.Blaze.Html4.Strict as Html
import qualified Text.Blaze.Renderer.String as Html (renderMarkup)

import System.Directory
import System.Environment
import qualified System.FilePath.Posix as FilePath
import System.FilePath.Posix hiding (addExtension)
import qualified System.Process as Process
import System.IO

import Text.Pandoc
import Text.Pandoc.Lens
import qualified Text.Pandoc.Highlighting
import Control.Lens ((<&>), (%~), (<>~), over, view, review, filtered, imapMOf, iforMOf, itraversed)
import Text.CSL.Pandoc (processCites')

import NeatInterpolation
import Data.Text (Text)
import qualified Data.Text as Text
import qualified Data.Text.IO as Text

import qualified Data.Time.Format as Date
import qualified Data.Time.Calendar as Date

import Debug.Trace

main :: IO ()
main = do
  putStrLn "blah"
