# Base Library

Base library contains basic useful templates and functions.
The library is split into several collections described in the sections below.

**WARNING:** All templates in this library are guaranteed to return correct result only when inputs are correct.
For bit inputs, “correct” means that input value is either zero or one.
For binary number inputs, “correct” means that all digits are bits.
In case all inputs are correct, but correct output does not exist, templates are guaranteed to fail, i.e. produce set of constraints that could not be satisfied.

## 1. Assert Collection

Assert collection contains assertion functions.

### 1.1. `assert` Function

#### Signature:

    function assert (condition)

#### Description:

Fail processing in case given `condition` is zero.

## 2. Binary Collection

Binary collection contains templates that deal with binary numbers with arbitrary bit width.

### 2.1. `BinaryAdd` Template

#### Signature

    template BinaryAdd (n, m)
      signal input x [m][n]
      signal output result [n]

#### Description:

Calculate sum of `m` `n`-bit wide binary numbers `x[0]`...`x[n-1]`.
Return lowest `n` bits of the sum as `result[0]...result[n-1]`.

### 2.2. `BinaryAddConstant` Template

#### Signature:

    template BinaryAddConstant (n, c)
      signal input x [n]
      signal output result [n]

Add constant `c` to an `n`-bit wide binary number `x[0]...x[n-1]`.
Return lowest `n` bits of the sum as `result[0]...result[n-1]`.

### 2.3. `BinaryCompare` Template

#### Signature:

    template BinaryCompare (n, l, e, g)
      signal input x [n]
      signal input y [n]
      signal output result

#### Description:

Compare two `n`-bit wide binary numbers: `x[0]...x[n-1]` and `y[0]...y[n-1]`.
Return as `result` `l`, `e`, or `g` if the first binary number is less than, equal to, or greater than the second binary number respectively.

### 2.4. `BinaryCompareConstant` Template

#### Signature:

    template BinaryCompareConstant (n, threshold, l, e, g)
      signal input x [n]
      signal output result

#### Description:

Compare `n`-bit wide binary number: `x[0]...x[n-1]` with constant `c`.
Return as `result` `l`, `e`, or `g` if the binary number is less than, equal to, or greater than the constant respectively.

### 2.5. `BinaryMultiplexor` Template

#### Signature:

    template BinaryMultiplexor (n)
      signal input index [n]
      signal input values [2 ** n]
      signal output result

#### Description:

Pick element of `values` array whose index is denoted by `n`-bit wide binary number `index[0]...index[n-1]` and return it as `result`.

### 2.6. `BinaryNegate` Template

#### Signature:

    template BinaryNegate (n)
      signal input x [n]
      signal output result [n]

#### Description:

Calculate binary-complement negation of `n`-bit wide binary number `x[0]...x[n-1]` and return is as `result[0]...result[n-1]`.

### 2.7. `BinaryResizeSigned` Template

#### Signature:

    template BinaryResizeSigned (n, m)
      signal input x [n]
      signal output result [m]

#### Description:

Resize `n`-bit wide signed binary number `x[0]...x[n-1]` to `m` bits, and return it as `result[0]...result[m-1]`.
Fail in case resize would lead to loss of information.

### 2.8. `BinaryResizeUnsigned` Template

#### Signature:

    template BinaryResizeUnsigned (n, m)
      signal input x [n]
      signal output result [m]

#### Description:

Resize `n`-bit wide unsigned binary number `x[0]...x[n-1]` to `m` bits, and return it as `result[0]...result[m-1]`.
Fail in case resize would lead to loss of information.

### 2.9. `BinarySubtract` Template

#### Signature:

    template BinarySubtract (n)
      signal input x [n]
      signal input y [n]
      signal output result [n]

#### Description:

Subtract `n`-bit wide binary number `y[0]...y[n-1]` from `n`-bit wide binary number `x[0]...x[n-1]`.
Return lowest `n` bits of subtraction result as `result[0]...result[n-1]`.

### 2.10. `BinarySubtractConstant` Template

#### Signature:

    template BinarySubtractConstant (n, c)
      signal input x [n]
      signal output result [n]

#### Description:

Subtract constant `c` from `n`-bit wide binary number `x[0]...x[n-1]`.
Return lowest `n` bits of subtraction result as `result[0]...result[n-1]`.

### 2.11. `BinarySubtractFromConstant` Template

#### Signature:

    template BinarySubtractFromConstant (n, c)
      signal input x [n]
      signal output result [n]

#### Description:

Subtract `n`-bit wide binary number `x[0]...x[n-1]` from constant `c`.
Return lowest `n` bits of subtraction result as `result[0]...result[n-1]`.

### 2.12. `FromBinary` Template

#### Signature:

    template FromBinary (n)
      signal input x [n]
      signal output result

#### Description:

Convert `n`-bit wide binary number `x[0]...x[n-1]` into a signal as return it as `result`.
Fail in case given binary number cannot be converted to a signal without loss of information.

### 2.13. `ToBinary` Template

#### Signature:

    template ToBinary (n)
      signal input x
      signal output result [n]

#### Description:

Convert signal `x` into `n`-bit wide binary number and return it as `result[0]...result[n-1]`.
Fail in case given signal cannot be converted to `n`-bit wide binary number without loss of information.

## 3. Bit Collection

Bit Collection contains template for manipulations with bits.

### 3.1. `BitAnd` Template

#### Signature:

    template BitAnd ()
      signal input x
      signal input y
      signal output result

#### Description:

Calculate logical “and” of bits `x` and `y`.
Return calculation result as `result`.

### 3.2. `BitImplies` Template

#### Signature:

    template BitImplies ()
      signal input x
      signal input y
      signal output result

### Description:

Calculate logical implication of two bits: `x` implies `y`.
Return calculation result as `result`.

### 3.3. `BitNand` Template

#### Signature:

    template BitNand ()
      signal input x
      signal input y
      signal output result

### Description:

Calculate inverted logical “and” of bits `x` and `y`.
Return calculation result as `result`.

### 3.4. `BitNimplies` Template

#### Signature:

    template BitNimplies ()
      signal input x
      signal input y
      signal output result

### Description:

Calculate inverted logical implication of two bits: `x` does not imply `y`.
Return calculation result as `result`.

### 3.5. `BitNor` Template

#### Signature:

    template BitNor ()
      signal input x
      signal input y
      signal output result

### Description:

Calculate inverted logical “or” of bits `x` and `y`.
Return calculation result as `result`.

### 3.6. `BitOr` Template

#### Signature:

    template BitOr ()
      signal input x
      signal input y
      signal output result

### Description:

Calculate logical “or” of bits `x` and `y` .
Return calculation result as `result`.

### 3.7. `BitXnor` Template

#### Signature:

    template BitXnor ()
      signal input x
      signal input y
      signal output result

### Description:

Calculate inverted logical exclusive “or” of bits `x` and `y`.
Return calculation result as `result`.

### 3.8. `BitXor` Template

#### Signature:

    template BitXor ()
      signal input x
      signal input y
      signal output result

### Description:

Calculate logical exclusive “or” of bits `x` and `y`.
Return calculation result as `result`.

### 3.9. `CheckBit` Template

#### Signature:

    template CheckBit ()
      signal input x

### Description:

Ensure that signal `x` is a bit.
Fail in case it is not.

### 3.10. `InvertBit` Template

#### Signature:

    template InvertBit ()
      signal input x
      signal output result

### Description:

Calculate logical inversion of a bit: not `x`.
Return calculation result as `result`.

### 3.11. `IsBit` Template

#### Signature:

    template IsBit ()
      signal input x
      signal output result

### Description:

Tell whether signal `x` is a bit.
Return as `result` one if `x` is a bit and one zero otherwise.

## 4. Compare Collection

Compare Collection contains templates for comparing signals.

### 4.1. `CheckEqual` Template

#### Signature:

    template CheckEqual ()
      signal input x
      signal input y

#### Description:

Ensure that signals `x` and `y` are equal.
Fail if they are not.

### 4.2. `CheckNonZero` Template

#### Signature:

    template CheckNonZero ()
      signal input x

#### Description:

Ensure that signal `x` is non zero.
Fail if it is.

### 4.3. `CheckNotEqual` Template

#### Signature:

    template CheckNotEqual ()
      signal input x
      signal input y

#### Description:

Ensure that signals `x` and `y` are not equal.
Fail if they are.

### 4.4. `CheckZero` Template

#### Signature:

    template CheckZero ()
      signal input x

#### Description:

Ensure that signal `x` is zero.
Fail if it is not.

### 4.5. `IsEqual` Template

#### Signature:

    template IsEqual ()
      signal input x
      signal input y
      signal output result

#### Description:

Tell whether signals `x` and `y` are equal.
Return as `result` one if they are and zero if they are not.

### 4.6. `IsNonZero` Template

#### Signature:

    template IsNonZero ()
      signal input x
      signal output result

#### Description:

Tell whether signal `x` is non zero.
Return as `result` one if it isand zero if it is not.

### 4.7. `IsEqual` Template

#### Signature:

    template IsNotEqual ()
      signal input x
      signal input y
      signal output result

#### Description:

Tell whether signals `x` and `y` are not equal.
Return as `result` one if they are not equal and zero if they are equal.

### 4.8. `IsZero` Template

#### Signature:

    template IsZero ()
      signal input x
      signal output result

#### Description:

Tell whether signal `x` is zero.
Return as `result` one if it is and zero if it is not.

## 5. Constants

Constants collection contains functions that return various useful constants.

### 5.1. `maxSignal` Function

#### Signature:

    function maxSignal ()

#### Description:

Return maximum signal value.

### 5.2. `maxSignalWidth` Function

#### Signature:

    function maxSignalWidth ()

#### Description:

Return width in bits of maximum signal value.

## 6. Field

Field collection contains templates for performing calculations with field elements.

### 6.1. `FieldDivide` Template

#### Signature:

    template FieldDivide ()
      signal input x
      signal input y
      signal output result

#### Description:

Divide field element `x` by field element `y`.
Return division result as `result`.

### 6.2. `FieldDivideByConstant` Template

#### Signature:

    template FieldDivideByConstant (c)
      signal input x
      signal output result

#### Description:

Divide field element `x` by constant `c`.
Return division result as `result`.

### 6.3. `FieldDivideConstant` Template

#### Signature:

    template FieldDivideConstant (c)
      signal input x
      signal output result

#### Description:

Divide constant `c` by field element `x`.
Return division result as `result`.

### 6.4. `FieldSqrt` Template

#### Signature:

    template FieldSqrt ()
      signal input x
      signal output result

#### Description:

Calculate and return as `result` square root of field element `x`.
This template always returns lowest of two possible square root values, but generated constraints treat both root values as valid.

## 7. Utils

Utils collection contains various useful functions.

### 7.1. `max` Function

#### Signature:

    function max (x, y)

#### Description:

Calculate maximum of two signal values: `x` and `y`.

### 7.2. `min` Function

#### Signature:

    function min (x, y) {

#### Description:

Calculate minimum of two signal values: `x` and `y`.

### 7.3. `signalWidth` Function

#### Signature:

    function signalWidth (x)

#### Description:

Calculate width in bits of signal value `x`.
