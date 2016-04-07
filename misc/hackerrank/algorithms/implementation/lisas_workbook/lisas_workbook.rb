#!/bin/ruby

num_chapters, problems_per_page = ARGF.readline.split.map(&:to_i)
problems_per_chapter = ARGF.readline.split.map(&:to_i)

current_chapters_first_page_number = 1
special_problems = 0
(1..num_chapters).each { |ch|
  (1..problems_per_chapter[ch-1]).each { |problem|
    special_problems += 1 if ((current_chapters_first_page_number + problem/problems_per_page) == problem)
  }
  current_chapters_first_page_number += problems_per_chapter[ch-1] / problems_per_page
  current_chapters_first_page_number += 1 if (problems_per_chapter[ch-1] % problems_per_page != 0)
}
puts special_problems