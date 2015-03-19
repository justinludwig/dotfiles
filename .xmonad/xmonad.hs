import Data.Map as M
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.Warp
import XMonad.Config.Desktop
import XMonad.Config.Gnome
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

-- automatically manage docks/panels
myManageHook = composeAll ( [
    manageHook gnomeConfig ,
    className =? "Unity-2d-panel" --> doIgnore,
    className =? "Unity-2d-launcher" --> doFloat
    ] )

-- each layout is separated by |||
-- layout 1: grid w/ master (expand/contract by 3/100; master takes up 1/2 of screen)
-- layout 2: standard full (hides dock)
-- layout 3: standard grid (equally divided rectangles)
myLayoutHook = (avoidStruts $ mastered (3/100) (1/2) $ Grid) ||| Full

-- add a bunch of extra workspaces beyond the default 9
myWorkspaces = ["1","2","3","4","5","6","7","8","9","0",
    "a","b","c","d","e","f","g","h","i","j","k","l","m",
    "n","o","p","q","r","s","t","u","v","w","x","y","z",
    "aa","bb","cc","dd","ee","ff","gg","hh","ii","jj","kk","ll","mm",
    "nn","oo","pp","qq","rr","ss","tt","uu","vv","ww","xx","yy","zz"]

-- add keybindings (via EZConfig) to access additional workspaces
-- M = mod (alt), S = shift
myKeysToAdd = [
    ("M-<Left>", prevWS),
    ("M-<Right>", nextWS),
    ("M-S-<Left>", shiftToPrev),
    ("M-S-<Right>", shiftToNext),
    ("<Print>", spawn "gnome-panel-screenshot -i"),
    ("M-<Print>", spawn "gnome-panel-screenshot -w"),
    -- move pointer to currently focused window
    ("M-S-m", warpToWindow 0 0),
    -- extra promptKeymap business to fix http://code.google.com/p/xmonad/issues/detail?id=317
    ("M-;", workspacePrompt defaultXPConfig { promptKeymap = M.fromList [((controlMask, xK_c), quit)] `M.union` promptKeymap defaultXPConfig } (windows . W.view)),
    ("M-S-;", workspacePrompt defaultXPConfig  { promptKeymap = M.fromList [((controlMask, xK_c), quit)] `M.union` promptKeymap defaultXPConfig }(windows . W.shift)),
    ("M-S-p", shellPrompt defaultXPConfig { promptKeymap = M.fromList [((controlMask, xK_c), quit)] `M.union` promptKeymap defaultXPConfig })
    ]

-- remove some keybindings that I only use accidentally
myKeysToRemove = ["M-q", "M-S-q"]

main = xmonad $ desktopConfig {
    terminal = myTerminal,
    manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig,
    layoutHook = myLayoutHook,
    workspaces = myWorkspaces
} `additionalKeysP` myKeysToAdd `removeKeysP` myKeysToRemove

