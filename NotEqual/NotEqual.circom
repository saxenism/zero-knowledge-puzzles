pragma circom 2.1.4;

// Input : a , length of 2 .
// Output : c .
// In this exercise , you have to check that a[0] is NOT equal to a[1], if not equal, output 1, else output 0.
// You are free to use any operator you may like . 

// HINT:NEGATION


// THIS WORKS IF THE INPUT WERE ONLY CONSTRAINED TO BINARY INPUTS, IE 0s and 1s.
// template NotEqual() {
//     signal input a[2];
//     signal output c;

//     signal intermediate;

//     // Since the inputs are binary, ie, can only be 0 or 1. We can use this logic.
//     // a xor b would return 0 if a == b 1 otherwise
//     // We simply need to return the xor result.
    
//     intermediate <== (a[0] + a[1] * (1 - a[0] - a[0]));

//     c <== intermediate;
// }

template NotEqual() {
    signal input a[2];
    signal output c;

    signal intermediate;

    intermediate <-- a[0] - a[1] == 0 ? 0 : 1;

    c <== intermediate;
}

component main = NotEqual();