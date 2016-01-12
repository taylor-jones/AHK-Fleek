; //////////////////////////////////////////////
;              Toggle Hidden Files
; //////////////////////////////////////////////
ToggleHiddenFiles()
{
	RegRead, HiddenStatus, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
	If HiddenStatus = 2
    {
    	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
    	TrayTip, , Hidden files now showing, 10 
    }
	Else
    {
    	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
    	TrayTip, , Files now hidden , 10 
    }
	WinGetClass, WinClass, A
	If WinClass != "#32770"
    	PostMessage, 0x111, 28931, , , A
	Send, {F5}
	Return
}