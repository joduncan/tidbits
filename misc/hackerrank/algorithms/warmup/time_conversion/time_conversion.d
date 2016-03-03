import std.stdio;
import std.string;
import std.array;
import std.regex;
import std.algorithm;
import std.conv;

enum time_unit { HOURS, MINUTES, SECONDS };

int main(string[] args)
{
    string user_time = chomp(stdin.readln());
    // split on :'s, stick values into array
    // don't forget that static arrays are not ranges, and
    // therefore, useless/invalid in most of the stuff
    // within std.algorithm.*
    auto time_sections = split(user_time, ':')[0..3];
    bool is_pm = false;

    // here I fall into the classic programmer's trap:
    // 1. "I've got a problem. I know, I'll solve it with regexp's!"
    // 2. "Now I have two problems."
    if(!matchFirst(time_sections[time_unit.SECONDS], r"PM").empty())
    {
        is_pm = true;
    }
    // remove the am/pm
    time_sections[time_unit.SECONDS] = replaceAll(time_sections[time_unit.SECONDS], regex(r"[AP]M"), "");

    // convert time sections from strings to ints.
    auto time = time_sections.map!(a => to!int(a) ).array;
    // bump up hours if it's PM.
    if(is_pm && time[time_unit.HOURS] != 12)
    {
        time[time_unit.HOURS] += 12;
    }
    else if(!is_pm && time[time_unit.HOURS] == 12)
    {
        time[time_unit.HOURS] = 0;
    }
    // convert time array back from ints to strings, so that join works.
    writeln(time.map!(x=>format("%02d", x)).join(":"));
    return 0;
}
