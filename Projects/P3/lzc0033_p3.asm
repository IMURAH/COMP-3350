;Le Cai
;lzc0033_p3.asm
;i did not use any external sources for this assignment
;this program tests if s1 and s2 are anagrams, if yes EAX will have value of 1, if not then 0

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
  s1 byte "GARDEN"
  s2 byte "DANGER"
  c1 byte 26 dup(0) ;counter for 26 alphabets for s1
  c2 byte 26 dup(0) ;counter for 26 alphabets for s2

.code
  main proc
  ;ZEROing Gen Registers
  MOV EAX, 0
  MOV EBX, 0
  MOV ECX, 0
  MOV EDX, 0

  ;this part is counting loop for s1
  MOV EDI, OFFSET s1
  MOV ECX, LENGTHOF s1

  LOOPS1:
    MOV BL, [EDI]
    SUB BL, 65
    INC c1[EBX]
    ADD EDI, TYPE s1

    LOOP LOOPS1

  ;this part is counting loop for s2
  MOV EDI, OFFSET s2
  MOV ECX, LENGTHOF s2

  LOOPS2:
    MOV BL, [EDI]
    SUB BL, 65
    INC c2[EBX]
    ADD EDI, TYPE s2

    LOOP LOOPS2

  MOV ESI, OFFSET c1
  MOV EDI, OFFSET c2
  MOV ECX, LENGTHOF c1

  ;we verify are s1 and s2 anagrams by subtracting the values, if we get 0 then its a match, if not it fails anagram test.
  VERIFY:
    MOV AL, [EDI]
    SUB AL, [ESI]
    CMP AL, 0
    JNE NOANA ; if not equal to 0, we jump to no anagram NOANA.
    ADD EDI, TYPE c1
    ADD ESI, TYPE c2

    LOOP VERIFY

    JMP ANA ;we finished the loop, therefore means we have an anagram, we jump to anagram ANA.

  NOANA: ;not anagram, assign 0 to eax, exit.
    MOV EAX, 0
    invoke ExitProcess, 0
  ANA: ;it is anagram, assign 1 to eax, exit.
    MOV EAX, 1
    invoke ExitProcess, 0

main ENDP
END main
