-- Set the interval in seconds
set interval to 175

-- Function to press the Command Key
on pressCommandKey()
    tell application "System Events"
        key down command
        delay 0.01
        key up command
    end tell
end pressCommandKey

-- Loop to press the Command key every x seconds
repeat
    pressCommandKey()
    delay interval
end repeat
