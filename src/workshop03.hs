{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}
import Reflex.Dom

main :: IO ()
main = mainWidget $ do
  el "h2" $ text "Counter as a fold"
  rec el "div" $ display numberSum
      evIncr <- button "Increment"
      numberSum <- foldDyn (+) (0 :: Int)  (1 <$ evIncr)
  -- last statement in 'do' must be an expression
  return ()
