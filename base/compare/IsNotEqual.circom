/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "IsNonZero.circom";

/**
 * Tell whether given two signals are not equal.
 *
 * @input x first signal
 * @input y second signal
 * @output result 1 if x and y are not equal, 0 otherwise
 */
template IsNotEqual () {
  signal input x;
  signal input y;
  signal output result;

  component isNonZero = IsNonZero ();

  isNonZero.x <== x - y;
  result <== isNonZero.result;
}
