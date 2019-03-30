;Le Cai
;lzc0033_p1.asm
;i did not use any external sources for this assignment.
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
input BYTE 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h
shift BYTE 2h

.code
main PROC
  mov EAX, 0
  mov EBX, 0
  mov ECX, 0
  mov EDX, 0


  mov ah, input
  add ah, shift
  mov al, input + 1
  add al, shift

  mov bh, input + 2
  add bh, shift
  mov bl, input + 3
  add bl, shift

  mov ch, input + 4
  add ch, shift
  mov cl, input + 5
  add cl, shift

  mov dh, input + 6
  add dh, shift
  mov dl, input + 7
  add dl, shift

  INVOKE ExitProcess, 0
main ENDP
END main
