pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Write a circuit that constrains the 4 input signals to be
// sorted. Sorted means the values are non decreasing starting
// at index 0. The circuit should not have an output.

template IsSorted() {
    signal input in[4];

    component let1 = LessEqThan(16);
    component let2 = LessEqThan(16);
    component let3 = LessEqThan(16);

    let1.in[0] <== in[0];
    let1.in[1] <== in[1];

    let2.in[0] <== in[1];
    let2.in[1] <== in[2];

    let3.in[0] <== in[2];
    let3.in[1] <== in[3];

    let1.out === 1;
    let2.out === 1;
    let3.out === 1;
}

component main = IsSorted();
