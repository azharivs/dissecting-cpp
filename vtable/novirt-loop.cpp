// C++ program to show the working of vtable and vptr
#include <iostream>
using namespace std;

// base class
class Base {
public:
    long long x;
    void function1(int i)
    {
        x += i;
    }
    void function2(int i)
    {
        x += 2*i;
    }
    void function3(int i)
    {
        x += (3*i >> 10);
    }
    void result()
    {
        cout << "Base " << x << endl;
    }
};

// class derived from Base
class Derived1 : public Base {
public:
    long long y;
    // overriding function1()
    void function1(int i)
    {
        y += i;
    }
    // not overriding function2() and function3()
    void result()
    {
        cout << "Derived1 " << x+y << endl;
    }
};

// class derived from Derived1
class Derived2 : public Derived1 {
public:
    long long z;
    // again overriding function2()
    void function2(int i)
    {
        z += i;
    }
    // not overriding function1() and function3()
    void result()
    {
        cout << "Derived2 " << x+y+z << endl;
    }
};

// driver code
int main()
{
    long long i;

    // defining base class pointers
    Base* ptr1 = new Base();
    Derived1* ptr2 = new Derived1();
    Derived2* ptr3 = new Derived2();

    // calling all functions
    for (i = 0; i < 500000000; i++) {
        ptr1->function1(i);
        ptr1->function2(i);
        ptr1->function3(i);
        ptr2->function1(i);
        ptr2->function2(i);
        ptr2->function3(i);
        ptr3->function1(i);
        ptr3->function2(i);
        ptr3->function3(i);
    }

    ptr1->result();
    ptr2->result();
    ptr3->result();

    // deleting objects
    delete ptr1;
    delete ptr2;
    delete ptr3;

    return 0;
}