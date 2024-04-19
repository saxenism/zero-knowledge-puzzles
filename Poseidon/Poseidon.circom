pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/poseidon.circom";

// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {
   signal input a;
   signal input b;
   signal input c;
   signal input d;
   signal output out;

   var in_arr[4];

   in_arr[0] = a;
   in_arr[1] = b;
   in_arr[2] = c;
   in_arr[3] = d;   

   component hashing = Poseidon(4);
   for(var i = 0; i < 4; i++) {
      hashing.inputs[i] <== in_arr[i];
   }

   out <== hashing.out;
}

component main = poseidon();