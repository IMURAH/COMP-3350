;Le Cai
;lzc0033_p2.asm
;i did not use any external sources for this assignment.
;this program shifts input array by number of shifts to the right direction
;for example input = 1 2 3 4 5 6 7 8 9 10 and we shift by 1
;we should yield output = 10 1 2 3 4 5 6 7 8 9

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
input BYTE 4h, 5h, 6h, 7h, 8h, 9h, 10h, 1h, 2h, 3h
shift DWORD 3
output BYTE LENGTHOF input DUP(?)

.code
main PROC
  ;ZEROing Gen Registers
  MOV EAX, 0
  MOV EBX, 0
  MOV ECX, 0
  MOV EDX, 0

  ;put 1st element of input inside ESI
  MOV ESI, OFFSET input
  ;put 1st element of output inside EDI
  MOV EDI, OFFSET output
  ;make sure first element is now in a shifted position
  ADD EDI, shift

  ;we break loop into two parts shift - end and 0 - shift
  ;this is shift - end part
  ;move in the total amount of loops we need
  MOV EBX, LENGTHOF input
  ;minus numbers we've shifted
  SUB EBX, shift
  ;copy into ECX
  MOV ECX, EBX

  S_END:
    MOV AL, [ESI] ; move 1st element of input to AL
    MOV [EDI], AL ; move 1st element of input to 1st shifted element in output
    ADD ESI, 1 ; increment ESI for next loop
    ADD EDI, 1 ; increment EDI for next loop

    LOOP S_END

  MOV EDI, 0 ; Reset EDI
  MOV EDI, OFFSET output ; make sure EDI stores 1st unshifted element of output
  MOV ECX, shift ; use number of shifts we had as a counter in ECX for loop no.2

  S_SHIFT:
    MOV AL, [ESI] ; move next input element to AL
    MOV [EDI], AL ; move AL to first element of output array

    ADD ESI, 1 ; increment ESI for next loop
    ADD EDI, 1 ; increment EDI for next loop

    LOOP S_SHIFT

  INVOKE ExitProcess, 0
main ENDP
END main
