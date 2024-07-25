global toggle := false  ; Initial state of toggle

; Function to swap the mouse button
SwapMouseButton() {
    toggle := !toggle  ; Toggle the state between true and false
    if (toggle) {
        ; Swap to left-handed
        DllCall("SwapMouseButton", "int", 1)
        TrayTip, Mouse Swap, Left-handed mode activated, 5000  ; Show TrayTip for 5 seconds
    } else {
        ; Swap to right-handed
        DllCall("SwapMouseButton", "int", 0)
        TrayTip, Mouse Swap, Right-handed mode activated, 5000  ; Show TrayTip for 5 seconds
    }
}

; Function to revert the mouse button to right-handed on exit
RevertMouseButton() {
    if (toggle) {
        ; Ensure it is set to right-handed before exit
        DllCall("SwapMouseButton", "int", 0)
        TrayTip, Mouse Swap, Right-handed mode activated (on exit), 5000  ; Show TrayTip for 5 seconds
    }
}

; Set an exit function to revert the mouse buttons when the script exits
OnExit("RevertMouseButton")

; Initialize by toggling to the desired state
SwapMouseButton()
