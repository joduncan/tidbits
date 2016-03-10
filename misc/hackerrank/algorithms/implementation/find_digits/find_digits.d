import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.range;
import std.algorithm;

// 1 <= T (number of tests) <= 15
// 1 <= N (some integer) <= 10^9

// find all digits of the number (aside from 0) that are evenly divisible into the number.
int main(string[] args)
{
    int num_tests = to!int(chomp(stdin.readln()));
    string number_str;
    int[] digits;
    long number;

    foreach(test; iota(num_tests))
    {
        number_str = chomp(stdin.readln());
        number = to!long(number_str);

        digits = [];

        foreach(digit_chr; number_str)
        {
            // chars are implicitly upcast to ints, so I need
            // to make a string to get the proper 0-9 chars to convert
            // to the relevant integer values.
            int digit = to!int(""~digit_chr);
            if (digit == 0)
            {
                continue;
            }
            else if(number % digit == 0)
            {
                digits ~= digit;
            }
        }
        writeln(digits.length);
    }
    return 0;
}
