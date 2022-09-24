; base on xlr-space.ahk
; modified by gz1a
; 文档 
;http://thinkai.net/help/1.1/
;https://wyagd001.github.io/zh-cn/docs/Hotkeys.htm 
;http://ahkcn.sourceforge.net/docs/Hotstrings.htm#Asterisk
;修饰符参考 http://thinkai.net/help/1.1_o/docs/Hotkeys.htm#Symbols
;切换中英文标点https://share.blog.csdn.net/article/details/5754732

;; 启用历史以检测上一个按键
#InstallKeybdHook
#KeyHistory
;; mouse
;#InstallMouseHook
;XButton1::Send {LControl Down}
;XButton1 Up::Send {LControl Up}


;; CtrlAltShift+X 一键开关延迟
; http://tieba.baidu.com/p/4968762107
^!+x::
suspend

Send ^!+q
Send ^!+w
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

;; Shift Space 切换 Space
global spaceAlted:= true
+space::
spaceAlted := !spaceAlted

if(spaceAlted){
ToolTip, ○○○ spaceAlted ○○○
}else{
ToolTip, ××× spaceAlted ×××
}
SetTimer, RemoveToolTip, 500
Sleep 500
return

;;; 自动 Reload
;; https://autohotkey.com/board/topic/43779-reload-this-script-shortcut-solved/
;#IfWinActive, workSpace.ahk - 记事本 ;; 不知道为什么不起作用，猜测中文
#IfWinActive, ahk_class Notepad
~^s::
ToolTip, ahk reloading...
SetTimer, RemoveToolTip, 100
Sleep 100
reload
;Sleep 200
;MsgBox, 4,, The hotstring just added appears to be improperly formatted.  Would you ;like to open the script for editing? 
;IfMsgBox, Yes, Edit
return

#IfWinActive              
;; 按键映射
;; Backspace as Del
backspace::delete
;; RAlt  as backspace
RAlt::backspace
;; Caps as Enter , Ctrl+Caps as Caps
^CapsLock::CapsLock
CapsLock::Enter


;;; Ctrl+Alt+W
;^!w::WinClose, A
; or ::Send ^{F4}

;;; Ctrl+Alt+A
^!A::Send {F6}

;; shorter short code
::sc::
SendInput, {{}{{}`%  `%{}}{}}{Left 4}
return
::scm::
SendInput, {{}{{}`% mask "" `%{}}{}}{Left 5}
return
;*** coding char replace
:?*:->::
SendbyClip("->")
return
:?*://::
SendbyClip("//")
return
 
;;;********* Space Alt;********* 
;; 判断是否重载 Space
if(spaceAlted == false)
    ToolTip, spaceAlted == false...
    SetTimer, RemoveToolTip, 100
    Return


;;; space + [] (windows virual desktop switcher)
;space & [::Send ^#{left}
;space & ]::Send ^#{right}

#if spaceAlted
   
;; space + Num as Win (并且延迟空格触发)
space & 1::Send ^{1} 
space & 2::Send ^{2}
space & 3::Send ^{3}
space & 4::Send ^{4}
space & 5::Send ^{5}
space & 6::Send ^{6}
space & 7::Send ^{7}
space & 8::Send ^{8}
space & 9::Send ^{9} 
space & 0::Send ^{0}

; 松开space
$space Up::
    SendLevel, 0 
    Send {space}  
    return
    
^space::Send ^{space}
#space::Send #{space}
^#space::Send ^#{space}
!space::Send !{space} 
^!space::Send ^!{space}
Return 

;;  space + XX
#if spaceAlted && GetKeyState("space", "P")
f & i:: Send +{up}
f & j:: Send +{left}
f & k:: Send +{down}
f & l:: Send +{right}
f & h:: Send +{home}   
f & n:: Send +{end}
d & i:: Send ^{up}
d & j:: Send ^{left}
d & k:: Send ^{down}
d & l:: Send ^{right}
s & k:: Send ^{down}
s & i:: Send ^{up}
;g & i:: Send ^+{up}
g & i:: Send +{up}  
g & j:: Send ^+{left}
;g & k:: Send ^+{down}
g & k:: Send +{down}
g & l:: Send ^+{right}
g & h:: Send +{home} 
g & n:: Send +{end}  

i:: Send {up}
j:: Send {left}
k:: Send {down}
l:: Send {right}
h:: Send {home}
n:: Send {end}
o:: Send {Pgup}
.:: Send {Pgdn}

c:: Send ^c
x:: Send ^x
v:: Send ^v  
z:: Send ^z
y:: Send ^y  

;Run msedge.exe
/:: Send ^/

q::Send {esc}
`;::Send {Enter}
t::Send ^!t
w::Send ^w
^w::WinClose,A
Tab::Send ^{Tab}

;; space + f when poppin
f up::
if(A_PriorKey = "f")
	Send ^{F6}
	sleep 50		
	Send {Ctrl}
return

;; space + g when poppin
g up::
if(A_PriorKey = "g")
	Send ^!+h
return

;; space + d when poppin
d up::
if(A_PriorKey = "d")
	Send ^!+d
return


sendbyclip(var_string)
{
    ClipboardOld = %ClipboardAll%
    Clipboard =%var_string%	
sleep 50
    send ^v
sleep 50
    Clipboard = %ClipboardOld%  ; Restore previous contents of clipboard.
}
 
