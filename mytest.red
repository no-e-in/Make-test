Red []

make-test: function [
    name [string!]
    test [string!]
    /test-div 
        t-div [string!]
    /assert-div 
        a-div [string!]
    ][
    t-div: any [t-div "--"]
    a-div: any [a-div "="]
    split-tests: split test t-div
    split-asserts: collect [foreach x split-tests [keep split x a-div]]
    list-res: 
        reduce 
            collect [
                foreach [x y] split-asserts [
                    keep to-block rejoin ["equal?" space x space y]
                ]
            ]
    list-print: 
        collect [
            foreach [x y] split-asserts [
                keep rejoin [
                    trim/head/tail x 
                    space a-div space 
                    trim/head/tail y
                ]
            ]
        ]
    negative-pos: 
        collect [
            repeat n length? list-res [
                if list-res/:n = false [keep n]
            ]
        ]
    numbers-tests: length? list-res
    negative-res: length? negative-pos
    positive-res: (length? list-res) - negative-res
    print [newline "Test name:" name]
    print ["Bad Tests:" negative-res "/" numbers-tests ]
    foreach n negative-pos [print rejoin [n ")" space list-print/:n]]
]

comment [
make-test "test1" {
add 7 3 = 10 
--
add 8 9 = 11}

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
]
