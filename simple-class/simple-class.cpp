// base class
class Base {
public:
    int x;
    void function1(){
        x ++;
    }
};

int main(){
    Base *ptr = new Base();    
    ptr->function1();
    delete ptr;
    return 0;
}