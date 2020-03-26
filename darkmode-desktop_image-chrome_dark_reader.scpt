-- OS System Events Changes and variables saving
tell application "System Events"

	-- Set system dark/light mode & save status
	tell appearance preferences
		set dark mode to not dark mode
        -- Save dark mode status as variable for later
		set darkBool to dark mode
	end tell

	-- Set desktop photo depending on light or dark mode
	if darkBool is true then
		tell every desktop
			set picture to "/Users/timarterbury/Pictures/Wallpapers/MoveMIDI Neon Dark.png"
		end tell
	else
		tell every desktop
			set picture to "/Users/timarterbury/Pictures/Wallpapers/MoveMIDI Neon Light.png"
		end tell
	end if

	-- Save name of the focused app window in the foreground
	set frontApp to first application process whose frontmost is true
	set frontAppName to name of frontApp

end tell


-- Toggle Sublime Text theme
set sublimeTextPreferenceFilePath to "/Users/timarterbury/Library/Application\\ Support/Sublime\\ Text\\ 3/Packages/User/Preferences.sublime-settings"

if darkBool is true then
    set sublimeTheme to "ayu-mirage.sublime-theme"
    set sublimeColorScheme to "Packages\\/ayu\\/ayu-mirage.sublime-color-scheme"
else
    set sublimeTheme to "ayu-light.sublime-theme"
    set sublimeColorScheme to "Packages\\/ayu\\/ayu-light.sublime-color-scheme"
end if

do shell script "sed -iE 's/\\(.*\"theme\": \"\\).*\\(\",\\)/\\1" & sublimeTheme & "\\2/g' " & sublimeTextPreferenceFilePath
do shell script "sed -iE 's/\\(.*\"color_scheme\": \"\\).*\\(\",\\)/\\1" & sublimeColorScheme & "\\2/g' " & sublimeTextPreferenceFilePath


-- Toggle iTerm2 profile to new tab
-- From what I can tell, it is not possible to change the current profile of
-- a tab, so we must make a new tab.
if application "iTerm" is running then
    tell application "iTerm"
        repeat with aWindow in windows
            tell aWindow
                if darkBool is true then
                    create tab with profile "Tim-Dark"
                else
                    create tab with profile "Tim-Light"
                end if
            end tell
        end repeat
    end tell
end if


-- Toggle Dark Reader extension in web browser
set browserName to "Google Chrome"
if application browserName is running then
    tell application "System Events"

        -- Toggle Dark Reader extension with its keyboard shortcut
        tell application "Google Chrome" to activate
        keystroke "d" using {option down, shift down}
        delay 0.1 -- Delay so keystroke properly registers with browser

        -- Bring the previously focused application to the front
        tell application process frontAppName
            set frontmost to true
        end tell

    end tell
end if
