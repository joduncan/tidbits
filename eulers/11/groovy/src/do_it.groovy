/**
 * Created by joshua on 8/5/2014.
 */
def number_grid = []

def script_grid_util = new GridUtil()

// these lines are represented as lists of coordinates for each point in the line.
// after that, it's kinda up to you how you want to operate on them.
// this is perhaps overkill for this problem, but I have a hunch that I may be doing
// more things in the future with grids, and being able to get coordinate groups for lines of
// random lengths (like this GridUtil class should provide) may come in handy for future unknown
// grid transformations/manipulations.

// TODO: this should probably be a static method. and the 4 should be taken from command-line args.
def all_possible_grid_lines = script_grid_util.line_coord_groups(number_grid.length, number_grid[0].length, 4)

// a pair of useful little closures
def addnums = { x,y -> x+y }
def lookup = { grid, coords -> grid[coords[0]][coords[1]] }
def line_sum = { grid, coord_list -> coord_list.collect { lookup(grid, it) }.inject(addnums) }

//all_possible_grid_lines.collect { line_coord_group ->
//    line_coord_group.collect { coords ->
//        lookup(number_grid, coords)
//    }.inject(addnums)
//}.max()

// trying this with some shorthand.
//all_possible_grid_lines.collect { it.collect { lookup(number_grid, it) }.inject(addnums) }.max()

// turned inner collection into a closure in hopes of better readability.
println "max line-sum is hopefully: " + all_possible_grid_lines.collect { line_sum(number_grid, it) }.max()