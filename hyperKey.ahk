#NoEnv ; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#InstallKeybdHook
#SingleInstance force

SendMode Input

;; deactivate capslock completely
SetCapslockState, AlwaysOff

;; remap capslock to hyper
;; if capslock is toggled, remap it to esc

;; note: must use tidle prefix to fire hotkey once it is pressed
;; not until the hotkey is released
~Capslock::
    ;; must use downtemp to emulate hyper key, you cannot use down in this case 
    ;; according to http://bit.ly/2fLyHHI, downtemp is as same as down except for ctrl/alt/shift/win keys
    ;; in those cases, downtemp tells subsequent sends that the key is not permanently down, and may be 
    ;; released whenever a keystroke calls for it.
    ;; for example, Send {Ctrl Downtemp} followed later by Send {Left} would produce a normal {Left}
    ;; keystroke, not a Ctrl{Left} keystroke
    Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}
    KeyWait, Capslock
    Send {Ctrl Up}{Shift Up}{Alt Up}{LWin Up}
    if (A_PriorKey = "Capslock") {
        Send {Space}
    }
return

;; vim navigation with hyper
~Capslock & i:: Send {Up}
~Capslock & l:: Send {Right}
~Capslock & k:: Send {Down}
~Capslock & j:: Send {Left}
~Capslock & h:: Send {Home}
~Capslock & e:: Send {End}
~Capslock & [:: Send {BackSpace}
~Capslock & u:: Send {CtrlDown}{Left}{CtrlUp}
~Capslock & o:: Send {CtrlDown}{Right}{CtrlUp}

~Capslock & 3::
Run, "D:\B.Tech\3rd-sem"
return

~Capslock & 4::
Run, "D:\B.Tech\4th-sem"
return

~Capslock & 5::
Run, "D:\B.Tech\5th-sem"
return

~Capslock & 1::
Run, "D:\Courses\Kali Linux Tutorial For Beginners"
return

;;$Space::
;;    SendInput, {Space}
;;    KeyWait, Space
;;return

$e::
    SendInput, {e}
    KeyWait, e
return
  