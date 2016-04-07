#!/bin/ruby

num_chapters, problems_per_page = ARGF.readline.split.map(&:to_i)
problems_per_chapter = ARGF.readline.split.map(&:to_i)

current_chapters_first_page = 0
special_problems = 0
(0..num_chapters-1).each { |ch|
current_chapters_first_page += 1
  (1..problems_per_chapter[ch]).each { |problem|
    if ((current_chapters_first_page + (problem-1)/problems_per_page) == problem)
	  special_problems += 1
	end
  }
  next_chapters_first_page = current_chapters_first_page
  problems_per_chapter[ch] -= problems_per_page
  if (problems_per_chapter[ch] > 0)
    next_chapters_first_page += problems_per_chapter[ch] / problems_per_page
    if ((problems_per_chapter[ch] % problems_per_page) != 0)
	  next_chapters_first_page += 1
	end
  end
  current_chapters_first_page = next_chapters_first_page
}
puts special_problems