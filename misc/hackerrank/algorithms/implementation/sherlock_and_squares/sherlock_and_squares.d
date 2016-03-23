import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.range;
import std.algorithm;
import std.math;

// 1 <= T (number of tests) <= 100
// 1 <= A <= B <= 10^9

// find all integers between whose square is between A & B (both inclusive)
int main(string[] args)
{
    int num_tests = to!int(chomp(stdin.readln()));
    float real_root;
    string[] square_strings;
    double[2] squares;
    int lower_root, upper_root;
    int[] answers;
    int current_answer;


    foreach(test; iota(num_tests))
    {
        square_strings = split(chomp(stdin.readln()))[0..2];
        squares = square_strings.map!(x => to!double(x)).array;

        current_answer = 0;

        real_root = sqrt(squares[1]);
        // since it's an inclusive test, round up to the nearest int for a non-int
        // square root on the high side.
        upper_root = to!int(real_root);
        if(real_root == upper_root)
        {
            current_answer += 1;
            upper_root -= 1;
        }

        real_root = sqrt(squares[0]);
        lower_root = to!int(real_root);
        // round up to the nearest int for a non-int square root on the low side.
        if(real_root == lower_root)
        {
            current_answer += 1;
        }

        current_answer += upper_root - lower_root;

        answers ~= current_answer;
    }
    writeln(answers.map!(x => to!string(x)).join("\n"));
    return 0;
}
