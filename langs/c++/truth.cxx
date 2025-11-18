#include <iostream>

using namespace std;

class TruthMachine {

public:
    void enter_true() {
        while (true)
            cout << "1" << endl;
    }

    void enter_false() {
        cout << "0" << endl;
    }
};


int main(void) {

    cout << "\n"
      << "C++ implementation of the Truth Machine\n"
      << "\n"
      << "The Truth Machine is a simple program for learning\n"
      << "a programing language that takes only two inputs.\n"
      << "\n"
      << "* 1: Infinitely outputs \"1\". You can exit using <Ctrl-C>.\n"
      << "* 0: Outputs \"0\" and terminates.\n\n";

    string buf;
    TruthMachine tm;

    bool waiting = true;
    do {
        cout << "Enter 1 or 0: ";
        getline(cin, buf);

        try {
            long val = stol(buf);
            if (val == 1L) {
                tm.enter_true();
                waiting = false;
            }
            else if (val == 0L) {
                tm.enter_false();
                waiting = false;
            }
        }
        catch (exception &e) {
            // discard input and retry
        }
    } while (waiting);

    return 0;
}
