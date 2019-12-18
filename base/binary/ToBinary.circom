/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "../assert/assert.circom";
include "../bit/CheckBit.circom";
include "../compare/CheckZero.circom";
include "../constant/maxSignalWidth.circom";
include "BinaryCompareConstant.circom";

/**
 * Convert given signal to binary representation of certain width.
 *
 * @param n width in bits of binary representation
 * @input x signal to convert to binary representation
 * @output result n-bit wide binary representation of x
 */
template ToBinary (n) {
  signal input x;
  signal output result [n];

  assert (x >> n == 0);

  var msw = maxSignalWidth ();
  var sum = 0;

  component check [n];

  for (var i = 0; i < n; i++) {
    result [i] <-- (x >> i) & 1;

    if (i >= msw) check [i] = CheckZero ();
    else check [i] = CheckBit ();

    check [i].x <== result [i];

    if (i < msw)
      sum += 2 ** i * result [i];
  }

  x === sum;

  if (n >= msw) {
    component binaryCompareConstant = BinaryCompareConstant (msw, -1, 0, 0, 1);
    for (var i = 0; i < msw; i++)
      binaryCompareConstant.x [i] <== result [i];
    binaryCompareConstant.result === 0;
  }
}
