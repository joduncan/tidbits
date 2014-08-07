/**
 * Created by joshua on 8/6/2014.
 */
class MathUtilTest extends GroovyTestCase {
    def math_util = new MathUtil()

    void test_find_divisors() {
        assertEquals([1,101], math_util.find_divisors(101).sort())
        assertEquals([1,2,5,10], math_util.find_divisors(10).sort())
        assertEquals([1,2,3,4,6,12], math_util.find_divisors(12).sort())
        assertEquals([1,3,9], math_util.find_divisors(9).sort())
        assertEquals([1,2,4,5,10,20], math_util.find_divisors(20).sort())
        assertEquals([1,3,7,21], math_util.find_divisors(21).sort())
        assertEquals([1,2,4,7,14,28], math_util.find_divisors(28).sort())
    }
}