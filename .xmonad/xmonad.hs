-- IMPORTS
import qualified Data.Map as M
import Data.Monoid
import Graphics.X11.ExtraTypes.XF86
import System.Exit
import XMonad
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.Cursor
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "kitty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth = 3

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor = "#282a36"

myFocusedBorderColor = "#ff79c6"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig{XMonad.modMask = modm}) =
    M.fromList $
        -- launch a terminal
        [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal tmux a conf)
        , -- launch dmenu
          ((modm, xK_p), spawn "rofi -show run")
        , -- launch gmrun
          ((modm .|. shiftMask, xK_p), spawn "gmrun")
        , -- close focused window
          ((modm .|. shiftMask, xK_c), kill)
        , -- Rotate through the available layout algorithms
          ((modm, xK_space), sendMessage NextLayout)
        , --  Reset the layouts on the current workspace to default
          ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
        , -- Resize viewed windows to the correct size
          ((modm, xK_n), refresh)
        , -- Move focus to the next window
          ((modm, xK_Tab), windows W.focusDown)
        , -- Move focus to the next window
          ((modm, xK_j), windows W.focusDown)
        , -- Move focus to the previous window
          ((modm, xK_k), windows W.focusUp)
        , -- Move focus to the master window
          ((modm, xK_m), windows W.focusMaster)
        , -- Swap the focused window and the master window
          ((modm, xK_Return), windows W.swapMaster)
        , -- Swap the focused window with the next window
          ((modm .|. shiftMask, xK_j), windows W.swapDown)
        , -- Swap the focused window with the previous window
          ((modm .|. shiftMask, xK_k), windows W.swapUp)
        , -- Shrink the master area
          ((modm, xK_h), sendMessage Shrink)
        , -- Expand the master area
          ((modm, xK_l), sendMessage Expand)
        , -- Push window back into tiling
          ((modm, xK_t), withFocused $ windows . W.sink)
        , -- Increment the number of windows in the master area
          ((modm, xK_comma), sendMessage (IncMasterN 1))
        , -- Deincrement the number of windows in the master area
          ((modm, xK_period), sendMessage (IncMasterN (-1)))
        , -- Toggle the status bar gap
          -- Use this binding with avoidStruts from Hooks.ManageDocks.
          -- See also the statusBar function from Hooks.DynamicLog.
          --
          -- ((modm              , xK_b     ), sendMessage ToggleStruts),

          -- Quit xmonad
          ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
        , -- Restart xmonad
          ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
        , -- Run xmessage with a summary of the default keybindings (useful for beginners)
          ((modm .|. shiftMask, xK_slash), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
        ]
            ++
            --
            -- mod-[1..9], Switch to workspace N
            -- mod-shift-[1..9], Move client to workspace N
            --
            [ ((m .|. modm, k), windows $ f i)
            | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
            , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
            ]
            ++
            --
            -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
            -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
            --
            [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
            | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..]
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
            ]
            ++
            --
            -- control brightness keys
            --
            [ ((0, xF86XK_MonBrightnessUp), spawn "lux -a 10%")
            , ((0, xF86XK_MonBrightnessDown), spawn "lux -s 10%")
            , ((0, xF86XK_KbdBrightnessUp), spawn "brightnessctl --device='tpacpi::kbd_backlight' +30%")
            , ((0, xF86XK_KbdBrightnessDown), spawn "brightnessctl --device='tpacpi::kbd_backlight' -30%")
            ]
            ++
            --
            -- control volume keys
            --
            [ ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
            , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
            , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
            , ((0, xF86XK_AudioMicMute), spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
            ]
            ++
            --
            -- control other quick keys
            --
            -- manage external displays
            -- TODO
            -- open notification center
            [ ((0, xF86XK_Display), spawn "dunstctl set-paused @DEFAULT_SINK@ toggle")
            , ((0, xF86XK_WLAN), spawn "nmcli radio wifi toggle")
            , -- open snipping tool
              ((0, xF86XK_Launch2), spawn "flameshot gui")
            , -- enter sleep mode
              ((0, xF86XK_Sleep), spawn "systemctl suspend")
            ]
            ++
            --
            -- control screen lock
            --
            [ ((modm .|. shiftMask, xK_l), spawn "slock")
            ]
            ++
            --
            -- switch window transparency
            --
            [ ((modm, xK_t), spawn "/home/amoehring99/.config/picom/switch_transparency.sh")
            ]
            ++
            --
            -- hide xmobar
            --
            [ ((modm, xK_b), spawn "/home/amoehring99/.xmonad/toggleXmobar.sh")
            ]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig{XMonad.modMask = modm}) =
    M.fromList $
        -- mod-button1, Set the window to floating mode and move by dragging
        [
            ( (modm, button1)
            , ( \w ->
                    focus w
                        >> mouseMoveWindow w
              )
            )
        , -- mod-button2, Raise the window to the top of the stack
          ((modm, button2), (\w -> focus w >> windows W.swapMaster))
        , -- mod-button3, Set the window to floating mode and resize by dragging

            ( (modm, button3)
            , ( \w ->
                    focus w
                        >> mouseResizeWindow w
              )
            )
            -- you may also bind events to the mouse scroll wheel (button4 and button5)
        ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2

    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook =
    composeAll
        [ className =? "MPlayer" --> doFloat
        , className =? "Gimp" --> doFloat
        , resource =? "desktop_window" --> doIgnore
        , resource =? "kdesktop" --> doIgnore
        ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook

--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    spawnOnce "nitrogen --restore &"

--  spawnOnce "/home/amoehring99/.config/picom/switch_transparency.sh true &"
--  spawnOnce "xmobar /home/amoehring99/.xmonad/.xmobarrc"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main =
    xmonad $
        docks
            def
                { terminal = myTerminal
                , focusFollowsMouse = myFocusFollowsMouse
                , clickJustFocuses = myClickJustFocuses
                , borderWidth = myBorderWidth
                , modMask = myModMask
                , workspaces = myWorkspaces
                , normalBorderColor = myNormalBorderColor
                , focusedBorderColor = myFocusedBorderColor
                , -- key bindings
                  keys = myKeys
                , mouseBindings = myMouseBindings
                , -- hooks, layouts
                  layoutHook = myLayout
                , manageHook = myManageHook
                , handleEventHook = myEventHook
                , logHook = myLogHook
                , startupHook = myStartupHook
                }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help =
    unlines
        [ "The default modifier key is 'alt'. Default keybindings:"
        , ""
        , "-- launching and killing programs"
        , "mod-Shift-Enter  Launch xterminal"
        , "mod-p            Launch dmenu"
        , "mod-Shift-p      Launch gmrun"
        , "mod-Shift-c      Close/kill the focused window"
        , "mod-Space        Rotate through the available layout algorithms"
        , "mod-Shift-Space  Reset the layouts on the current workSpace to default"
        , "mod-n            Resize/refresh viewed windows to the correct size"
        , ""
        , "-- move focus up or down the window stack"
        , "mod-Tab        Move focus to the next window"
        , "mod-Shift-Tab  Move focus to the previous window"
        , "mod-j          Move focus to the next window"
        , "mod-k          Move focus to the previous window"
        , "mod-m          Move focus to the master window"
        , ""
        , "-- modifying the window order"
        , "mod-Return   Swap the focused window and the master window"
        , "mod-Shift-j  Swap the focused window with the next window"
        , "mod-Shift-k  Swap the focused window with the previous window"
        , ""
        , "-- resizing the master/slave ratio"
        , "mod-h  Shrink the master area"
        , "mod-l  Expand the master area"
        , ""
        , "-- floating layer support"
        , "mod-t  Push window back into tiling; unfloat and re-tile it"
        , ""
        , "-- increase or decrease number of windows in the master area"
        , "mod-comma  (mod-,)   Increment the number of windows in the master area"
        , "mod-period (mod-.)   Deincrement the number of windows in the master area"
        , ""
        , "-- quit, or restart"
        , "mod-Shift-q  Quit xmonad"
        , "mod-q        Restart xmonad"
        , "mod-[1..9]   Switch to workSpace N"
        , ""
        , "-- Workspaces & screens"
        , "mod-Shift-[1..9]   Move client to workspace N"
        , "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3"
        , "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3"
        , ""
        , "-- Mouse bindings: default actions bound to mouse events"
        , "mod-button1  Set the window to floating mode and move by dragging"
        , "mod-button2  Raise the window to the top of the stack"
        , "mod-button3  Set the window to floating mode and resize by dragging"
        ]
