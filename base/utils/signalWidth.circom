/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
/**
 * Get width of a signal in bits.
 *
 * @param x signal to get width of
 * @return width of the signal in bits
 */
function signalWidth (x) {
  var i = 0;
  while (x >> i > 0) i += 1;
  return i;
}
