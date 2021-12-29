module Main where 
import System.IO.Unsafe -- For development

data Movement = Forward Int | Down Int | Up Int
  deriving (Show, Eq)

-- Apparently the suffix 'P' stands for parser
movP :: String -> Movement
movP s 
  | move == "forward" = Forward $ nP n
  | move == "down" = Down $ nP n
  | move == "up" = Up $ nP n
  | otherwise = error $ "String \"" ++ s ++ "\" cannot be parsed as a Movement"
  where
    (move:n) = words s
    nP n = read (head n) :: Int

-- Part 1

data Pos = Pos Int Int
  deriving (Show, Eq)

applyP1 :: Pos -> Movement -> Pos
applyP1 (Pos x y) (Forward n) = Pos (x + n) y
applyP1 (Pos x y) (Down n)    = Pos x       (y + n)
applyP1 (Pos x y) (Up n)      = Pos x       (y - n)
 
solveP1 :: [Movement] -> Int
solveP1 ms = x * y
  where Pos x y = foldl applyP1 (Pos 0 0) ms

-- Part 2

data PosAim = PosAim Int Int Int
  deriving (Show, Eq)

applyP2 :: PosAim -> Movement -> PosAim
applyP2 (PosAim x y a) (Forward n) = PosAim (x + n) (y + a * n) a
applyP2 (PosAim x y a) (Down n)    = PosAim x y (a + n)
applyP2 (PosAim x y a) (Up n)      = PosAim x y (a - n)

solveP2 :: [Movement] -> Int
solveP2 ms = x * y
  where PosAim x y a = foldl applyP2 (PosAim 0 0 0) ms
 
main :: IO ()
main = do 
  moves <- map movP . lines <$> readFile "input" 
  print "Part 1 solution: "
  print $ solveP1 moves
  print "Part 2 solution: "
  print $ solveP2 moves

-- For development
-- {-# NOINLINE test #-}
-- test = unsafePerformIO $ lines <$> readFile "input" 
-- moves = map movP test
