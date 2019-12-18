/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "../assert/assert.circom";

/**
 * Calculate disjunction (logical “or”) of two given bits.
 *
 * @input x first bit
 * @input y second bit
 * @output result disjunction of x and y
 */
template BitOr () {
  signal input x;
  signal input y;
  signal output result;

  assert (x == 0 || x == 1);
  assert (y == 0 || y == 1);

  result <== 1 - (1 - x) * (1 - y);
}
