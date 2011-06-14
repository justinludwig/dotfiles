import Data.Map as M
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Grid
import XMonad.Layout.Master
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Workspace
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W

-- my preferred teminal settings
myTerminal = "gnome-terminal --hide-menubar"

-- automatically manage docks (gnome-panel/dzen/xmobar/etc)
myManageHook = manageDocks

-- each layout is separated by |||
-- layout 1: grid w/ master (expand/contract by 3/100; master takes up 1/2 of screen)
-- layout 2: standard full (hides dock)
myLayoutHook = (avoidStruts $ mastered (3/100) (1/2) $ Grid) ||| Full

-- add 26 extra workspaces beyond the default 9
myWorkspaces = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

-- add keybindings (via EZConfig) to access additional workspaces
-- M = mod (alt), S = shift
myKeysToAdd = [
    ("M-<Left>", prevWS),
    ("M-<Right>", nextWS),
    ("M-S-<Left>", shiftToPrev),
    ("M-S-<Right>", shiftToNext),
    -- extra promptKeymap business to fix http://code.google.com/p/xmonad/issues/detail?id=317
    ("M-;", workspacePrompt defaultXPConfig { promptKeymap = M.fromList [((controlMask, xK_c), quit)] `M.union` promptKeymap defaultXPConfig } (windows . W.view)),
    ("M-S-;", workspacePrompt defaultXPConfig  { promptKeymap = M.fromList [((controlMask, xK_c), quit)] `M.union` promptKeymap defaultXPConfig }(windows . W.shift)),
    ("M-S-p", shellPrompt defaultXPConfig { promptKeymap = M.fromList [((controlMask, xK_c), quit)] `M.union` promptKeymap defaultXPConfig })
    ]

-- remove some keybindings that I only use accidentally
myKeysToRemove = ["M-q", "M-S-q"]

main = xmonad $ defaultConfig {
    terminal = myTerminal,
    manageHook = myManageHook <+> manageHook defaultConfig,
    layoutHook = myLayoutHook,
    workspaces = myWorkspaces
} `additionalKeysP` myKeysToAdd `removeKeysP` myKeysToRemove

