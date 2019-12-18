/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "IsZero.circom";

/**
 * Tell whether given two signals are equal.
 *
 * @input x first signal
 * @input y second signal
 * @output result 1 if x and y are equal, 0 otherwise
 */
template IsEqual () {
  signal input x;
  signal input y;
  signal output result;

  component isZero = IsZero ();

  isZero.x <== x - y;
  result <== isZero.result;
}
