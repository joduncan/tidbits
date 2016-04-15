#!/bin/ruby

num_presenters, num_topics = ARGF.readline.split.map(&:to_i)
presenters = {}
(0..num_presenters-1).each { |presenter|
  topics = ARGF.readline.split('').map(&:to_i)
  presenters[presenter] = topics
}

combos = {}

# ruby has all sorts of whiz-bang helper functions.
pairs = presenters.keys.permutation(2).map(&:sort).uniq

pairs.each { |a,b|
  # zip the topics for each presenter together.
  pair_topics = presenters[a].zip(presenters[b])

  # count how many topics have at least one knowledgeable presenter.
  count = pair_topics.select { |pair| 1 if pair.any? { |topic| topic == 1 } }.length

  # populate hash table of # of topics, and how many pairs know that many topics.
  combos[count] = 0 unless (combos.key?(count))
  combos[count] += 1
}

max_topics = combos.keys.max
puts max_topics
puts combos[max_topics]
