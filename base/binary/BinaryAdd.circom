/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */

include "../assert/assert.circom";
include "../bit/CheckBit.circom";
include "../constant/maxSignalWidth.circom";
include "../utils/min.circom";
include "../utils/signalWidth.circom";

include "ToBinary.circom";

/**
 * Add several binary numbers.
 *
 * @param n width in bits of the binary numbers (must be non-zero)
 * @param m count of binary numbers to be added (but be non-zero)
 * @input x an array of n-bit wide binary numbers to be added
 * @output result lowest n bits of the sum of given binary numbers
 */
template BinaryAdd (n, m) {
  assert (n > 0);
  assert (m > 0);

  var msw = maxSignalWidth ();

  signal input x [m][n];
  signal output result [n];

  if (m == 1) {
    for (var i = 0; i < n; i++) {
      result [i] <== x [0][i];
    }
  } else {
    var carryBits = signalWidth (m - 1);
    assert (carryBits < msw - 1);
    var chunkSize = msw - 1 - carryBits;
    var chunksCount = (n - 1) \ chunkSize + 1;

    component check [n];
    signal carry[chunksCount];
    component carryToBinary[chunksCount];

    var thisChunkSize;
    var sum;
    var bitIndex = 0;
    for (var i = 0; i < chunksCount; i++) {
      thisChunkSize = min (chunkSize, n - bitIndex);

      sum = i == 0 ? 0 : carry [i - 1];

      for (var j = 0; j < thisChunkSize; j++) {
        for (var k = 0; k < m; k++) {
          assert (x [k][bitIndex] == 0 || x [k][bitIndex] == 1);

          sum += 2 ** j * x [k][bitIndex];
        }

        result [bitIndex] <-- sum >> j & 1;
        check [bitIndex] = CheckBit ();
        check [bitIndex].x <== result [bitIndex];

        sum = sum - 2**j * result [bitIndex];

        bitIndex += 1;
      }

      carry [i] <-- sum >> thisChunkSize;
      carryToBinary [i] = ToBinary (carryBits);
      carryToBinary [i].x <== carry [i]; // Ensure that carry fits into carryBits

      sum = sum - 2**thisChunkSize * carry [i];

      sum === 0;
    }
  }
}
