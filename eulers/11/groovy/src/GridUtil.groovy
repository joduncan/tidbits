/**
 * Created by joduncan on 8/5/2014.
 */
class GridUtil {
    // currently assumes grid is of the same length/height.
    // but making it work for rectangular grids shouldn't be difficult.
    // I just don't care about that... yet.
    def lines(horiz, vert, line_length) {
        vert_lines(horiz, vert, length) + horiz_lines(horiz, vert, length) +
            forward_slashies(horiz, vert, length) + back_slashies(horiz, vert, length)
    }

    def vert_lines(horiz, vert, length) {
        def results = []

        def x_start = 0, x_end = horiz-1
        def y_start = 0, y_end = vert-length
        for(x in x_start..x_end) {
            for (y in y_start..y_end) {
                results.push(vert_line_at(x,y, length))
            }
        }
        return results
    }

    def horiz_lines(horiz, vert, length) {
        def results = []

        def x_start = 0, x_end = horiz-length
        def y_start = 0, y_end = vert-1
        for(x in x_start..x_end) {
            for (y in y_start..y_end) {
                results.push(horiz_line_at(x,y, length))
            }
        }
        return results
    }

    def forward_slashies(horiz, vert, length) {
        def results = []

        def x_start = 0, x_end = horiz-length
        def y_start = 0, y_end = vert-length
        for(x in x_start..x_end) {
            for (y in y_start..y_end) {
                results.push(forward_slashie_at(x,y, length))
            }
        }
        return results
    }

    def back_slashies(horiz, vert, length) {
        def results = []

        def x_start = length-1, x_end = horiz-1
        def y_start = 0, y_end = vert-length

        for(x in x_start..x_end) {
            for (y in y_start..y_end) {
                results.push(back_slashie_at(x,y, length))
            }
        }
        return results
    }

    def vert_line_at(x,y,length) {
        def coords = [[x,y]]
        for(iter_y in y+1..y+length-1) {
            coords.push([x,iter_y])
        }
        return coords
    }

    def horiz_line_at(x, y, length) {
        def coords = [[x,y]]
        for(iter_x in x+1..x+length-1) {
            coords.push([iter_x,y])
        }
        return coords
    }

    def forward_slashie_at(x,y,length) {
        def coords = [[x,y]]
        for(iter in 1..length-1) {
            coords.push([x+iter,y+iter])
        }
        return coords
    }

    def back_slashie_at(x,y,length) {
        def coords = [[x,y]]
        for(iter in 1..length-1) {
            coords.push([x-iter,y+iter])
        }
        return coords
    }
}
