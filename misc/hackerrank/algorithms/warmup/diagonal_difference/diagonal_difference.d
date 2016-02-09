import std.stdio;
import std.string;
import std.range;
import std.conv;
import std.math;
import std.algorithm;

int main(string[] args)
{
    int array_size = to!int(chomp(stdin.readln()));
    int values[][] = new int[][](array_size, array_size);
    int primary_sum = 0;
    int secondary_sum = 0;
    foreach(index; iota(array_size))
    {
        foreach(iter, item; split(chomp(stdin.readln()))[0..array_size].enumerate())
        {
            values[index][iter] = to!int(item);
        }
        primary_sum += values[index][index];
        secondary_sum += values[index][array_size-1-index];
    }
    writeln(abs(primary_sum-secondary_sum));
    return 0;
}
