; //////////////////////////////////////////////////////////////
;                          Captain
; //////////////////////////////////////////////////////////////

; //////////////////////////////////////////
;                 Bindings
; //////////////////////////////////////////


; --------------------------
init()          ; initialize the goodness
; --------------------------


; --------------------------
;         Keys
; --------------------------


; ===========================================
;           IF CAPSLOCK PRESSED
; ===========================================

; COUNT NUMBERS
#IF (GetKeyState("CapsLock", "P"))
*1::cInput(1)
*2::cInput(2)
*3::cInput(3)
*4::cInput(4)
*5::cInput(5)
*6::cInput(6)
*7::cInput(7)
*8::cInput(8)
*9::cInput(9)
*0::cInput(0)

*g::
{
    if (A_PriorKey == "g" && A_TimeSincePriorHotkey < 350) {
        gl := max(mC,oC)
        if (gl != " ") {
            send ^g%gl%{Enter}
        } else {
            send ^{Home}
        }
        cClean()
    }
    return
}


+g::
{
    send ^{End}
    return
}

#IF
; ==========================================


*CapsLock::
{
	if (GetKeyState("RAlt", "P"))
	{
		unset(sDir)
	}
	if (GetKeyState("RShift", "P"))
	{
		if (GetKeyState("LAlt", "P"))
		{
			if (GetKeyState("Ctrl", "P"))
			{
				neoStart(2, 2)
			}
			else
			{
				neoStart(1, 2)
			}
		}
		else
		{
			if (GetKeyState("Ctrl", "P"))
			{
				neoEnd(2, 2)
			}
			else
			{
				neoEnd(1, 2)
			}
		}
	}
	else if (GetKeyState("LShift", "P"))
	{
		if (GetKeyState("LAlt", "P"))
		{
			if (GetKeyState("Ctrl", "P"))
			{
				neoStart(2, 1)
			}
			else
			{
				neoStart(1, 1)
			}
		}
		else
		{
			if (GetKeyState("Ctrl", "P"))
			{
				neoEnd(2, 1)
			}
			else
			{
				neoEnd(1, 1)
			}
		}
	}
	else
	{
		if (GetKeyState("LAlt", "P"))
		{
			if (GetKeyState("Ctrl", "P"))
			{
				neoStart(2, 0)
			}
			else
			{
				neoStart(1, 0)
			}
		}
		Else
		{
			if (GetKeyState("Ctrl", "P"))
			{
				neoEnd(2, 0)
			}
			else
			{
				neoEnd(1, 0)
			}
		}
	}
	set(sDir)
	return
}


CapsLock Up::
{
    if (oC > 0) {
        oExists := true
    } else {
        oExists := false
    }
    return
}
; ------------------------------------------
;      Capslock & h,j,k,l [shift][alt]
; ------------------------------------------
CapsLock & h::
{
    if (GetKeyState("Shift", "P")) {
        goLeft(true)
    } else {
        goLeft(false)
    }
    return
}

CapsLock & j::
{
    if (GetKeyState("Shift", "P")) {
        goDown(true)
    } else {
        goDown(false)
    }
    return
}

CapsLock & k::
{
    if (GetKeyState("Shift", "P")) {
        goUp(true)
    } else {
        goUp(false)
    }
    return
}

CapsLock & l::
{
    if (GetKeyState("Shift", "P")) {
        goRight(true)
    } else {
        goRight(false)
    }
    return
}

; ------------------------------------------
;      Capslock & [,],{,}
; ------------------------------------------
CapsLock & ]::
{
    if (GetKeyState("Shift", "P")) {
        goSEnd(true)
    } else {
        goSEnd(false)
    }
    return
}

CapsLock & [::
{
    if (GetKeyState("Shift", "P")) {
        goSStart(true)
    } else {
        goSStart(false)
    }
    return
}


; ------------------------------------------
;     Capslock & w,b,e,ge
; ------------------------------------------
CapsLock & w::
{
    if (GetKeyState("Shift", "P")) {
        goWNext(true)
    } else {
        goWNExt(false)
    }
    return
}

CapsLock & b::
{
    if (GetKeyState("Shift", "P")) {
        goWPrev(true)
    } else {
        goWPrev(false)
    }
    return
}

CapsLock & e::
{
    if (A_PriorKey == "g") {
        if (GetKeyState("Shift", "P")) {
            goPWEnd(true)
        } else {
            goPWEnd(false)
        }
    } else {
        if (GetKeyState("Shift", "P")) {
            goWEnd(true)
        } else {
            goWEnd(false)
        }
    }
    return
}


; -----------------------------------------
;     Capslock & o
; -----------------------------------------
CapsLock & o::
{
    if (GetKeyState("Shift", "P")) {
        If (GetKeyState("Alt", "P")) {
            neoLine("top")
        } else {
            neoLine("bottom")
        }
    } else {
        if (GetKeyState("Alt", "P")) {
            neoLine("above")
        } else {
            neoLine("below")
        }
    }
    cClean()
    return
}


; =========================================
; /////////////////////////////////////////
; =========================================

CapsLock & a::
{
    n := actCount(mC)
    if (GetKeyState("Alt", "P")) {
        if (GetKeyState("Shift", "P")) {
            send {Left %n%}{Space}{Left}
        } else {
            send {Left %n%}{Space}
        }
    } else {
        if (GetKeyState("Shift", "P")) {
            send {Right %n%}{Space}{Left}
        } else {
            send {Right %n%}{Space}
        }
    }
    cClean()
    return
}

CapsLock & z::
{
    n := actCount(mC)
    if (GetKeyState("Alt", "P")) {
        if (GetKeyState("Shift", "P")) {
            Send {Right %n%}{}}
        } else {
            Send {Right %n%}{)}
        }
    } else {
        if (GetKeyState("Shift", "P")) {
            Send {Right %n%}{;}
        } else {
        Send {Right %n%}{,}
        }
    }
    cClean()
    return
}

CapsLock & x::
{
    n := actCount(mC)
    if (GetKeyState("Alt", "P")) {
        if (GetKeyState("Shift", "P")) {
            Send {Right %n%}{"}
        } else {
            Send {Right %n%}{'}
        }
    } else {
        if (GetKeyState("Shift", "P")) {
            Send {Right %n%}{\}
        } else {
        Send {Right %n%}{.}
        }
    }
    cClean()
    return
}

CapsLock & s::
{
    if (GetKeyState("Shift", "P")) {
        send {#}
    } else if (GetKeyState("Alt", "P")) {
        send {!}
    } else {
        send $
    }
    return
}


#IfWinActive ahk_exe atom.exe
CapsLock & left::
{
    if (GetKeyState("Shift", "P")) {
        sendinput, ^!{{}
    } else {
        sendinput, ^![
    }
    return
}

Capslock & right::
{
    if (GetKeyState("Shift", "P")) {
        sendinput, ^!{}}
    } else {
        sendinput, ^!]
    }
    return
}

#IfWinActive


; =========================================
; /////////////////////////////////////////
; =========================================



; ============================
;   Window Always on Top
; ============================
#Enter:: Winset, AlwaysOnTop, , A
return

;=============================
;      Empty Recycle Bin
;=============================
CapsLock & Esc::
FileRecycleEmpty
return


; ============================
;     Quick Tab Switching
; ============================
; forwards
CapsLock & q::
    SendInput, {Ctrl Down}{Tab Down}{Tab Up}{Ctrl Up}
Return

; backwards
CapsLock & Tab::
    SendInput, {Ctrl Down}{Shift Down}{Tab Down}{Tab Up}{Shift Up}{Ctrl Up}
Return


F1 & F3::
if (pauseMode=0){
    pauseMode:=1
    CornerNotify(1, "Chrome", "", "t l")
}
Else {
    pauseMode:=0
    CornerNotify(1, "  VLC", "", "t l")
}
Return

#IF (pauseMode=1)
F1 & F2::
 SetControlDelay -1
 SetTitleMatchMode, 2
 ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome
 ControlFocus,,ahk_id %outputvar%
 ControlSend,, {Space}, ahk_id %outputvar%

 Return

#IF (pauseMode=0)
F1 & F2::
  SetControlDelay, -1
  ControlSend, ,{Space}, ahk_exe vlc.exe
  Return

#IF


; ========================
;               Sublime Specific
; ========================
#IfWinActive ahk_exe sublime_text.exe

; -- > Remember to change any of these if thier respective keybindings change in Sublime!

Capslock & f::sendinput, ^+h

Capslock & Right::
{
    if (GetKeyState("Shift", "P")) {
        if (GetKeyState("Alt", "P")){
            sendinput, ^k
            SendInput !{Right}
        } else {
            sendinput, ^k
            sendinput +{Right}
        }
    } else if (GetKeyState("Alt", "P")) {
        sendinput, ^k
        SendInput, ^+{Right}
    } else {
        sendinput, ^k
        sendinput, ^!{Right}
    }
    return
}


Capslock & Left::
{
    if (GetKeyState("Shift", "P")) {
        if (GetKeyState("Alt", "P")){
            sendinput, ^k
            SendInput !{Left}
        } else {
            sendinput, ^k
            sendinput +{Left}
        }
    } else if (GetKeyState("Alt", "P")) {
        sendinput, ^k
        SendInput, ^+{Left}
    } else {
        sendinput, ^k
        sendinput, ^!{Left}
    }
    return
}


Capslock & Up::
{
    if (GetKeyState("Shift", "P")) {
        if (GetKeyState("Alt", "P")){
            sendinput, ^k
            SendInput !{Up}
        } else {
            sendinput, ^k
            sendinput +{Up}
        }
    } else if (GetKeyState("Alt", "P")) {
        sendinput, ^k
        SendInput, ^+{Up}
    } else {
        sendinput, ^k
        sendinput, ^!{Up}
    }
    return
}


Capslock & Down::
{
    if (GetKeyState("Shift", "P")) {
        if (GetKeyState("Alt", "P")){
            sendinput, ^k
            SendInput !{Down}
        } else {
            sendinput, ^k
            sendinput +{Down}
        }
    } else if (GetKeyState("Alt", "P")) {
        sendinput, ^k
        SendInput, ^+{Down}
    } else {
        sendinput, ^k
        sendinput, ^!{Down}
    }
    return
}


CapsLock & d::Sendinput, ^d

#IfWinActive

; //////////////////////////////////////////
;                 Functions
; //////////////////////////////////////////

init()
{
    initCounts()
    initCarets()
    global mDir := true
    global aDir := " "
    global sDir := true
    global pauseMode:=1
    return
}

initCounts()
{
    global
    oC := " "
    mC := " "
    oExists := false  ; operator exists (boolean)
    return
}

initCarets()
{
    global
    nowX :=
    nowY :=
    swapX :=
    swapY :=
    prevX :=
    prevY :=
    markX :=
    markY :=
    return
}



; -----------
;    Ops
; -----------
;  Variables
; -----------

set(byref var)
{
    var := true
    return var
}

unset(byref var)
{
    var := false
    return var
}


; -----------
;    Ops
; -----------
;  New Line
; -----------

newLine(dir:=true, space:=false)
{
    n := actCount(oC,true,0)
    n := n-=1
    if (dir=true) {
        if (space=false) {
            send {Down %n%}{End}{Enter}
        } else {
            if (n=0) {
                n := 1
            }
            send {End}{Enter %n%}
        }
    } else {
        if (space=false) {
            send {Up %n%}{Home}{Enter}{Up}
        } else {
            if (n=0) {
                n := 1
            }
            send {Home}{Enter %n%}{Up %n%}
        }
    }
    cClean()
    return
}

neoLine(at:="below") ; "below | above | top | bottom"
{
    n := actCount(oC,true,1)
    if (at="below") {
        send {End 2}{Enter %n%}
    } else if (at="above") {
        send {Home 2}{Enter %n%}{Up %n%}
    } else if (at="top") {
        send ^{Home}{Enter %n%}{Up %n%}
    } else if (at="bottom") {
        send ^{End}{Enter %n%}
    }
    return
}


; -----------
;   Count
; -----------
;   Number
; -----------

cReset(byref counter)
{
    counter := " "
    return
}

cClean()
{
    global
    cReset(oC)
    cReset(mC)
    return
}

cInput(byref num)
{
    global
    if (oExists = false) {
        cNumber(oC,num)
    } else {
        cNumber(mC,num)
    }
    return
}

cNorm(byref base, byref counter, limit:=1000)
{
    if (counter > limit) {
        counter := base
        if (counter=0) {
            counter := 1
        }
    }
    return
}

cNumber(byref counter, byref num)
{
    counter = %counter%%num%
    cNorm(num, counter)
    return
}



; ----------
;   Count
; ----------
;   Logic
; ----------

actCount(byref counter, flex:=true, base:=1)
{
    global
    if (counter = oC) {
        local x := oC
        local y := mC
    } else {
        local x := mC
        local y := oC
    }
    if (x = " " || x = "" || x = 0 || x = false) {
        if (flex = true) {
            if (y > 0) {
                return y
            } else {
                return base
            }
        } else {
            return base
        }
    } else {
        return x
    }
}

doAct(outer:=" ", inner:=" ")
{
    global
    outRep := normOf(oC)
    inRep := normOf(mC)
    Loop, %outRep%
    {
        %outer%()
        Loop, %inRep%
        {
            %inner%()
        }
    }
    cClean()
    return
}

normOf(counter)
{
    global
    if (counter=oC) {
        local result := Max(1, oC)
    } else {
        local result := Max(1, mC)
    }
    ;msgbox result %result%
    return result
}




; -----------
;   Motion
; -----------
;  Direction
; -----------

goLeft(select:=false)                                    ; go left N times
{
    n := actCount(mC)
    if (select=true) {
        send +{left %n%}
    } else {
        send {left %n%}
    }
    cClean()
    return
}

goRight(select:=false)                                   ; go right N times
{
    n := actCount(mC)
    if (select=true) {
        send +{right %n%}
    } else {
        send {right %n%}
    }
    cClean()
    return
}

goUp(select:=false,scroll:=false)                                      ; go up N times
{
    n := actCount(mC)
    if (select=true) {
        send +{up %n%}
    } else if (scroll=true) {
        send ^{up %n%}
    } else {
        send {up %n%}
    }
    cClean()
    return
}

goDown(select:=false,scroll:=false)                                    ; go down N times
{
    n := actCount(mC)
    if (select=true) {
        send +{down %n%}
    } else if (scroll=true) {
        send ^{down %n%}
    } else {
        send {down %n%}
    }
    cClean()
    return
}


; ----------
;   Motion
; ----------
;   Line
; ----------

neoEnd(r:=1, sel:=0)
{
	global
	local dir := sDir
	local n := actCount(mC,true,0)
	if (dir=true) {
		if (sel=2) {
			sendinput {Shift Down}{Down %n%}{End %r%}{Shift Up}
		} else if (sel=1) {
			sendinput {Down %n%}{Shift Down}{End %r%}{Shift Up}
		} else {
			sendinput {Down %n%}{End %r%}
		}
	}
	else if (dir=false) {
		if (sel=2) {
			sendinput {Shift Down}{Up %n%}{End %r%}{Shift Up}
		} else if (sel=1) {
			sendinput {Up %n%}{Shift Down}{End %r%}{Shift Up}
		} else {
			sendinput {Up %n%}{End %r%}
		}
	}
	cClean()
	return
}


neoStart(r:=1, sel:=0)
{
	global
	local dir := sDir
	local n := actCount(mC,true,0)
	if (dir=true) {
		if (sel=2) {
			sendinput {Shift Down}{Down %n%}{Home %r%}{Shift Up}
		} else if (sel=1) {
			sendinput {Down %n%}{Shift Down}{Home %r%}{Shift Up}
		} else {
			sendinput {Down %n%}{Home %r%}
		}
	}
	else if (dir=false) {
		if (sel=2) {
			sendinput {Shift Down}{Up %n%}{Home %r%}{Shift Up}
		} else if (sel=1) {
			sendinput {Up %n%}{Shift Down}{Home %r%}{Shift Up}
		} else {
			sendinput {Up %n%}{Home %r%}
		}
	}
	cClean()
	return
}


goLStart(sourceDir:="s",r:=2, sel:=false)                  ; go to line start
{
    global
    if (sourceDir="s")
    {
        local dir := sDir
    } else if (sourceDir="a") {
        local dir := aDir
    }
    local n := actCount(mC,true,0)
    if (dir=true) {
        Send {down %n%}
    } else {
        Send {up %n%}
    }
    if (sel=true) {
    	Send {Shift Down}{home %r%}{Shift Up}
	} else {
		SendInput {home %r%}
	}
    cClean()
    return
}

goLEnd(sourceDir:="s",r:=2, sel:=false)                ; go to line end
{
    global
    if (sourceDir="s")
    {
        local dir := sDir
    } else if (sourceDir="a") {
        local dir := aDir
    }
    local n := actCount(mC,true,0)
    if (dir=true) {
        Send {down %n%}
    } else {
        Send {up %n%}
    }
    if (sel=true) {
    	Send {Shift Down}{end %r%}{Shift Up}
	} else {
		SendInput {end %r%}
	}
    cClean()
    return
}

; ------------
;   Motion
; ------------
;    Word
; ------------

goWNext(select:=false)
{
    n := actCount(mC)
    if (select=true) {
        send +^{right %n%}
    } else {
        send ^{right %n%}
    }
    cClean()
    return
}

goWPrev(select:=false)
{
    n := actCount(mC)
    if (select=true) {
        send +^{left %n%}
    } else {
        send ^{left %n%}
    }
    cClean()
    return
}

goWEnd(select:=false)
{
    n := actCount(mC)
    if (select=true) {
        if (n > 1) {
            send ^+{Right %n%}^+{Right}
        } else {
            send ^+{Right %n%}
        }
    } else {
        if (n > 1) {
            send ^{Right %n%}^+{Right}{Right}
        } else {
            send ^+{Right %n%}{Right}
        }
    }
    cClean()
    return
}

goPWEnd(select:=false)
{
    n := actCount(mC)
    if (select=true) {
        if (n > 1) {
            send ^+{Left %n%}^+/
        } else {
            send ^+{Left %n%}^+/
        }
    } else {
        if (n > 1) {
           ;n:=n-=1
            send ^{Left %n%}^/
        } else {
            send ^{Left %n%}^/
        }
    }
    cClean()
    return
}


; ------------
;   Motion
; ------------
;    Section
; ------------


goSEnd(select:=false)
{
    n := actCount(mC,true,0)
    if (select=true) {
        if (n=0) {
            n:=1
            send ^+]^+/
        } else {
            n:=n+=1
            send ^+{] %n%}^+/
        }
    } else {
        if (n=0) {
            n:=1
            send ^]^/
        } else {
            n:=n+=1
            send ^{] %n%}^/
        }
    }
    cClean()
    return
}

goSStart(select:=false)
{
    n := actCount(mC,true,0)
    if (select=true) {
        if (n=0) {
            n:=1
            send ^+[
        } else {
            n:=n+=1
            send ^+{[ %n%}
        }
    } else {
        if (n=0) {
            n:=1
            send ^[
        } else {
            n:=n+=1
            send ^{[ %n%}
        }
    }
    cClean()
    return
}



; ------------
;   Helpers
; ------------

max(values*)
{
    for index, value in values
        if(A_Index = 1 || value > max)
            max := value
    ;msgbox %max%
    return max
}

min(values*)
{
    for index, value in values
        if(A_Index = 1 || value < min)
            min := value
    ;msgbox %min%
    return min
}



; Example: Hides the mouse cursor when you press Win+C. To later show the cursor, press Win+C again.
; This script is from www.autohotkey.com/forum/topic6107.html

OnExit, ShowCursor  ; Ensure the cursor is made visible when the script exits.
return

ShowCursor:
SystemCursor("On")
ExitApp

;#c::SystemCursor("Toggle")  ; Win+C hotkey to toggle the cursor on and off.

SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
{
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
    {
        $ = h                                          ; active default cursors
        VarSetCapacity( h_cursor,4444, 1 )
        VarSetCapacity( AndMask, 32*4, 0xFF )
        VarSetCapacity( XorMask, 32*4, 0 )
        system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
        StringSplit c, system_cursors, `,
        Loop %c0%
        {
            h_cursor   := DllCall( "LoadCursor", "Ptr",0, "Ptr",c%A_Index% )
            h%A_Index% := DllCall( "CopyImage", "Ptr",h_cursor, "UInt",2, "Int",0, "Int",0, "UInt",0 )
            b%A_Index% := DllCall( "CreateCursor", "Ptr",0, "Int",0, "Int",0
                , "Int",32, "Int",32, "Ptr",&AndMask, "Ptr",&XorMask )
        }
    }
    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ = b  ; use blank cursors
    else
        $ = h  ; use the saved cursors

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "Ptr",%$%%A_Index%, "UInt",2, "Int",0, "Int",0, "UInt",0 )
        DllCall( "SetSystemCursor", "Ptr",h_cursor, "UInt",c%A_Index% )
    }
}




