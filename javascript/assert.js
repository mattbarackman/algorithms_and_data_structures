function assert(condition, message) {
    if (!condition) {
        throw message || "Assertion failed";
    } else {
      console.log("test passed");
    }
}
