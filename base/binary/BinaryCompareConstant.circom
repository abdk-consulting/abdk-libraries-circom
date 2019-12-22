/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "../assert/assert.circom";

/**
 * Compare given binary number of certain width with certain constant value.
 *
 * @param n width in bits of the binary number (must be non-zero)
 * @param c constant to compare binary number with
 * @param l value to return in case binary number is less than the constant
 * @param e value to return in case binary number is equal to the constant
 * @param g value to return in case binary number is greater than the constant
 * @input x n-bit wide binary number
 * @output result l, e, or g in case x is less than, equal to, or greater than
 *         the constant respectively
 */
template BinaryCompareConstant (n, c, l, e, g) {
  assert (n > 0);
  assert (c >> n == 0);

  signal input x [n];
  signal output result;

  signal t [n];

  for (var i = 0; i < n; i++) {
    assert (x [i] == 0 || x [i] == 1);

    if (i == 0) {
      if (c >> i & 1) t [i] <== l + x [i] * (e - l);
      else t [i] <== e + x [i] * (g - e);
    } else {
      if (c >> i & 1) t [i] <== l + x [i] * (t [i - 1] - l);
      else t [i] <== t [i - 1] + x [i] * (g - t [i - 1]);
    }
  }

  result <== t [n - 1];
}
