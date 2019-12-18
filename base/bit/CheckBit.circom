/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Ensure that given signal is a bit, i.e. equals to zero or one.
 *
 * @input x signal to check
 */
template CheckBit () {
  signal input x;

  x * (x - 1) === 0;
}
