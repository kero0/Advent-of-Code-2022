import Data.List.Split (splitOn)

main :: IO ()
main = do
  txt <- readFile "data.txt"
  let ints = map (sum . map read . lines) $ splitOn "\n\n" txt :: [Int]
  print $ sum $ maxThree ints

maxThree :: [Int] -> [Int]
maxThree [a, b, c] = [a, b, c]
maxThree (a : b : c : xs) = s $ f a b c xs
  where
    s (a, b, c) = [a, b, c]
    f a b c [] = (a, b, c)
    f a b c (x : xs)
      | x > a = f x a b xs
      | x > b = f a x b xs
      | x > c = f a b x xs
      | otherwise = f a b c xs
