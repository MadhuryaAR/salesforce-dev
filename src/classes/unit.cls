@isTest(isParAllel=false)
private class MyTestClass {
@isTest(isParAllel=false)
static void testMethod1() {
// Test logic for method 1
}
@isTest(isParAllel=true)
static void testMethod2() {
// Test logic for method 2
}
@IsTest(isparallel=true)
static void test1() {
// Some test code
}
// Tests excluded from running during the
// the installation of a package.
@IsTest(OnInstall=true)
static void test2() {
// Some test code
}
@IsTest(isparallel=false)
static void test3() {
// Some test code
}
