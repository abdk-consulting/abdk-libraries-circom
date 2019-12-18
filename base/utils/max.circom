/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Calculate maximum of two signals.
 *
 * @param x first signal
 * @param y second signal
 * @return maximum of two signals
 */
function max (x, y) {
  return x > y ? x : y;
}
