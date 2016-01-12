;---------------------------------------------------------------
; CornerNotify.ahk
; http://www.autohotkey.com/board/topic/94458-msgbox-replacement-monolog-non-modal-transparent-message-box-cornernotify/

;---------------------------------------------------------------
; CHANGELOG

;v1.12 2014-05-04 CHANGED BY LAGOMORPH
;Added additional "p" parameter for secs to make the popup persist until destroyed via CornerNotify_Destroy()
;Changed GUI name to CornerNotify instead of default GUI to avoid conflicts with other GUIs

; v1.1 2013-06-19
; added optional position argument that calls WinMove function from user "Learning One"
; position argument syntax is to create a string containing the following:
; t=top, vc= vertical center, b=bottom
; l=left, hc=horizontal center, r=right

;---------------------------------------------------------------

CornerNotify(secs, title, message, position="b r") { 
	CornerNotify_Create(title, message, position)
	if (secs = "p") ;persistent mode
		return
	millisec := secs*1000*-1
	SetTimer, CornerNotifyBeginFadeOut, %millisec%
}

CornerNotify_Create(title, message, position="b r") {
	global cornernotify_title, cornernotify_msg, w, curtransp, cornernotify_hwnd
	CornerNotify_Destroy() ; make sure an old instance isn't still running or fading out
	Gui, CornerNotify:+AlwaysOnTop +ToolWindow -SysMenu -Caption +LastFound
	cornernotify_hwnd := WinExist()
	WinSet, ExStyle, +0x20 ; WS_EX_TRANSPARENT make the window transparent-to-mouse
	WinSet, Transparent, 160
	curtransp := 160
	Gui,CornerNotify:Color, CDDC39 ;background color
	Gui,CornerNotify:Font, c212121 s22 wRegular, Roboto
	Gui,CornerNotify:Add, Text, x50 y02 w668 vcornernotify_title, %title%
	Gui,CornerNotify:Font, cF0F0F0 s15 wnorm
	Gui,CornerNotify:Add, Text, x20 y56 w668 vcornernotify_msg, %message%
	Gui,CornerNotify:Show, NoActivate W200 H42
	WinMove(cornernotify_hwnd, position)
	Return
}

CornerNotify_ModifyTitle(title) {
	global cornernotify_title
	GuiControl,Text,cornernotify_title, %title%
}

CornerNotify_ModifyMessage(message) {
	global cornernotify_msg
	GuiControl,Text,cornernotify_msg, %message%
}

CornerNotify_Destroy() {
	global curtransp
	curtransp := 0
	Gui,CornerNotify: Destroy
	SetTimer, CornerNotify_FadeOut_Destroy, Off
}

CornerNotifyBeginFadeOut:
	SetTimer, CornerNotifyBeginFadeOut, Off
	SetTimer, CornerNotify_FadeOut_Destroy, 10
Return

CornerNotify_FadeOut_Destroy:
	If(curtransp > 0) {
		curtransp := curtransp - 4
		WinSet, Transparent, %curtransp%, ahk_id %cornernotify_hwnd%
	} Else {
		Gui,CornerNotify: Destroy
		SetTimer, CornerNotify_FadeOut_Destroy, Off
	}
Return

;---------------------------------------------------------------
; Modification of WinMove function by Learning One (http://www.autohotkey.com/board/topic/72630-gui-bottom-right/#entry461385)

; position argument syntax is to create a string with the following:
; t=top, vc= vertical center, b=bottom
; l=left, hc=horizontal center, r=right

WinMove(hwnd,position) {   ; by Learning one
   SysGet, Mon, MonitorWorkArea
   WinGetPos,ix,iy,w,h, ahk_id %hwnd%
   x := InStr(position,"l") ? MonLeft : InStr(position,"hc") ?  (MonRight-w)/2 : InStr(position,"r") ? MonRight - w : ix
   y := InStr(position,"t") ? MonTop : InStr(position,"vc") ?  (MonBottom-h)/2 : InStr(position,"b") ? MonBottom - h : iy
   WinMove, ahk_id %hwnd%,,x,y
}

;---------------------------------------------------------------
