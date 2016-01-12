#NoEnv
#SingleInstance, Force

GroupAdd, AnyBrowser, ahk_class Chrome_WidgetWin_1
GroupAdd, AnyBrowser, ahk_class MozillaWindowClass
GroupAdd, AnyBrowser, ahk_class IEFrame

GroupAdd, DevEditor, ahk_exe Brackets.exe
GroupAdd, DevEditor, ahk_exe WebStorm.exe
GroupAdd, DevEditor, ahk_exe PhpStorm.exe
GroupAdd, DevEditor, ahk_exe sublime_text.exe
GroupAdd, DevEditor, ahk_exe atom.exe

#IfWinActive, ahk_group DevEditor
    Capslock & Space::
        Send, ^s
        ;Sleep 10
    AutoRefreshWeb:
        autoRefreshDestinations =
        (ltrim comments
            ; A list of browser titles that should be refreshed, in this order
            Document
            localhost
            127.0.0.1
            index.html
            ahk_group AnyBrowser ; No specific window has been found, so just refresh any browser window
        )

        ; Determine which window to send Refresh:
        SetTitleMatchMode RegEx
        Loop, parse, autoRefreshDestinations, `n
        {
            IfWinExist %A_LoopField%
            {
                ;WinActivate
                ControlFocus
                ;Sleep 300
                ControlSend, , ^a^{F5}
                ;SendInput ^a^{F5}
                Return
            }
        }
    Return

#IfWinActive ;EndRegion

