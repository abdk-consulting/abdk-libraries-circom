/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Calculate minimum of two signals.
 *
 * @param x first signal
 * @param y second signal
 * @return minimum of two signals
 */
function min (x, y) {
  return x < y ? x : y;
}
