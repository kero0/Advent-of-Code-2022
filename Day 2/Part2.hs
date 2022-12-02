main :: IO ()
main = do
  txt <- readFile "data.txt"
  let ints = map ((\x -> rockPaperScissorsScore x + playScore x) . map head . words) $ lines txt
  print $ sum ints
  where
    r = read :: String -> Int

rockPaperScissorsScore :: String -> Int
rockPaperScissorsScore [_, s] = case s of
  'X' -> 0
  'Y' -> 3
  'Z' -> 6
  _ -> error "Invalid input"
rockPaperScissorsScore _ = error "Invalid input"

playScore ::
  String ->
  Int
playScore [s, s'] =
  case (s, s') of
    ('A', 'X') -> 3
    ('A', 'Y') -> 1
    ('A', 'Z') -> 2
    ('B', 'X') -> 1
    ('B', 'Y') -> 2
    ('B', 'Z') -> 3
    ('C', 'X') -> 2
    ('C', 'Y') -> 3
    ('C', 'Z') -> 1
    _ -> error "Invalid input"
playScore _ = error "Invalid input"
