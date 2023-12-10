one :: Int
one = 1

addOne :: Int -> Int
addOne x = x + 1

addXY :: Int -> Int -> Int
addXY x y = x + y

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]

main = do
  print $ filter' (< 2) [1, 2, 3, 4, 5]
