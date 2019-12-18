/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Ensure that given signal is zero.
 *
 * @input x signal to check
 */
template CheckZero () {
  signal input x;

  x === 0;
}
