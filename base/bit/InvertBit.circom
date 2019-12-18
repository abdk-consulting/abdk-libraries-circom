/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "../assert/assert.circom";

/**
 * Invert given bit.
 *
 * @input x bit to invert
 * @output result inverted bit
 */
template InvertBit () {
  signal input x;
  signal output result;

  assert (x == 0 || x == 1);

  result <== 1 - x;
}
