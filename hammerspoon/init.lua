-- DEFINE CONSTANTS HERE
local TERMINAL_APP_TITLE <const> = "iTerm2"
local TERMINAL_APP_FILE <const> = "iTerm.app"

local EDITOR_APP_TITLE <const> = "Code"
local EDITOR_APP_FILE <const> = "Visual Studio Code.app"

local BROWSER_APP_TITLE <const> = "Firefox"
local BROWSER_APP_FILE <const> = "Firefox.app"

local TODO_APP_TITLE <const> = "Things"
local TODO_APP_FILE <const> = "Things3.app"

local NOTES_DIRECTORY <const> = "~/Documents/notes/daily"

-- Can be gotten by hs.screen.allScreens()[1]:name() in the console
local EXTERNAL_MONITOR_NAME <const> = "C34H89x"
local INTERNAL_MONITOR_NAME <const> = "Built-in Retina Display"


-- Window management, uses Vim keybindings
hs.hotkey.bind({"alt"}, "h", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h

    win:setFrame(f)
end)

hs.hotkey.bind({"alt"}, "l", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h

    win:setFrame(f)
end)

hs.hotkey.bind({"alt"}, "k", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2

    win:setFrame(f)
end)

hs.hotkey.bind({"alt"}, "j", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2

    win:setFrame(f)
end)

-- Center 15/9 window
hs.hotkey.bind({"alt"}, "c", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local width = max.h * 15 / 9

    if width > max.w then
        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
    else
        f.x = (max.w - width) / 2
        f.y = max.y
        f.w = width
        f.h = max.h
    end

    win:setFrame(f)
end)

-- Open terminal on Option Space
hs.hotkey.bind({"alt"}, "space", function()
    -- If already in the app, make it dissapear
    if hs.application.frontmostApplication():title() == TERMINAL_APP_TITLE then
        hs.eventtap.keyStroke("cmd", "h")
    else
        hs.application.launchOrFocus(TERMINAL_APP_FILE)
    end
end)

-- Open editor on Option E
hs.hotkey.bind({"alt"}, "e", function()
    -- If already in the app, make it dissapear
    if hs.application.frontmostApplication():title() == EDITOR_APP_TITLE then
        hs.eventtap.keyStroke("cmd", "h")
    else
        hs.application.launchOrFocus(EDITOR_APP_FILE)
    end
end)

-- Open browser on Option B
hs.hotkey.bind({"alt"}, "b", function()
    -- If already in the app, make it dissapear
    if hs.application.frontmostApplication():title() == BROWSER_APP_TITLE then
        hs.eventtap.keyStroke("cmd", "h")
    else
        hs.application.launchOrFocus(BROWSER_APP_FILE)
    end
end)

-- Create new todo on Option T, even if the app is closed
-- MAKE SURE 'NEW TODO' HOTKEY IS CTRL+SPACE
hs.hotkey.bind({"alt"}, "t", function()
    local app = hs.application.get(TODO_APP_TITLE)

    if app and app:isRunning() then
        hs.eventtap.keyStroke("ctrl", "space")
    else
        hs.application.open(TODO_APP_FILE, 2, true)
        hs.eventtap.keyStroke("ctrl", "space")
    end
end)

-- New LaTeX note
hs.hotkey.bind({"alt"}, "n", function()
    local date = os.date("*t")
    local year, month, day = date.year, date.month, date.day
    local noteFile = string.format("%d%d%d.tex", year, month, day)

    local createTerminalWithBounds = string.format([[
        if application "%s" is not running then
            activate application "%s"
        end if

        tell (current date)
            set dayStamp to day
            set monthStamp to (its month as integer)
            set yearStamp to year
        end tell

        set dayTitle to (dayStamp as text)
        set dayStamp to (text -2 thru -1 of ("0" & dayStamp as text))
        set monthStamp to (text -2 thru -1 of ("0" & monthStamp as text))

        set filename to yearStamp & monthStamp & dayStamp & ".tex"

        tell application "%s"
            set newWindow to (create window with default profile)
            tell current session of newWindow
                write text "cd %s"
                write text "[ -f ./" & filename & " ] || (touch " & filename & " && echo '\\subsubsection*{Day " & dayTitle & "}' > " & filename & ")"
                write text "cd .. && make && cd daily"
                write text "nvim " & filename
            end tell
        end tell
    ]], TERMINAL_APP_TITLE, TERMINAL_APP_FILE, TERMINAL_APP_TITLE, NOTES_DIRECTORY)

    hs.osascript.applescript(createTerminalWithBounds)
end)



local center50 <const> hs.geometry.rect(0.25, 0, 0.5, 1)

-- LaTeX editor
hs.hotkey.bind({"alt"}, "o", function()
    local windowLayout
    if hs.screen.allScreens()[1]:name() == EXTERNAL_MONITOR_NAME then
        windowLayout = {
            {"Firefox", nil, EXTERNAL_MONITOR_NAME, hs.geometry.rect(0, 0, 0.3, 1), nil, nil},
            {TERMINAL_APP_TITLE, nil, EXTERNAL_MONITOR_NAME, hs.geometry.rect(0.3, 0, 0.4, 1), nil, nil},
            {"Preview", nil, EXTERNAL_MONITOR_NAME, hs.geometry.rect(0.7, 0, 0.3, 1), nil, nil},
        }
    end

    if hs.screen.allScreens()[1]:name() == INTERNAL_MONITOR_NAME then
        windowLayout = {
            {TERMINAL_APP_TITLE, nil, INTERNAL_MONITOR_NAME, hs.geometry.rect(0, 0, 0.5, 1), nil, nil},
            {"Preview", nil, INTERNAL_MONITOR_NAME, hs.geometry.rect(0.5, 0, 0.5, 1), nil, nil},
        }
    end


    hs.layout.apply(windowLayout)
end)
