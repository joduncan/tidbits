import std.stdio;
import std.conv;
import std.algorithm;
import std.string;
import std.format;

int main(string[] args)
{
    int pos = 0, neg = 0, zero = 0;
    int array_size = to!int(chomp(stdin.readln()));
    auto values = split(chomp(stdin.readln()))[0..array_size].map!(x => to!int(x));
    foreach(value; values)
    {
        if(value > 0)
        {
            pos++;
        }
        else if (value < 0)
        {
            neg++;
        }
        else
        {
            zero++;
        }
    }
    writeln(format("%1.6f", float(pos) / values.length));
    writeln(format("%1.6f", float(neg) / values.length));
    writeln(format("%1.6f", float(zero) / values.length));
    return 0;
}
