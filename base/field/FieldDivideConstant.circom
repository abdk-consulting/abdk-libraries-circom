/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

/**
 * Divide constant by field element.
 *
 * @param c constant to divide by field element
 * @input x field element to divide constant by
 * @output result c divided by x
 */
template FieldDivideConstant (c) {
  signal input x;
  signal output result;

  result <-- c / x;
  result * x === c;
}
