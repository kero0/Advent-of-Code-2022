import Data.Char (isAsciiLower, ord)
import Data.List (intersect, nub)

main :: IO ()
main = do
  txt <- readFile "data.txt"
  print $ sum $ map (head . map charval . nub . uncurry intersect . splitHalf) $ lines txt

splitHalf :: [a] -> ([a], [a])
splitHalf xs = splitAt (length xs `div` 2) xs

charval :: Char -> Int
charval c = 1 + if isAsciiLower c then ord c - ord 'a' else ord c - ord 'A' + 26
