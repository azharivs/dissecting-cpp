## How to build the example
g++ -g simple-class.cpp -o simple-class

## Generate assembly code
objdump -CdsS  simple-class > simple-class.asm

# Understanding the generated assembly

First let's check the size the class Base, which turns out to be only 4 bytes, enough to store its member data, with no space needed to store functions (methods). This will be different in classes using virtual functions as we will see in the vtables example.
```
$ pahole ./simple-class
class Base {
public:

	int                        x;                    /*     0     4 */
	void function1(class Base *);


	/* size: 4, cachelines: 1, members: 1 */
	/* last cacheline: 4 bytes */
};
```

```
int main(){
    ...
    Base *ptr = new Base();    
    1175:	bf 04 00 00 00       	mov    $0x4,%edi
    117a:	e8 e1 fe ff ff       	callq  1060 <operator new(unsigned long)@plt>
    117f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    1185:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
```
According to the C calling convention, the ```di``` register holds the first argument which is the only argument to the ```new``` operator. This has already been set to 0x4 which is the size of ```class Base```. The return value of the call to ```new``` is put in register ```rax``` according to C calling convention. Therefore, the next instruction after callq is zeroing out the low order long (4-bytes) contents of where rax points to ```(%rax)```, effectively initializing the member variable ```int x``` to zero. Finally, the 64-bit pointer to the new class is written to the stack at the first position after the base pointer register ```mov %rax,-0x8(%rbp)```. This is a general practice by compiler and is done so that rax can be reused in the code.
```
    ptr->function1();
    1189:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    118d:	48 89 c7             	mov    %rax,%rdi
    1190:	e8 1d 00 00 00       	callq  11b2 <Base::function1()>
```
Here the compiler is putting code to call the member function, ```Base::function1()```. It starts by loading the first argument to the function (rdi) with the pointer to the Base object that was previously instantiated. It might be surprising that although Base::function1() has no arguments, why does the compiler generate such code to pass a pointer to the object to the member function? Then answer is that C++ always passes the ```this``` pointer to all (non-static) member functions. And this is how the compiler generates the code to do that.
