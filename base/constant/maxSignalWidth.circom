/*
 * This file is a part of ABDK Base CIRCOM Library.
 * Copyright © 2019 by ABDK Consulting (https://abdk.consulting/).
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
 
 include "../utils/signalWidth.circom";
 
/**
 * Get maximum possible width of a signal in bits.
 *
 * @return maximum possible width of a signal in bits
 */
function maxSignalWidth () {
  return signalWidth (-1)
}
