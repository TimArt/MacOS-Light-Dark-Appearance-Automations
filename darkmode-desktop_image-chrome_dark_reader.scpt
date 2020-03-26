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
