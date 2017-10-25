{-# LANGUAGE OverloadedStrings #-}
import Reflex.Dom

main :: IO ()
main = mainWidget $ do
  el "h2" $ text "Counter as a fold"
  evIncr <- button "Increment"
  numbs <- foldDyn (+) (0 :: Int)  (1 <$ evIncr)
  el "div" $ display numbs
