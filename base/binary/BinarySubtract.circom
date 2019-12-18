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
 * Subtract one binary number from another.
 *
 * @param n width in bits of the binary numbers (must be non-zero)
 * @input x a binary number to subtract from
 * @input y a binary number to subtract
 * @output result lowest n bits of the binary complement encoding of the
 *                subtraction result
 */
template BinarySubtract (n) {
  assert (n > 0);

  signal input x [n];
  signal input y [n];
  signal output result [n];

  var msw = maxSignalWidth ();
  var chunkSize = msw - 2;
  var chunksCount = (n - 1) \ chunkSize + 1;

  signal carry [chunksCount];
  component toBinary [chunksCount];

  var thisChunkStart;
  var thisChunkSize;
  var sum;
  for (var i = 0; i < chunksCount; i++) {
    thisChunkStart = i * chunkSize;
    thisChunkSize = min (chunkSize, n - thisChunkStart);

    sum = 2**thisChunkSize - (i == 0 ? 0 : 1 - carry [i - 1]);

    for (var j = 0; j < thisChunkSize; j++) {
      sum = sum + 2**j * (x [thisChunkStart + j] - y [thisChunkStart + j]);
    }

    toBinary [i] = ToBinary (thisChunkSize + 1);
    toBinary [i].x <== sum;

    for (var j = 0; j < thisChunkSize; j++)
      result [thisChunkStart + j] <== toBinary [i].result [j];

    carry [i] <== toBinary [i].result [thisChunkSize];
  }
}
