import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.range;
import std.algorithm;
import std.bigint;

// 1 <= T(number of tests) <= 20
// 1 <= N (number of digits in number) <= 100000

// This is a somewhat different variation of the
// "get 4 gallons of water into a 5 gallon jug using
// only the 5 gallon jug and a second, 3 gallon jug" problem.

// I think it's also a case of combinatorial mathematics, which
// I'm somewhat bad at (so far). let's see if I can get better.

// if digits % 3 == 2, the biggest combo may be 5.repeat((digits / 3 - 1)) + 3.repeat(5)
// if digits % 3 == 1, the biggest combo may be ... either 3.repeat(x*5)
// if digits % 3 == 0, the biggest combo is 5.repeat(digits)

int main(string[] args)
{
    int num_tests = to!int(chomp(stdin.readln()));
    string[] answers = [];
    int test_digits = 0;
    int modulo = 0;
    int multiplier = 0;
    int threes_digits = 0;
    int fives_digits = 0;

    foreach(test; iota(num_tests))
    {
        fives_digits = 0;
        threes_digits = 0;
        test_digits = to!int(chomp(stdin.readln()));
        modulo = test_digits % 3;
        final switch(modulo)
        {
            case 0:
                fives_digits = test_digits;
                break;
            case 1:
            case 2:
                multiplier = 3 - modulo;
                if(test_digits >= 5*multiplier)
                {
                    if((test_digits - 5*multiplier) % 3 == 0)
                    {
                        fives_digits = test_digits - 5*multiplier;
                        threes_digits = 5*multiplier;
                    }
                }
                break;
        }
        if(fives_digits != 0 || threes_digits != 0)
        {
            answers ~= "5".repeat(fives_digits).join ~ "3".repeat(threes_digits).join;
        }
        else
        {
            answers ~= "-1";
        }
    }
    writeln(answers.join("\n"));

    return 0;
}
