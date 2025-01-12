hs.alert.show('Hammer Spoon Online')
hs.hotkey.bind({'option', 'cmd'}, 'R', hs.reload)
hs.hotkey.bind({'shift', 'option'}, 'G', function()
    hs.application.launchOrFocus('Google Chrome')
end)
hs.hotkey.bind({'shift', 'option'}, 'B', function()
    hs.application.launchOrFocus('Firefox')
end)
hs.hotkey.bind({'shift', 'option'}, 'T', function()
    hs.application.launchOrFocus('iTerm')
end)
hs.hotkey.bind({'shift', 'option'}, 'F', function()
    hs.application.launchOrFocus('Finder')
end)
hs.hotkey.bind({'shift', 'option'}, 'V', function()
    hs.application.launchOrFocus('Visual Studio Code')
end)
hs.hotkey.bind({'shift', 'option'}, 'C', function()
  hs.application.launchOrFocus('Cursor')
end)
hs.hotkey.bind({'shift', 'option'}, 'K', function()
    hs.application.launchOrFocus('KakaoTalk')
end)
hs.hotkey.bind({'shift', 'option'}, 'I', function()
    hs.application.launchOrFocus('IntelliJ IDEA')
end)
hs.hotkey.bind({'shift', 'option'}, 'D', function()
    hs.application.launchOrFocus('Discord')
end)
hs.hints.hintChars = {'1', '2', '3', '4', 'Q', 'W', 'E', 'R'}
hs.hotkey.bind({'shift'}, 'F1', hs.hints.windowHints)

-- 화면 이동 함수
local function move_win(xx, yy, ww, hh)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local max = win:screen():frame()
        f.x = max.w * xx
        f.y = max.h * yy
        f.w = max.w * ww
        f.h = max.h * hh
        win:setFrame(f)
    end
end

local mod = {'option', 'shift'}
hs.hotkey.bind(mod, '1', move_win(0, 0, 1, 1))
hs.hotkey.bind(mod, '2', move_win(0, 0, 1/2, 1))
hs.hotkey.bind(mod, '3', move_win(1/2, 0, 1/2, 1))
hs.hotkey.bind(mod, '4', move_win(0, 0, 1, 1/2))
hs.hotkey.bind(mod, '5', move_win(0, 1/2, 1, 1/2))

require('modules.inputsource_aurora')

local inputEnglish = "com.apple.keylayout.ABC"
local esc_bind

function back_to_eng()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.keycodes.currentSourceID(inputEnglish)
	end
	esc_bind:disable()
	hs.eventtap.keyStroke({}, 'escape')
	esc_bind:enable()
end 

esc_bind = hs.hotkey.new({}, 'escape', back_to_eng):enable()


local FRemap = require('modules.foundation_remapping')
local remapper = FRemap.new()
remapper:remap('capslock', 'f18')
remapper:register()
