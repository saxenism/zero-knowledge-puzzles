pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Create a circuit that is satisfied if
// in[0] is the floor of the integer integer
// sqrt of in[1]. For example:
// 
// int[2, 5] accept
// int[2, 5] accept
// int[2, 9] reject
// int[3, 9] accept
//
// If b is the integer square root of a, then
// the following must be true:
//
// (b - 1)(b - 1) < a
// (b + 1)(b + 1) > a
// 
// be careful when verifying that you 
// handle the corner case of overflowing the 
// finite field. You should validate integer
// square roots, not modular square roots

function floor_square_root(num) {
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

template IntSqrt(n) {
    signal input in[2];
    signal floor_sqrt <-- floor_square_root(in[1]);
    log(floor_sqrt);
    // component isEqual = IsEqual();
    // isEqual.in[0] <== floor_sqrt;
    // isEqual.in[1] <== in[1];

    // 1 === isEqual.out;

    // Adding the constraints listed out in the question 
    // Constraint 1: (b-1) * (b-1) < a
    signal b_minus_1_sq <== (in[0] - 1) * (in[0] - 1);
    component isLess = LessThan(n);
    isLess.in[0] <== b_minus_1_sq;
    isLess.in[1] <== in[1];

    1 === isLess.out;

    // Constraint 2: (b+1)*(b+1) > a
    signal b_plus_1_sq <== (in[0] + 1) * (in[0] + 1);
    component isGreater = GreaterThan(n);
    isGreater.in[0] <== b_plus_1_sq;
    isGreater.in[1] <== in[1];

    1 === isGreater.out;
}

component main = IntSqrt(252);
