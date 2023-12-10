import Data.Char (isNumber)

getLineValue :: String -> String
getLineValue "" = ""
getLineValue str@(x : xs)
  | isNumber x = [x, head v]
  | otherwise = getLineValue xs
  where
    v = getLineValue (reverse str)

sumLines :: Int -> [String] -> Int
sumLines = foldl (\acc xs -> acc + read (getLineValue xs) :: Int)

main :: IO ()
main = do
  input <- readFile "input.txt"
  print $ sumLines 0 (lines input)
