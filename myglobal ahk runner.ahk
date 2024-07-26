#Persistent
global running := false  ; Track whether the controlled scripts are running
global PIDs := []  ; Array to store the PIDs of the started scripts

MsgBox, Hello, World!, Special Mode on.
+F12::ToggleSubScripts()  ; SHIFT+F12 to toggle the execution of sub-scripts

ToggleSubScripts() {
    running := !running
    if running {
        ; Run each AHK script and store the PID
        Run, "%A_ScriptDir%\Excel ctrl backspace.ahk", , , pid2
        PIDs.Push(pid2)
        Run, "%A_ScriptDir%\jikl Arrow keys.ahk", , , pid3
        PIDs.Push(pid3)
        Run, "%A_ScriptDir%\mouse button change.ahk", , , pid4
        PIDs.Push(pid4)
        Run, "%A_ScriptDir%\Onenote Horizontal Mouse.ahk", , , pid5
        PIDs.Push(pid5)
        MsgBox, Hello, World!, Special Mode on.

        ; TrayTip, Script Runner, Special mode ON, 5000
    } else {
        ; Close each AHK script process by PID
        for index, pid in PIDs
        {
            Process, Close, %pid%
        }
        PIDs := []  ; Clear the PID array
        MsgBox, Hello, World!, Special Mode OFF.
        ; TrayTip, Script Runner, Special mode OFF, 5000
    }
}