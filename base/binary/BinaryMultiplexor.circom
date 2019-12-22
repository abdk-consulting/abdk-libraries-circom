/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "../assert/assert.circom";
include "../constant/maxSignalWidth.circom";

/**
 * Select one of 2^n signals based on n-bit wide binary index.
 *
 * @param n width in bits of the binary index
 * @input index n-bit wide binary index
 * @input values signals to select from
 * @output result basically values [index]
 */
template BinaryMultiplexor (n) {
  var msw = maxSignalWidth ();

  assert (n < msw);

  signal input index [n];
  signal input values [2 ** n];
  signal output result;

  if (n == 0) result <== values [0];
  else {
    component even = BinaryMultiplexor (n - 1);
    component odd = BinaryMultiplexor (n - 1);

    for (var i = 1; i < n; i++) {
      assert (index [i] == 0 || index [i] == 1);

      even.index [i - 1] <== index [i];
      odd.index [i - 1] <== index [i];
    }

    for (var i = 0; i < 2 ** n; i += 2) {
      even.values [i \ 2] <== values [i];
      odd.values [i \ 2] <== values [i + 1];
    }

    assert (index [0] == 0 || index [0] == 1);
    result <== even.result + index [0] * (odd.result - even.result);
  }
}
