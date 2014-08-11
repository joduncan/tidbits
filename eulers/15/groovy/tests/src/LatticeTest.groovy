/**
 * Created by joshua on 8/9/2014.
 */
class LatticeTest extends GroovyTestCase {
    def test_lattice
//    void setUp() {
//        super.setUp()
//
//    }

    def test_lattice_creation(lattice_width, lattice_height, directions) {
        test_lattice = new Lattice([lattice_width, lattice_height], directions)
        def test_node, descendant_node1, descendant_node2
        def test_descendants
        for (x in 0..<lattice_width) {
            for (y in 0..<lattice_height) {
                test_node = test_lattice.node_at(x,y)
                assert test_node != null
                test_descendants = []
                // FIXME: check if directions contains RIGHT
                if(directions.contains(LatticeDirection.RIGHT) && x <lattice_width-1) {
                    test_descendants << test_lattice.node_at(x+1,y)
                }
                // FIXME: check if directions contains DOWN
                if(directions.contains(LatticeDirection.DOWN) && y<lattice_height-1) {
                    test_descendants << test_lattice.node_at(x,y+1)
                }

                // FIXME: check if directions contains LEFT
                if(directions.contains(LatticeDirection.LEFT) && x>0) {
                    test_descendants << test_lattice.node_at(x-1,y)
                }

                // FIXME: check if directions contains UP
                if(directions.contains(LatticeDirection.UP) && y>0) {
                    test_descendants << test_lattice.node_at(x,y-1)
                }

                assert test_node.name == x+":"+y
                assert test_node.descendants.sort() == test_descendants.sort()
            }
        }
    }

    void test_constructor() {
        test_lattice_creation(2, 2, [LatticeDirection.RIGHT])
        test_lattice_creation(3, 3, [LatticeDirection.LEFT, LatticeDirection.DOWN])
        test_lattice_creation(4, 4, [LatticeDirection.RIGHT, LatticeDirection.DOWN])
        test_lattice_creation(40, 40, [LatticeDirection.UP])
        test_lattice_creation(10, 20, [LatticeDirection.UP, LatticeDirection.DOWN,
                                       LatticeDirection.LEFT, LatticeDirection.RIGHT])
    }

    void test_breadth_first_exhaustive_path_search() {
        assert true == false
    }

    void test_depth_first_exhaustive_path_search() {
        assert true == false
    }

}
