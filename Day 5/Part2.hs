import Data.Bifunctor (bimap)
import Data.List.Split (chunksOf)
import Data.Maybe (fromJust, isNothing)
import Data.Text (Text, pack, strip, unpack)

main :: IO ()
main = do
  txt <- readFile "data.txt"
  print
    $ map head
    $ uncurry doMoves
    $ bimap
      ( map (map fromJust . dropWhile isNothing)
          . rotate
          . map (map (toletter . unpack . strip . pack) . chunksOf 4)
          . init
      )
      (map ((\[_, num, _, from, _, to] -> (read num, read from - 1, read to - 1) :: (Int, Int, Int)) . words) . tail)
    $ break (== "")
    $ lines txt
  where
    toletter [_, c, _] = Just c
    toletter _ = Nothing

doMoves :: [String] -> [(Int, Int, Int)] -> [String]
doMoves state [] = state
doMoves state ((num, from, to) : rest) =
  flip doMoves rest $
    setAt from (drop num $ state !! from) $
      setAt to (take num (state !! from) ++ state !! to) state

setAt :: Int -> a -> [a] -> [a]
setAt i x xs = take i xs ++ [x] ++ drop (i + 1) xs
