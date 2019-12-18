/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Tell whether given signal is non-zero.
 *
 * @input x signal to check
 * @output result 1 if x is non-zero, 0 otherwise
 */
template IsNonZero () {
  signal input x;
  signal output result;

  signal invX;

  invX <-- x == 0 ? 0 : 1 / x;

  result <== x * invX;

  x * (1 - result) === 0;
}
