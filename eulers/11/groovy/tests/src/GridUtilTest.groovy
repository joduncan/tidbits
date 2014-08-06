/**
 * Created by joduncan on 8/5/2014.
 */
class GridUtilTest extends GroovyTestCase {

    def grid44_2vert_fs = []
    def grid44_2vert_bs = []
    def grid44_2vert_h = []
    def grid44_2vert_v = []

    def test_grid = new GridUtil()

    def sample_data = []

    void setUp() {
        sample_data = [ [ 1, 2, 3, 4],
                        [ 5, 6, 7, 8],
                        [ 9,10,11,12],
                        [13,14,15,16]
        ]

        // FIXME: there's got to be a better way to set up the test data.
        // especially since I typo'ed at least 4 times already.
        // 2-vertex forward slashies
        grid44_2vert_fs.push([[0,0],[1,1]])
        grid44_2vert_fs.push([[0,1],[1,2]])
        grid44_2vert_fs.push([[0,2],[1,3]])

        grid44_2vert_fs.push([[1,0],[2,1]])
        grid44_2vert_fs.push([[1,1],[2,2]])
        grid44_2vert_fs.push([[1,2],[2,3]])

        grid44_2vert_fs.push([[2,0],[3,1]])
        grid44_2vert_fs.push([[2,1],[3,2]])
        grid44_2vert_fs.push([[2,2],[3,3]])

        // 2-vertex backward slashies
        grid44_2vert_bs.push([[1,0],[0,1]])
        grid44_2vert_bs.push([[1,1],[0,2]])
        grid44_2vert_bs.push([[1,2],[0,3]])

        grid44_2vert_bs.push([[2,0],[1,1]])
        grid44_2vert_bs.push([[2,1],[1,2]])
        grid44_2vert_bs.push([[2,2],[1,3]])

        grid44_2vert_bs.push([[3,0],[2,1]])
        grid44_2vert_bs.push([[3,1],[2,2]])
        grid44_2vert_bs.push([[3,2],[2,3]])

        grid44_2vert_v.push([[0,0],[0,1]])
        grid44_2vert_v.push([[0,1],[0,2]])
        grid44_2vert_v.push([[0,2],[0,3]])

        grid44_2vert_v.push([[1,0],[1,1]])
        grid44_2vert_v.push([[1,1],[1,2]])
        grid44_2vert_v.push([[1,2],[1,3]])

        grid44_2vert_v.push([[2,0],[2,1]])
        grid44_2vert_v.push([[2,1],[2,2]])
        grid44_2vert_v.push([[2,2],[2,3]])

        grid44_2vert_v.push([[3,0],[3,1]])
        grid44_2vert_v.push([[3,1],[3,2]])
        grid44_2vert_v.push([[3,2],[3,3]])

        grid44_2vert_h.push([[0,0],[1,0]])
        grid44_2vert_h.push([[0,1],[1,1]])
        grid44_2vert_h.push([[0,2],[1,2]])
        grid44_2vert_h.push([[0,3],[1,3]])

        grid44_2vert_h.push([[1,0],[2,0]])
        grid44_2vert_h.push([[1,1],[2,1]])
        grid44_2vert_h.push([[1,2],[2,2]])
        grid44_2vert_h.push([[1,3],[2,3]])

        grid44_2vert_h.push([[2,0],[3,0]])
        grid44_2vert_h.push([[2,1],[3,1]])
        grid44_2vert_h.push([[2,2],[3,2]])
        grid44_2vert_h.push([[2,3],[3,3]])
    }

    void test_horiz_lines() {
        assertEquals(grid44_2vert_h, test_grid.horiz_lines(sample_data.size, sample_data[0].size, 2))
    }

    void test_vert_lines() {
        assertEquals(grid44_2vert_v, test_grid.vert_lines(sample_data.size, sample_data[0].size, 2))
    }

    void test_forward_slashies() {
        assertEquals(grid44_2vert_fs, test_grid.forward_slashies(sample_data.size, sample_data[0].size, 2))
    }

    void test_back_slashies() {
        assertEquals(grid44_2vert_bs, test_grid.back_slashies(sample_data.size, sample_data[0].size, 2))
    }

    void test_vert_line_at() {
        assert [[0,0],[0,1],[0,2],[0,3]] == test_grid.vert_line_at(0,0,4)
    }

    void test_horiz_line_at() {
        assert [[0,0],[1,0],[2,0],[3,0]] == test_grid.horiz_line_at(0,0,4)
    }

    void test_forward_slashie_at() {
        assert [[0,0],[1,1],[2,2],[3,3]] == test_grid.forward_slashie_at(0,0,4)
    }

    void test_back_slashie_at() {
        assert [[0,0],[-1,1],[-2,2],[-3,3]] == test_grid.back_slashie_at(0,0,4)
    }
}
