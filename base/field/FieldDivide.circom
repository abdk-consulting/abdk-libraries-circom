/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

/**
 * Divide one field element by another.
 *
 * @input x field element to divide
 * @input y field element to divide by
 * @output result x divided by y
 */
template FieldDivide () {
  signal input x;
  signal input y;
  signal output result;

  result <-- x / y;
  result * y === x;
}
