#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <File.au3>

#RequireAdmin

#Region ### START Koda GUI section ### Form=C:\Users\Zelp\Documents\git\sfh\Interface KODA.kxf
$mainTab = GUICreate("AdBlocker", 368, 128, 253, 218)
$blockButton = GUICtrlCreateButton("Get rid of ads!", 16, 16, 227, 25)
$unblockButton = GUICtrlCreateButton("I want my ads back!", 16, 48, 227, 25)
$exitButton = GUICtrlCreateButton("I'm scared, get me the fuck out of here...", 16, 80, 227, 25)
$sfPic = GUICtrlCreatePic("C:\Users\Zelp\Documents\git\sfh\IMG\Sf-3.jpg", 256, 16, 96, 96)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
   $nMsg = GUIGetMsg()
   Switch $nMsg
	  Case $GUI_EVENT_CLOSE
		 Exit
	  Case $blockButton
		 block()
	  Case $unblockButton
		 ConsoleWrite("$unblockButton")
		 _FileCreate("C:\Windows\System32\drivers\etc\hosts")
		 MsgBox(0, "Yay", "I LOVE ADS!")
	  Case $exitButton
		 MsgBox(0, "Don't worry", "Nothing was done...")
		 Exit 1
   EndSwitch
WEnd

Func block()
   Local $filePath = "C:\Windows\System32\drivers\etc\hosts"
   Local $hostsFile = FileOpen($filePath, 1)
   Local $line = 1
   Local $aux = 1
   Local $urlsFile = "urls.txt"

   FileOpen($urlsFile)

   For $i = 1 to _FileCountLines($urlsFile)
	  $line = FileReadLine($urlsFile, $i)
	  FileWrite($hostsFile, $line & @CRLF)
   Next
   FileClose($urlsFile)
   MsgBox(16, "OH NO!", "Something went terribly wrong and now Spotify doesn't show more ads!!!ONZE!!11!" & @CRLF & "Have fun! ^^")
EndFunc
