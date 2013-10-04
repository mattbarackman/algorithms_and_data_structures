function assert(condition, successMessage, failMessage) {
    if (!condition) {
        throw failMessage || "Assertion failed";
    } else {
      console.log(successMessage || "test passed");
    }
}
