; ///////////////////////////////////////////////////////
;                        ToggleWin
; ///////////////////////////////////////////////////////
;      Toggle a window into and/or out of focus
; ///////////////////////////////////////////////////////

ToggleWin(WinClassOrExe)
{
    SetTitleMatchMode, 2
    DetectHiddenWindows, Off
    IfWinActive, %WinClassOrExe%
    {
        WinMinimize, %WinClassOrExe%
    }
    Else
    {
        IfWinExist, %WinClassOrExe%
        {
            WinActivate, %WinClassOrExe%
        }
    }
    Return
}