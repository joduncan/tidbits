import std.stdio;
import std.conv;
import std.string;
import std.range;


int main(string[] args)
{
    int stair_size = to!int(chomp(stdin.readln()));
    char[] output = new char[stair_size];
    foreach(num_stairs; iota(1, stair_size+1))
    {
        output[0..(stair_size-num_stairs)] = ' ';
        output[(stair_size-num_stairs)..stair_size] = '#';
        writeln(output);
    }
    return 0;
}
