/**
 * Created by joshua on 8/7/2014.
 */
// n -> n/2 if n is even
// n-> 3n + 1 if n is odd

// for all #'s under 1 million, which # produces the longest chain?

// this code is also horribly inefficient. I read an article online about caching the chain lengths
// of all integers under 1000000, I should come back and implement that.

def chains(nth) {
    def chain_map = [:]
    def chain
    def chain_len
    for (i in 2..nth) {
        chain = []
        BigDecimal value = i
        while(value > 1) {
            chain << value
            value = (value.remainder(2) == 0) ?
                    value/2 :
                    value*3 + 1
        }
        chain_len = chain.size()
        if(chain_map.containsKey(chain_len)) {
            chain_map[chain_len] << i
        } else {
            chain_map[chain_len] = [i]
        }
    }
    return chain_map
}

def collatz_length(BigDecimal num) {
    def length = 1
    while(num > 1) {
        length++
        num = (num.remainder(2) == 0) ? num/2 : num*3 + 1
    }
    return length
}


my_chains = chains(1000000)
longest_chain = my_chains.keySet().max()
print "the number(s) under 1000000 with the longest chain are:\n"
print my_chains[longest_chain]+"\n"