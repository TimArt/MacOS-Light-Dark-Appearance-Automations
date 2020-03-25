# MacOS Light Dark Appearance Automations

This is an AppleScript file for toggling Light/Dark Appearance of MacOS with additional automations to toggle:
- Desktop background
- Google Chrome's Dark Reader extension

This script can be tailored to how you want Light/Dark Appearance to affect other OS preferences and applications.

The script can be used as a MacOS System Service and triggered via a custom keyboard command.

## Setting up as a System Service with Keyboard Shortcut
1. Open the Automator Application.
2. Create a new "Workflow" document.
3. In the Library Action panel search for "Run AppleScript".
4. Drag the "Run AppleScript" action to the workflow area.
5. Copy and paste the contents of the script file from this repository into the "Run Applescript" workflow action.
6. Modify script functionality such as the desktop picture file paths or the name of the web browser you use, etc.
7. Click the run and/or compile button to test.
8. If it works as expected, save the automator workflow file to the directory: `~/Library/Services`
9. Go to System Preferences -> Keyboard -> Shortcuts tab -> Services pane -> Scroll down to the General heading and unfold to reveal all System Services you have in the folder `~/Library/Services`
10. Enable the checkbox next to the name of your worflow service.
11. Click into the Add Shortcut box and perform your key command to map it.
