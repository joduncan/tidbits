/**
 * Created by joshua on 8/7/2014.
 */
class LatticeNodeTest extends GroovyTestCase {
    void test_equality() {
        def gn1 = new LatticeNode("test", [])
        def gn2 = new LatticeNode("test", [1,2])
        def gn3 = new LatticeNode("test2", [1,2])
        assert gn1 == gn2
        assert gn2 != gn3
    }
}
