; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Disable Caps Lock toggle functionality
SetCapsLockState, AlwaysOff

; Function to send keys with proper modifier handling
SendKey(key) {
    modifier := ""
    if GetKeyState("Shift", "P")
        modifier .= "+"
    if GetKeyState("Control", "P")
        modifier .= "^"
    if GetKeyState("Alt", "P")
        modifier .= "!"
    Send, % modifier . "{" . key . "}"
}

; Remap Caps Lock + I/J/K/L to Arrow keys
CapsLock & k::SendKey("Up")
CapsLock & j::SendKey("Down")
CapsLock & h::SendKey("Left")
CapsLock & l::SendKey("Right")

; Remap Caps Lock + other keys
CapsLock & u::SendKey("Home")
CapsLock & i::SendKey("End")
CapsLock & y::SendKey("PgUp")
CapsLock & o::SendKey("PgDn")
