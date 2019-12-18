/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

include "../assert/assert.circom";
include "../constant/maxSignalWidth.circom";
include "../utils/min.circom";

include "ToBinary.circom";

/**
 * Subtract a binary number from a constant.
 *
 * @param n width in bits of the binary number (must be non-zero)
 * @param c constant to subtract the binary number from
 * @input x n-bit wide binary number to subtract
 * @output result lowest n bits of the c - x
 */
template BinarySubtractFromConstant (n, c) {
  assert (n > 0);

  signal input x [n];
  signal output result [n];

  var msw = maxSignalWidth ();
  var chunkSize = msw - 2;
  var chunksCount = (n - 1) \ chunkSize + 1;

  signal carry [chunksCount];
  component toBinary [chunksCount];

  var thisChunkStart;
  var thisChunkSize;
  var cc = c;
  var sum;
  for (var i = 0; i < chunksCount; i++) {
    thisChunkStart = i * chunkSize;
    thisChunkSize = min (chunkSize, n - thisChunkStart);

    sum = 2**thisChunkSize + cc % 2**thisChunkSize - (i == 0 ? 0 : 1 - carry [i - 1]);

    for (var j = 0; j < thisChunkSize; j++)
      sum = sum - 2**j * x [thisChunkStart + j]; 

    toBinary [i] = ToBinary (thisChunkSize + 1);
    toBinary [i].x <== sum;

    for (var j = 0; j < thisChunkSize; j++)
      result [thisChunkStart + j] <== toBinary [i].result [j];

    carry [i] <== toBinary [i].result [thisChunkSize];

    cc = cc >> thisChunkSize;
  }
}
