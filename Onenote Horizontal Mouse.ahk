; This script remaps vertical scrolling to horizontal when holding down the Shift key for both OneNote and Excel

#IfWinActive ahk_class Framework::CFrame ; This targets OneNote specifically
+WheelUp:: ; Shift + Wheel Up in OneNote
Send, {WheelLeft}
return

+WheelDown:: ; Shift + Wheel Down in OneNote
Send, {WheelRight}
return

#IfWinActive ahk_class XLMAIN ; This targets Excel specifically
+WheelUp:: ; Shift + Wheel Up in Excel
Send, {WheelLeft}
return

+WheelDown:: ; Shift + Wheel Down in Excel
Send, {WheelRight}
return

#IfWinActive
