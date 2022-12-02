main :: IO ()
main = do
  txt <- readFile "data.txt"
  let ints = map ((\x -> rockPaperScissorsScore x + playScore x) . map head . words) $ lines txt
  print $ sum ints
  where
    r = read :: String -> Int

rockPaperScissorsScore :: String -> Int
rockPaperScissorsScore s
  | s == "AZ" || s == "BX" || s == "CY" = 0
  | s == "AY" || s == "BZ" || s == "CX" = 6
  | otherwise = 3

playScore :: String -> Int
playScore (_ : s : []) =
  case s of
    'X' -> 1
    'Y' -> 2
    'Z' -> 3
    _ -> 0
