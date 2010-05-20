import XMonad
import XMonad.Actions.CycleWS
import XMonad.Layout.Grid
import XMonad.Layout.Master
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Workspace
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W

-- each layout is separated by |||
-- layout 1: grid w/ master (expand/contract by 3/100; master takes up 1/2 of screen)
-- layout 2: standard full
myLayoutHook = mastered (3/100) (1/2) $ Grid ||| Full

-- add 11 extra workspaces beyond the default 9 (workspaces can be named anything, not just numbers)
myWorkspaces = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]

-- add keybindings (via EZConfig) to access additional workspaces
-- M = mod (alt), S = shift
myKeys = [
    ("M-<Left>", prevWS),
    ("M-<Right>", nextWS),
    ("M-S-<Left>", shiftToPrev),
    ("M-S-<Right>", shiftToNext),
    ("M-;", workspacePrompt defaultXPConfig (windows . W.view)),
    ("M-S-;", workspacePrompt defaultXPConfig (windows . W.shift)),
    ("M-S-p", shellPrompt defaultXPConfig)
    ]

main = xmonad $ defaultConfig {
    layoutHook = myLayoutHook,
    workspaces = myWorkspaces
} `additionalKeysP` myKeys

