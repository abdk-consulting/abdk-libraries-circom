/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
include "../compare/IsZero.circom";

/**
 * Tell whether given signal is a bit, i.e. equals to zero or one.
 *
 * @input x signal to check
 * @output result 1 if x is a bit, 0 otherwise
 */
template IsBit () {
  signal input x;
  signal output result;

  component isZero = IsZero ();

  isZero.x <== x * (x - 1);
  result <== isZero.result;
}
