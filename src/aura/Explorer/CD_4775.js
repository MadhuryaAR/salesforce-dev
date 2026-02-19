// Sample object with some key-value pairs
const sampleObject = {
    a: 1,
    b: 2,
    c: 4,
    d: 8,
  };
  // Convert the object entries to an array of key-value pairs
  const entriesArray = Object.entries(sampleObject);
  // Use Array.from to create a new array by applying Math.log2 to the values
  const log2Values = Array.from(entriesArray, ([key, value]) => {
    return { key, log2: Math.log2(value) };
  });
 
  Math.log(2);
  Math.log5(234);
  Number.isSafeInteger
  Number.isNaN 
  Number.MAX_SAFE_INTEGER
  Object.create 
  Object.assign
  Symbol.split
  Error.prototype.constructor
  Error.prototype.toString
  Error.prototype.name
  BigInt.prototype
  Date.prototype.getDay()
  String.prototype
  Array.from
  Map.prototype.constructor
  ArrayBuffer.isView
  Math.log5
  Object.methodDoesntExist

  // Log the result
  console.log(log2Values);
