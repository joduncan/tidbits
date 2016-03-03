import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.range;
import std.algorithm;

// constraints:
// 1 <= num_tests <= 10
// 1 <= N <= 1000
// 1 <= K <= N
// -100 <= Ai <= 100 where i: 1..N
// Ai == 0, student is assumed to have entered before
// the class started.

// output: YES if class is canceled, NO if it is not.

int main(string[] args)
{
    int num_tests = to!int(chomp(stdin.readln()));
    int students, threshold;
    bool enough_students;

    foreach(test; iota(num_tests))
    {
        enough_students = false;
        // first line: N K
        // N: students in the class
        // K: cancellation threshold.
        //    this is the number of students that must be present,
        //    or class will be canceled.
        auto markers = chomp(stdin.readln()).split.map!(x=>to!int(x)).array[0..2];
        students = markers[0];
        threshold = markers[1];

        // second line: N space-separated integers(A1,A2,A3..An)
        // each integer is the arrival time of a student.
        auto times = chomp(stdin.readln()).split.map!(x=>to!int(x));
        foreach(time; times)
        {
            if(time <= 0)
            {
                threshold--;
                if(threshold <= 0)
                {
                    enough_students = true;
                    writeln("NO");
                    break;
                }
            }
        }
        if(!enough_students)
        {
            writeln("YES");
        }
    }

    return 0;
}
