# Simple Base Class With Virtual Function and No Inheritance

Using pahole to see the debug information for the Base class:

```
$ pahole vtbl-no-inheritance
class Base {
public:

	void ~Base(class Base *, int);

	void Base(class Base *, );

	void Base(class Base *, const class Base  &);

	void Base(class Base *);

	int ()(void) * *           _vptr.Base;           /*     0     8 */
	virtual void function1(class Base *);

	void function2(class Base *);

	void function3(class Base *);

	/* vtable has 1 entries: {
	   [0] = function1((null)), 
	} */
	/* size: 8, cachelines: 1, members: 1 */
	/* last cacheline: 8 bytes */
};

```
Interestingly, there is a magical _vptr member data added by the compiler to the class containing the virtual member function. _vptr is a pointer to a list of function pointers, which is called the vtable and as revealed above, holds pointers to member functions that should actually be called when a call is made to the virtual member function from class Base. In this case, only the first entry [0] in the vtable has a value and points to its function1().

Also note that the size of the class is only 8 bytes which is enough to hold the vptr and not the vtable. The vtable, in fact, is stored in another section in the executable binary:

```
Contents of section .data.rel.ro:
 3d58 00000000 00000000 703d0000 00000000  ........p=......
 3d68 ca120000 00000000 00000000 00000000  ................   >>> vtable <<<
 3d78 38200000 00000000                    8 ......        
```
Which contains only one function pointer entry at its offset [0], ```ca120000 00000000```, being little endean translates to address ```0x12ca```, which points to the begining of void function1() as it should:
```
00000000000012ca <Base::function1()>:
    virtual void function1()
    12ca:	f3 0f 1e fa          	endbr64 
    12ce:	55                   	push   %rbp
``` 
Next intersting part is how you get the ```_vptr``` set up. The c++ compiler automagically creates a constructor for your class which has a virtual member function:
```
000000000000137e <Base::Base()>:
class Base {
    137e:	f3 0f 1e fa          	endbr64 
    1382:	55                   	push   %rbp
    1383:	48 89 e5             	mov    %rsp,%rbp
    1386:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    138a:	48 8d 15 d7 29 00 00 	lea    0x29d7(%rip),%rdx        # 3d68 <vtable for Base+0x10>
    1391:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1395:	48 89 10             	mov    %rdx,(%rax)
    1398:	90                   	nop
    1399:	5d                   	pop    %rbp
    139a:	c3                   	retq   
```
After some code inspection it becomes clear that all the constructor does is that it initializes ```Base::_vptr``` to the vtable for ```Base```. The compiler is moving ```this``` pointer which is passed to any non-static member function as first argument in rdi into the stack only to retrieve it later into rax. It also loads rdx with address of the vtable for Base ```lea    0x29d7(%rip),%rdx```. So now rdx contains the address of the vtable for Base and rax contains the ```this``` pointer for Base. The next instruction ```mov    %rdx,(%rax)``` effectively writes the address of vtable stored in rdx onto where ```Base::this``` points to. It turns out, from the pahole output above, that this is in fact the address of the first and only member of ```Base```, namely ```Base:_vptr```. Hence the constructor merely does this: ```Base::_vptr <-- vtable```.
