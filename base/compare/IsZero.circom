/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Tell whether given signal is zero.
 *
 * @input x signal to check
 * @output result 1 if x is zero, 0 otherwise
 */
template IsZero () {
  signal input x;
  signal output result;

  signal invX;

  invX <-- x == 0 ? 0 : 1 / x;

  result <== 1 - x * invX;

  x * result === 0;
}
