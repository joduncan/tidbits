/**
 * Created by joshua on 8/6/2014.
 */
class MathUtil {
    def find_divisors(number) {
        def small_divisors = []
        def big_divisors = []
        def largest_possible_divisor = Math.sqrt(number), possible_divisor = 1
        while(possible_divisor <= largest_possible_divisor) {
            if((number % possible_divisor) == 0) {
                small_divisors<< possible_divisor
                // get rid of dupes for square nums
                if(number / possible_divisor != possible_divisor)
                    big_divisors << number / possible_divisor
            }
            possible_divisor++
        }
        return small_divisors+big_divisors
    }
}
