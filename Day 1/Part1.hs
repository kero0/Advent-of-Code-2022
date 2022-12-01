import Data.List.Split (splitOn)

main :: IO ()
main = do
  txt <- readFile "data.txt"
  let ints = map (sum . map read . lines) $ splitOn "\n\n" txt :: [Int]
  print $ maximum ints
