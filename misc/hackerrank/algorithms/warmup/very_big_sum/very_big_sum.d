import std.stdio;
import std.conv;
import std.string;
import std.file;
import std.array;
import std.algorithm.iteration;

int main(string[] args)
{
    int array_size = to!int(chomp(stdin.readln()));
    auto values = split(chomp(stdin.readln()))[0..array_size].map!(x => to!int(x));
    // wish I knew why values.sum() produces a junk value. best I can tell is that it's not
    // upcasting ints to a long.
    long total = values.reduce!((a,b)=>long(a+b));
    writeln(total);
    return 0;
}
