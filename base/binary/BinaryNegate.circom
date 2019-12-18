/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

include "../assert/assert.circom";

include "BinarySubtractFromConstant.circom";

/**
 * Calculate the opposite of a binary number.
 *
 * @param n width in bits of the binary number (must be non-zero)
 * @input x n-bit wide binary number to calculate the opposite of
 * @output result the opposite of the given binary number
 */
template BinaryNegate (n) {
  assert (n > 0);

  signal input x [n];
  signal output result [n];

  component binarySubtractFromConstant = BinarySubtractFromConstant (n, 0);
  for (var i = 0; i < n; i++)
    binarySubtractFromConstant.x [i] <== x [i];
  for (var i = 0; i < n; i++)
    result [i] <== binarySubtractFromConstant.result [i];
}
