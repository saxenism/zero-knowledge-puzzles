pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Be sure to solve IntSqrt before solving this 
// puzzle. Your goal is to compute the square root
// in the provided function, then constrain the answer
// to be true using your work from the previous puzzle.
// You can use the Bablyonian/Heron's or Newton's
// method to compute the integer square root. Remember,
// this is not the modular square root.


function intSqrtFloor(num) {
    // Base case
    if(num == 0 || num == 1) {
        return num;
    }

    var i = 1;
    var result = 1;

    while(result <= num) {
        i += 1;
        result = i * i;
    }

    return i - 1;
}

template IntSqrtOut(n) {
    signal input in;
    signal output out;

    out <-- intSqrtFloor(in);
    
    // Constraint 1: (out - 1) * (out - 1) < in
    component isLess = LessThan(n);
    isLess.in[0] <== (out - 1) * (out - 1);
    isLess.in[1] <== in;

    1 === isLess.out;

    // Constrain 2: (out + 1) * (out + 1) > in
    component isGreater = GreaterThan(n);
    isGreater.in[0] <== (out + 1) * (out + 1);
    isGreater.in[1] <== in;

    1 === isGreater.out;
}

component main = IntSqrtOut(252);
