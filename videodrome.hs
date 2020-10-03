{-# LANGUAGE OverloadedStrings #-}
import Control.Applicative
import Control.Monad
import Text.Regex.PCRE
import Text.Regex.PCRE.String
import Data.Maybe
import Data.Char
import System.Directory

data MovieRow = MovieRow
    Int     -- id
    String  -- filename
    String  -- title
    Int     -- year 
    Bool    -- seen
    Bool    -- removed
    String  -- created at
    String  -- updated at
    String  -- path
    deriving (Show)

movieRegex = "(.*)[ .][(]?((?:20|19)[0-9][0-9]).*" :: String
data Movie = Movie { title :: String, year :: Int } deriving Show

doBuildMovie :: (String, String, String, [String]) -> Movie
doBuildMovie (_,_,_,[title,year]) = Movie title (read year :: Int)

parseMovies :: [String] -> [Movie]
parseMovies [] = []
parseMovies (x:xs) = [ doBuildMovie ( fromMaybe ("","","",[x,"666"]) (x =~~ movieRegex :: Maybe (String, String, String, [String])))] ++ parseMovies xs

main :: IO ()
main = undefined
