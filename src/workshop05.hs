{-# LANGUAGE OverloadedStrings #-}

import Reflex
import Reflex.Dom
import Control.Applicative ((<*>), (<$>))
import Data.Text (pack, unpack)
import Text.Read (readMaybe)


main :: IO ()
main = mainWidget $ do
  el "h2" $ text "Sum 2 numbers"
  inputA <- numberInput
  text " + "
  inputB <- numberInput
  text " = "
  let sumNumber = zipDynWith (\a b -> (+) <$> a <*> b) inputA inputB
  display sumNumber

numberInput :: MonadWidget t m => m (Dynamic t (Maybe Double))
numberInput = do
  n <- textInput $ def & textInputConfig_inputType .~ "number"
                       & textInputConfig_initialValue .~ "0"
  return . fmap (readMaybe . unpack) $ _textInput_value n
