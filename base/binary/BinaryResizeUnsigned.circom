/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

include "../assert/assert.circom";

/**
 * Resize unsigned binary number, i.e. change number of bits in it.
 *
 * @param n width in bits of the binary number to be resized (must be non-zero)
 * @param m width in bits of the resized binary number (must by non-zero)
 * @input x n-bit wide binary number to resize
 * @output result resized m-bit wide binary number
 */
template BinaryResizeUnsigned (n, m) {
  assert (n > 0);
  assert (m > 0);

  signal input x [n];
  signal output result [m];

  for (var i = 0; i < n && i < m; i++)
    result [i] <== x [i];

  for (var i = n; i < m; i++)
    result [i] <== 0;

  if (n > m) {
    var sum = 0;
    for (var i = m; i < n; i++)
      sum = sum + x [i];
    sum === 0;
  }
}
