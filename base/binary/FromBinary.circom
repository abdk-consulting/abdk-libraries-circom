/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "../assert/assert.circom";

/**
 * Convert given binary number into signal.
 *
 * @param n width in bits of the binary number (must be non-zero)
 * @input x n-bit wide binary number
 * @output result signal equal to the binary number modulo field size
 */
template FromBinary (n) {
  assert (n > 0);

  signal input x [n];
  signal output result;

  var sum = 0;

  for (var i = 0; i < n; i++) {
    assert (x [i] == 0 || x [i] == 1);

    sum += 2 ** i * x [i];
  }

  result <== sum;
}
