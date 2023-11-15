// DVD Logo simulator in C++ (terminal based)
// Jobega was here 

#include <iostream>
#include <cstdlib>  
#include <ctime>   

using namespace std;

const int SCREEN_WIDTH = 80;
const int SCREEN_HEIGHT = 25;

class DVDSimulator {
public:
    DVDSimulator() : x(0), y(0), xSpeed(1), ySpeed(1) {}

    void move() {
        x += xSpeed;
        y += ySpeed;

        if (x <= 0 || x >= SCREEN_WIDTH - 1) {
            xSpeed = -xSpeed;
        }

        if (y <= 0 || y >= SCREEN_HEIGHT - 1) {
            ySpeed = -ySpeed;
        }
    }

    void display() const {
        system("clear");
        for (int i = 0; i < y; ++i) {
            cout << endl;
        }
        for (int i = 0; i < x; ++i) {
            cout << ' ';
        }
        cout << "DVD" << endl;
    }

private:
    int x, y;      
    int xSpeed, ySpeed; 
};

int main() {
    srand(static_cast<unsigned>(time(nullptr)));
    DVDSimulator dvd;

    while (true) {
        dvd.move();
        dvd.display();
        for (int i = 0; i < 1000000; ++i) {
        }
    }

    return 0;
}
