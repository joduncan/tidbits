import groovy.transform.EqualsAndHashCode

/**
 * Created by joshua on 8/7/2014.
 */
// FYI this assumes only one node of any given name within the grid/lattice/graph/whatevs
@EqualsAndHashCode(includes=["name"])
class LatticeNode {
    def descendants = []
    String name

    LatticeNode(node_name) { name = node_name }

    LatticeNode(node_name, node_descendants) {
        name = node_name
        descendants = node_descendants
    }
//    def add_descendant(new_descendant) { descendants << new_descendant }
}