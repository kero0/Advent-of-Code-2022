import Data.Char (isAsciiLower, ord)
import Data.List (intersect, nub)
import Data.List.Split (chunksOf)

main :: IO ()
main = do
  txt <- readFile "data.txt"
  print $ sum $ map (charval . head . nub . (\[x, y, z] -> x `intersect` y `intersect` z)) $ chunksOf 3 $ lines txt

charval :: Char -> Int
charval c = 1 + if isAsciiLower c then ord c - ord 'a' else ord c - ord 'A' + 26
