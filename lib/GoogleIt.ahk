; -------------------------------------------------
;                    GoogleIt
; -------------------------------------------------

GoogleIt()
{
	SendInput, ^c
	Sleep 25
	Run, https://www.google.com/search?q=%clipboard%
	Return
}