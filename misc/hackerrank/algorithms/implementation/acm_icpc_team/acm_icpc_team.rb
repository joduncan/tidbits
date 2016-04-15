#!/bin/ruby

num_presenters, num_topics = ARGF.readline.split.map(&:to_i)
presenters = []
(0..num_presenters-1).each { |presenter|
  presenters[presenter] = ARGF.readline.to_i(2)
}

combos = {}

# ruby has all sorts of whiz-bang helper functions.
pairs = (0..num_presenters-1).to_a.permutation(2).map(&:sort).uniq

max = 0
max_pairs = 0

pairs.each { |a,b|
  # combine the topics of the two presenters
  known_topics = presenters[a] | presenters[b]

  # count how many topics have at least one knowledgeable presenter.
  count =  ("%b" % known_topics).gsub(/0/, '').length

  if (count >= max)
    if(count > max)
      max_pairs = 1
    else
      max_pairs += 1
    end
    max = count
  end
}

puts max
puts max_pairs
