t0 = "Hi there!"
param t0
call PRINT_STRING, 1
sayHi:
return
t1 = "Goodbye!"
param t1
call PRINT_STRING, 1
sayBye:
return
call sayHi, 0
call sayBye, 0
