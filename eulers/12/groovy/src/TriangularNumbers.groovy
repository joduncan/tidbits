/**
 * Created by joshua on 8/6/2014.
 */
class TriangularNumbers {
    // TODO: find out if groovy has a built-in for this, similar to ruby's :+ operator.
    def sum = { x,y->x+y }

    def find(nth) {
        (1..nth).inject(sum)
    }

    def up_to(nth) {
        def nums = [1]
        def index = 2

        while (index <= nth) {
            nums << (1..index).inject(sum)
            index++
        }
        return nums
    }
}
