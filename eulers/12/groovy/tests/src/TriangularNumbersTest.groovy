/**
 * Created by joshua on 8/6/2014.
 */
class TriangularNumbersTest extends GroovyTestCase {
    def test_obj = new TriangularNumbers()

//    void setUp() {
//        super.setUp()
//    }

    void test_find() {
        assertEquals(1, test_obj.find(1))
        assertEquals(3, test_obj.find(2))
        assertEquals(6, test_obj.find(3))
        assertEquals(10, test_obj.find(4))
        assertEquals(15, test_obj.find(5))
        assertEquals(21, test_obj.find(6))
        assertEquals(28, test_obj.find(7))
        assertEquals(36, test_obj.find(8))
        assertEquals(45, test_obj.find(9))
    }

    void test_up_to() {
        assertEquals([1], test_obj.up_to(1).sort())
        assertEquals([1,3], test_obj.up_to(2).sort())
        assertEquals([1,3,6], test_obj.up_to(3).sort())
        assertEquals([1,3,6,10], test_obj.up_to(4).sort())
        assertEquals([1,3,6,10,15], test_obj.up_to(5).sort())
        assertEquals([1,3,6,10,15,21], test_obj.up_to(6).sort())
        assertEquals([1,3,6,10,15,21,28], test_obj.up_to(7).sort())
        assertEquals([1,3,6,10,15,21,28,36], test_obj.up_to(8).sort())
        assertEquals([1,3,6,10,15,21,28,36,45], test_obj.up_to(9).sort())
    }
}
