import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.range;
import std.algorithm;
import std.bigint;

// 1 <= T(number of tests) <= 10
// 1 <= N (number of growth cycles) <= 60

// odd growth cycles: size doubles
// even growth cycles: size increases by 1.

// I'm sure there's some algorithm for this, but I'm
// drawing a blank. first approach: brute force.
int main(string[] args)
{
    int num_tests = to!int(chomp(stdin.readln()));
    BigInt[] answers = [];
    int growth_cycles = 0;
    BigInt depth = 1;

    foreach(test; iota(num_tests))
    {
        growth_cycles = to!int(chomp(stdin.readln()));
        depth = 1;
        foreach(cycle; iota(growth_cycles))
        {
            if(cycle % 2 == 0)
            {
                depth *= 2;
            }
            else
            {
                depth += 1;
            }
        }
        answers ~= depth;
    }
    writeln(answers.map!(x => x.toDecimalString).join("\n"));
    return 0;
}
