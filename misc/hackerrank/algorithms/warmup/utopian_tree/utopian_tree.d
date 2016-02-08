import std.range;
import std.stdio;

int main(string[] args)
{
    foreach(index; iota(4))
    {
        writeln(index);
    }

    return 0;
}
