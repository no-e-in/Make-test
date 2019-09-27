# Make-test
A simple program to create tests in Red.
Examples:
```
make-test "test1" {
add 7 3 = 10 
--
add 8 9 = 11}

>>
Test name: test1
Bad Tests: 1 / 2
2) add 8 9 = 11

make-test/test-div/assert-div "test2" {
add 1 3 :: 4 
/

add 4 5 :: 8
/
remove-each x [1 2 3] [if x > 2 [true]] :: [1 2] 
/
foreach
x
[1 2 3]
[x] :: 6
/
add 22 56 :: 15} "/" "::"

>>
Test name: test2
Bad Tests: 4 / 5
2) add 4 5 :: 8
3) remove-each x [1 2 3] [if x > 2 [true]] :: [1 2]
4) foreach
x
[1 2 3]
[x] :: 6
5) add 22 56 :: 15
```
