pragma circom 2.1.8;

// Create a circuit that takes an array of signals `in[n]` and
// a signal k. The circuit should return 1 if `k` is in the list
// and 0 otherwise. This circuit should work for an arbitrary
// length of `in`.

// Solving this problem with the assumption that the entries are either 1 or 0
// 

template HasAtLeastOne(n) {    
}

component main = HasAtLeastOne(4);
