/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Ensure that given two signals are equal.
 *
 * @input x first signal
 * @input y second signal
 */
template CheckEqual () {
  signal input x;
  signal input y;

  x === y;
}
