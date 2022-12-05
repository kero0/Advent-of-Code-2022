import Data.List.Extra (splitOn)

main :: IO ()
main = do
  txt <- readFile "data.txt"
  print $
    length $
      filter (\[[a, b], [c, d]] -> a >= c && a <= d || c >= a && c <= b) $
        map (map (map read . splitOn "-" :: String -> [Int]) . splitOn ",") $
          lines txt
