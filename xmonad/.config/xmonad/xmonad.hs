-- import XMonad
-- import XMonad.Hooks.DynamicLog
-- import XMonad.Hooks.ManageDocks
-- import XMonad.Util.Run(spawnPipe)
-- import XMonad.Util.EZConfig(additionalKeysP)
-- import XMonad.Util.Ungrab
-- import System.IO
-- 
-- main :: IO ()
-- main = xmonad $ myConfig
-- 
-- myConfig = def
--     { modMask = mod4Mask  -- Rebind Mod to the Super key
--     }
--     `additionalKeysP`
--     [ ("M-S-z", spawn "xscreensaver-command -lock")
--     , ("M-S-t", spawn "kitty"                     )
--     , ("M-S-b", spawn "chrome"                    )
--     , ("M-S-s", spawn "slack"                     )
--     , ("M-S-p", spawn "postman"                   )
--     , ("M-C-p", unGrab *> spawn "scrot -s"        )
--     ]
--
import XMonad
main :: IO ()
main = xmonad def
