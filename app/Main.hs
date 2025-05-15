module Main where

import Audio.Fmod (backendFmod)
import Audio.Interface (AudioBackend (initAudio, loadSound, playSound, stopSound))
import Audio.SDL (backendSDL)

main :: IO ()
main = do
  let backend = backendFmod
  -- let backend = backendSDL
  sys <- initAudio backend
  sound <- loadSound backend sys "flim.mp3"
  playing <- playSound backend sys sound
  _ <- getLine
  stopSound backend sys playing
