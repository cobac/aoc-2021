module Main where 
import System.IO.Unsafe -- For development

-- n is the size of the stride
solve :: Int -> [Int] -> Int
  -- `fromEnum :: Bool -> Int`
solve n input = sum $ [fromEnum (next > prev) |
                       (next, prev) <-  zip (applyNTimes tail n) input]
                       -- `iterate f input !! n` applies `f` `n` times
                where applyNTimes f n = iterate f input !! n 

main :: IO ()
main = do 
  input <- map (read :: String -> Int) . lines <$> readFile "input" 
  print "Part 1 solution: "
  print $ solve 1 input
  print "Part 2 solution: "
  print $ solve 3 input 

{-# NOINLINE test #-}
test = unsafePerformIO $  map (read :: String -> Int) . lines <$> readFile "input" 
-- test = [1..10]
