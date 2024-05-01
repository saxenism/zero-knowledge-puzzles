pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Use the same constraints from IntDiv, but this
// time assign the quotient in `out`. You still need
// to apply the same constraints as IntDiv

template IntDivOut(n) {
    signal input numerator;
    signal input denominator;
    signal output out;

    signal remainder;
    signal quotient;

    quotient <-- numerator \ denominator;
    remainder <-- numerator - (quotient * denominator);

    // Constrain 1: Remainder should be lesser than the denominator
    component isLessThan = LessThan(n);
    isLessThan.in[0] <== remainder;
    isLessThan.in[1] <== denominator;

    1 === isLessThan.out;

    // Constrain 2: These values should follow the formula -> n = (q * d) + r
    numerator - remainder === quotient * denominator;

    // Constraint 3: The constraint unique to this challenge
    out <== quotient;
}

component main = IntDivOut(252);
