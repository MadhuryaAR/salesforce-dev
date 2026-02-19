// Intentionally includes irregular whitespace characters
// NBSP (U+00A0), ZWSP (U+200B), NNBSP (U+202F), mid-line BOM (U+FEFF)

// NBSP between “const” and “alpha”
const alpha = 1;    // contains a non-breaking space (U+00A0)

// ZWSP before “=”
//const beta​= 2;     // zero-width space (U+200B)

// NNBSP before “+”
const sum = alpha + beta;   // narrow no-break space (U+202F)

// Trailing NBSP at line end
const gamma = 3;            // NBSP after semicolon

// Mid-line BOM between identifier and “=”
let delta﻿ = 4;             // U+FEFF embedded

// Multiple irregular whitespaces together
let ​  mix = alpha + beta + gamma + delta;

console.log(alpha + beta + sum + gamma + delta + mix);
