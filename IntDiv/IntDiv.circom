pragma circom 2.1.8;
include "../node_modules/circomlib/circuits/comparators.circom";

// Create a circuit that is satisfied if `numerator`,
// `denominator`, `quotient`, and `remainder` represent
// a valid integer division. You will need a comparison check, so
// we've already imported the library and set n to be 252 bits.
//
// Hint: integer division in Circom is `\`.
// `/` is modular division
// `%` is integer modulus

template IntDiv(n) {
    signal input numerator;
    signal input denominator;
    signal input quotient;
    signal input remainder;

    /*
    signal denominator_inverse <-- 1 / denominator;

    // How do we make sure that the inverse was correct? We use the IsEqual comparator
    component isEqual = IsEqual();

    isEqual.in[0] <== 1;
    isEqual.in[1] <== denominator * denominator_inverse;

    isEqual.out === 1; // This ensures that the denominator_inverse is indeed correct
    */

    // Once we have established that, we need to work towards the guiding formula more:
    // numerator = (quotient * denominator) + remainder
    // numerator + (-remainder) = quotient * denominator ===> This forms a quadratic constraint.
    
    // Another thing we have to constraint is that the remainder can never be greater than the denominator.
    // Because without the above constraint the original formula can still be satisfied without giving the correct numbers for integer divison

    component isLessThan = LessThan(n);
    isLessThan.in[0] <== remainder;
    isLessThan.in[1] <== denominator;

    // This is constraint 1
    1 === isLessThan.out; // This ensures remainder < denominator

    // This is constraint 2
    numerator - remainder === quotient * denominator; // This ensures the correctness of the division formula
}

component main = IntDiv(252);
