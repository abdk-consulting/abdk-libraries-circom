/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "CheckNonZero.circom";

/**
 * Ensure that given two signal are not equal.
 *
 * @input x first signal
 * @input y second signal
 */
template CheckNotEqual () {
  signal input x;
  signal input y;

  component checkNonZero = CheckNonZero ();

  checkNonZero.x <== x - y;
}
