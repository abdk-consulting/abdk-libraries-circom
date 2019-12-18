/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

include "../assert/assert.circom";
include "../utils/min.circom";

/**
 * Calculate square root of given field element.
 *
 * @input x field element to calculate square root of
 * @output result square root of x
 */
template FieldSqrt () {
  signal input x;
  signal output result;

  assert (x == 0 || x**(-1 / 2) == 1);

  if (x == 0 || x != 0) { // Prevent calculation at compile time
    var q = -1;
    var s = 0;

    while (q % 2 == 0) {
      q = q >> 1;
      s = s + 1;
    }

    assert (-1 == q * 2**s);

    var z = 1;
    while (z**(-1 / 2) == 1) z += 1;

    var m = s;
    var c = z**q;
    var t = x**q;
    var r = x**((q + 1) / 2);
    var i;
    var b;

    while (t != 0 && t != 1) {
      i = 1;
      while (t**(1 << i) != 1) i += 1;

      b = c**(2**(m - i - 1));
      m = i;
      c = b**2;
      t = t * b**2;
      r = r * b;
    }

    result <-- t == 0 ? 0 : min (r, -r);
  }

  result * result === x;
}
