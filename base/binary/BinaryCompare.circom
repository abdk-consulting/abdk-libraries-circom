/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

include "../assert/assert.circom";

/**
 * Compare two binary numbers.
 *
 * @param n width in bits of the binary numbers (must be non-zero)
 * @param l value to return if the first number is less than the second one
 * @param e value to return if the first number equals to the second one
 * @param g value to return if the first number is greater than the second one
 * @input x first n-bit wide binary number to compare
 * @input y second n-bit wide binary number to compare
 * @output result l, e, or g in case x is less than, equal to, or greater than y
 */
template BinaryCompare (n, l, e, g) {
  assert (n > 0);

  signal input x [n];
  signal input y [n];
  signal output result;

  signal t [n];
  signal xy [n - 1];

  for (var i = 0; i < n; i++) {
    assert (x [i] == 0 || x [i] == 1);
    assert (y [i] == 0 || y [i] == 1);

    if (i == 0) {
      t [i] <== e +
                x [i] * (g - e) +
                y [i] * (l - e) +
                x [i] * y [i] * (2 * e - g - l);
    } else {
      xy [i - 1] <== x [i] * y [i];
      t [i] <== t [i - 1] * (1 - x [i] - y [i] + 2 * xy [i - 1]) +
                x [i] * g +
                y [i] * l -
                xy [i - 1] * (g + l);
    }
  }

  result <== t [n - 1];
}
