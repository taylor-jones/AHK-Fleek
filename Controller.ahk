; //////////////////////////////////////////////////////////////
;                          CONTROLLER
; //////////////////////////////////////////////////////////////
; Controller.ahk is the main ahk file for Fleek.
; All other scripts should be #Included into this file, ...
; ... as this is the file that will be run to include all ...
; ... Fleek functionality.
; //////////////////////////////////////////////////////////////

#NoEnv
SendMode, Input
SetBatchLines, -1
SetKeyDelay, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetCapsLockState, AlwaysOff
SetNumLockState, AlwaysOn
SetWorkingDir, A_ScriptDir
#Persistent


; //////////////////////////////////////////////////////////////
;                      Auto-Execution Area
; //////////////////////////////////////////////////////////////
;    NOTE: Any 'Return' OR #Inlcude will break Auto-Execution
; //////////////////////////////////////////////////////////////





; //////////////////////////////////////////////////////////////
;                            Groups
; //////////////////////////////////////////////////////////////

GroupAdd, tabbed, ahk_class Chrome_WidgetWin_1 ; chrome , operq
GroupAdd, tabbed, ahk_class MozillaWindowClass ; firefox
GroupAdd, tabbed, ahk_class ApplicationFrameWindow ; native apps
GroupAdd, tabbed, ahk_class CabinetWClass ; explorer
GroupAdd, tabbed, ahk_class Notepad++ ; notepad ++
GroupAdd, tabbed, ahk_class CEFCLIENT ; brackets
GroupAdd, tabbed, ahk_class PX_WINDOW_CLASS ; sublime text
GroupAdd, tabbed, ahk_class SunAwtFrame
GroupAdd, tabbed, ahk_class IEFrame
GroupAdd, tabbed, ahk_exe atom.exe

GroupAdd, AnyBrowser, ahk_class Chrome_WidgetWin_1
GroupAdd, AnyBrowser, ahk_class MozillaWindowClass
GroupAdd, AnyBrowser, ahk_class IEFrame

GroupAdd, DevEditor, ahk_exe Brackets.exe
GroupAdd, DevEditor, ahk_class SunAwtFrame
GroupAdd, DevEditor, ahk_exe sublime_text.exe
GroupAdd, DevEditor, ahk_exe atom.exe

GroupAdd, AutoEx, ahk_class ExploreWClass
GroupAdd, AutoEx, ahk_class CabinetWClass

; //////////////////////////////////////////////////////////////
;                          Key-Bindings
; //////////////////////////////////////////////////////////////

; NO Orientation-Flipping !!!
;^!Left::
;^!Right::
;^!Up::
;^!Down::
;Return


; Suspend & Reload
CapsLock & NumpadSub::Suspend
CapsLock & NumpadAdd::Reload


; ToggleWinFocus
!a::ToggleWinFocus("ahk_exe atom.exe", "ahk_exe AfterFX.exe", "ahk_exe msaccess.exe")
!b::ToggleWinFocus("ahk_exe brackets.exe")
!c::ToggleWinFocus("ahk_exe chrome.exe")
!d::ToggleWinFocus("Downloads", "Documents")
!e::ToggleWinFocus("ahk_class CabinetWClass", "Microsoft Edge", "ahk_exe Eveditor.exe")
!f::ToggleWinFocus("ahk_exe firefox.exe")
!g::ToggleWinFocus("ahk_exe GitHub.exe", "ahk_exe gitter.exe")
!h::ToggleWinFocus("Taylor Jones")
!i::ToggleWinFocus("ahk_exe Illustrator.exe", "Internet Explorer")
!j::ToggleWinFocus("ahk_class SunAwtFrame")
!k::ToggleWinFocus("Google Keep")
!m::ToggleWinFocus("ahk_exe MEGAsync.exe", "ahk_exe Adobe Media Encoder.exe")
!n::ToggleWinFocus("ahk_exe notepad++.exe")
!p::ToggleWinFocus("ahk_exe Adobe Premiere Pro.exe", "ahk_exe powershell_ise.exe", "ahk_exe powershell.exe", "ahk_exe pia_tray.exe", "ahk_exe powershell.exe", "ahk_exe POWERPNT.EXE")
!q::ToggleWinFocus("ahk_exe QuickTimePlayer.exe")
!r::ToggleWinFocus("ahk_exe Revouninstaller.exe")
!s::ToggleWinFocus("ahk_exe sublime_text.exe", "ahk_exe Skype.exe")
!u::ToggleWinFocus("ahk_exe utorrent.exe")
!v::ToggleWinFocus("ahk_exe VirtualBox.exe", "ahk_exe vlc.exe")
!w::ToggleWinFocus("ahk_exe msword.exe")
!x::ToggleWinFocus("ahk_exe mintty.exe", "ahk_exe ConEmu.exe")
;!z::ToggleWinFocus("ahk_exe zeal.exe") ; This is commented out, because it's configured in Zeal, itself, but leaving it here conflicts with the keybinding.




; SmartClose
NumpadEnter & NumpadDot::
{
	IfWinActive ahk_group tabbed
	{
		SmartClose("tab")
	}
	Else
	{
		SmartClose("window")
	}
	Return
}


; Auto-Extract
#IfWinActive, ahk_group AutoEx
^LButton::AutoExtract()
#IfWinActive


; Google It
^+g::GoogleIt()


; Zedo - Redo
^+z::
{
	IfWinNotActive, ahk_exe Illustrator.exe
	{
		Redo()
	}
	Else
	{
		SendInput, ^+z
	}
	Return
}


; Toggle Hidden Files
^!h::
{
	IfWinActive, ahk_group AutoEx
	{
		ToggleHiddenFiles()
	}
	Else
	{
		Return
	}
	Return
}



; Empty Recycle Bin
RCtrl & Del::
{
	FileRecycleEmpty
	Return
}


; Media Controls
F10::
{
	If (GetKeyState("Alt", "P"))
	{
		Send, {F10}
	}
	Else
	{
		Send, {Volume_Mute}
	}
	Return
}

F11::
{
	If (GetKeyState("Alt", "P"))
	{
		Send, {F11}
	}
	Else
	{
		Send, {Volume_Down}
	}
	Return
}


F12::
{
	If (GetKeyState("Alt", "P"))
	{
		Send, {F12}
	}
	Else
	{
		Send, {Volume_Up}
	}
	Return
}



Break::
{
	If (GetKeyState("Alt", "P"))
	{
		Send, {Break}
	}
	Else
	{
		Send, {Media_Play_Pause}
	}
	Return
}



AppsKey::
{
	If (GetKeyState("Alt", "P"))
	{
		Send, {AppsKey}
	}
	Else
	{
		Send, {F12}
	}
	Return
}



; Three Finger Swiping -
; Allows for three finger swiping...
; ...to browse forward and back

Alt & Tab::
{
    If GetKeyState("Right")
        Send, {Browser_Forward}
	Return
    If GetKeyState("Left")
        Send, {Browser_back}
	Return
}

; Ctrl & Tab - directs focus to previously active window
Ctrl & Tab::
{
	SendInput, {Alt Down}{Tab}{Alt Up}
	Return
}




; //////////////////////////////////////////////////////////////
;                        Script Inclusions
; //////////////////////////////////////////////////////////////

#Include Hotstrings.ahk
#Include Captain.ahk
#Include DevRefresh.ahk