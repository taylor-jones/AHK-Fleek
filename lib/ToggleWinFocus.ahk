ToggleWinFocus(varWins*)
{
	SetTitleMatchMode, 2
	DetectHiddenWindows, Off
	for index,varWin in varWins
    	IfWinActive, %varWin%
    	{
        	WinMinimize, %varWin%
        	Return
    	}
    	Else
    	{
        	IfWinExist, %varWin%
        	{
            	WinActivate, %varWin%
            	Return
        	}
    	}
    	Return
}