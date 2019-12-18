/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

/**
 * Divide field element by constant.
 *
 * @param c constant to divide field element by
 * @input x field element to divide
 * @output result x divided by c
 */
template FieldDivideByConstant (c) {
  signal input x;
  signal output result;

  result <== x * (1 / c);
}
