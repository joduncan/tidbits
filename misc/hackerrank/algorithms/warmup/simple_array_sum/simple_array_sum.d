import std.stdio;
import std.conv;
import std.string;
import std.file;
import std.array;
import std.algorithm;


int main(string[] args)
{
    int array_size = to!int(chomp(stdin.readln()));
    auto values = split(chomp(stdin.readln()))[0..array_size].map!(x => to!int(x));
    long total = values.sum(0);
    writeln(total);
    return 0;
}
