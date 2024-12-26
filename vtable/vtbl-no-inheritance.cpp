// C++ program to show the working of vtable and vptr
#include <iostream>
using namespace std;

// base class
class Base {
public:
    virtual void function1()
    {
        cout << "Base function1()" << endl;
    }
    void function2()
    {
        cout << "Base function2()" << endl;
    }
    void function3()
    {
        cout << "Base function3()" << endl;
    }
};



// driver code
int main()
{
    // defining base class pointers
    Base* ptr1 = new Base();
    // calling all functions
    ptr1->function1();
    ptr1->function2();
    ptr1->function3();

    // deleting objects
    delete ptr1;

    return 0;
}