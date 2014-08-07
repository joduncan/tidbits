/**
 * Created by joshua on 8/6/2014.
 */

// this is a naive implementation. it says so right in the filename.
// if it's horribly slow, I'll probably look into some sort of jumping around
// within the number set in bigger increments to narrow in on the appropriate part
// of the sequence without a bajillion "wasted" calculations. if I can. it seems
// the number of divisors fluctuates wildly in the higher parts of the sequence.

// I'm sure there is some clever math to know when the number of divisors jumps significantly,
// but I can't put my finger on one yet. that's what these 'puters are for. ;-)

def script_util = new MathUtil()
def script_tri_num = new TriangularNumbers()
def my_nth = 2

while(script_util.find_divisors(script_tri_num.find(my_nth)).size() < 500) {
    my_nth++
}

print "hopefully, the value of the first triangular number " + my_nth \
        + " to have over 500 divisors, " + script_tri_num.find(my_nth) + ", is correct"