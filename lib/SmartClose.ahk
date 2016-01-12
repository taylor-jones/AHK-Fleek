; ////////////////////////////////////////////////
;                   SmartClose
; ////////////////////////////////////////////////
SmartClose(scope := "tab")
{
	If (scope = "tab")
	{
		SendInput, % GetKeyState("Control", "P") ? "{Alt Down}{F4}{Alt Up}" : "{Ctrl Down}{w}{Ctrl Up}" 
	}
	Else if (scope = "window")
	{
		SendInput, ^w
	}
	Return
}