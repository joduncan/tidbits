/**
 * Created by joshua on 8/7/2014.
 */
class Lattice {
    List<LatticeDirection> edge_directions = [];
    // 2d array is typed so that IDEA doesn't bitch about not knowing API's/variables in the
    // GraphNodes that I'm sticking in there.
    Collection<Collection<LatticeNode>> node_array = []
    def lattice_width, lattice_height
    LatticeNode root = null

    Lattice(dimensions, directions) {
        // this doesn't handle scenarios where someone tells us to create an unconnected graph.
        // that would be really bad, so don't do that!
        edge_directions = directions

        lattice_width = dimensions[0]
        lattice_height = dimensions[1]

        for (x in 0..<lattice_width) {
            node_array << []
            for (y in 0..<lattice_height) {
                // explicitly initializing the descendants isn't necessary,
                // but I like being explicit sometimes, so that others won't
                // have to guess at the assumptions/hidden code on which that I'm
                // making my decisions.
                node_array[x] << new LatticeNode(x + ":" + y, [])
            }
        }

        // nodes are created, now connect them properly.
        for (x in 0..<lattice_width) {
            node_array << []
            for (y in 0..<lattice_height) {
                if(edge_directions.contains(LatticeDirection.RIGHT) && x < lattice_width-1)
                    node_array[x][y].descendants << node_array[x+1][y]
                if(edge_directions.contains(LatticeDirection.DOWN) && y < lattice_height-1)
                    node_array[x][y].descendants << node_array[x][y+1]
                // TODO: these aren't really used yet, outside of test cases, and may be broken.
                if(edge_directions.contains(LatticeDirection.LEFT) && x > 0)
                    node_array[x][y].descendants << node_array[x-1][y]
                if(edge_directions.contains(LatticeDirection.UP) && y > 0)
                    node_array[x][y].descendants << node_array[x][y-1]
            }
        }
        root = node_array[0][0]
    }

    def find(node) {
        def start_x = -1, start_y = -1
        for (x in 0..<node_array.size()) {
            for(y in 0..<node_array[0].size()) {
                if(node_array[x][y] == node){
                    start_x = x
                    start_y = y
                }
            }
        }
        return [start_x, start_y]
    }

    def includes(node) {
        for (x in 0..<node_array.size()) {
            for(y in 0..<node_array[0].size()) {
                if(node_array[x][y] == node)
                    return true
            }
        }
        return false
    }

    def node_at(x,y) {
        if (((x >= 0) && (x<lattice_width)) &&
            ((y >= 0) && (y<lattice_height)))
            return node_array[x][y]
        else
            return null
    }

    // kinda wish IDEA was smart enough to figure out that start_node and end_node
    // are LatticeNodes
    def breadth_first_exhaustive_path_search(LatticeNode start_node, LatticeNode end_node) {
        if (! includes(start_node) || ! includes(end_node))
            return []
//        else if(start_node == end_node)
//            return [start_node]

        def paths = []

        // each "item" in the queue needs to be a list of nodes comprising the path through the lattice.
        def possible_paths = [[start_node]]

        while(possible_paths.size() > 0) {
            List<LatticeNode> current_path = possible_paths.remove(0)

            if (current_path.last() == end_node)
                // no need to keep looking at more nodes beyond this one, we found the end-point of our path.
                paths.push(current_path)
            else {
                possible_paths += current_path.last().descendants.collect { current_path + it }
            }
        }

        return paths
    }

    def depth_first_exhaustive_path_search(start_node, end_node) {
        if (! includes(start_node) || ! includes(end_node))
            return []

        def paths = []
        // each "item" in the queue needs to be a list of nodes comprising the path through the lattice.
        def possible_paths = [[start_node]]

        while(possible_paths.size() > 0) {
            List<LatticeNode> current_path = possible_paths.pop()

            if (current_path.last() == end_node)
            // no need to keep looking at more nodes beyond this one, we found the end-point of our path.
                paths.push(current_path)
            else {
                possible_paths += current_path.last().descendants.collect { current_path + it }
            }
        }

        return paths
    }
}