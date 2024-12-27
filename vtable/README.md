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

# Base Class With Virtual Function and Inheritance
In the next example ```vtbl.cpp``` we have one base class ```Base``` and two derived classes, ```Derived1::Base``` and ```Derived2::Derived1::Base```. We also have three ```virtual``` member functions for the base class which have been overloaded as ```Derived1::function1()``` and ```Derived2::function2()```.

We expect that the vtable for each class contains three elements, one for each virtual member function of the base class, as these should be called through one level of indirection. Indeed, pahole reveals that this is the case:
```
class Base {
public:

	void ~Base(class Base *, int);

	void Base(class Base *, );

	void Base(class Base *, const class Base  &);

	void Base(class Base *);

	int ()(void) * *           _vptr.Base;           /*     0     8 */
	virtual void function1(class Base *);

	virtual void function2(class Base *);

	virtual void function3(class Base *);

	/* vtable has 3 entries: {
	   [0] = function1((null)), 
	   [1] = function2((null)), 
	   [2] = function3((null)), 
	} */
	/* size: 8, cachelines: 1, members: 1 */
	/* last cacheline: 8 bytes */
};
```
It also shows that the only relevant entries in each vtable of the derived classes are those for which the virtual base member function has been overloaded:
```
class Derived1 : public Base {
public:

	/* class Base                <ancestor>; */      /*     0     8 */
...
	virtual void function1(class Derived1 *);

	/* vtable has 1 entries: {
	   [0] = function1((null)), 
	} */
	/* size: 8, cachelines: 1, members: 1 */
	/* last cacheline: 8 bytes */
};
class Derived2 : public Derived1 {
public:

	/* class Derived1            <ancestor>; */      /*     0     8 */
...
	virtual void function2(class Derived2 *);

	/* vtable has 1 entries: {
	   [1] = function2((null)), 
	} */
	/* size: 8, cachelines: 1, members: 1 */
	/* last cacheline: 8 bytes */
};
```
Also note that each derived class has a pointer to its parent class, which is placed right at the first eight bytes (64-bit pointers).

The vtables are sotred in a special section of the binary file ```.data.rel.ro```:
```
Contents of section .data.rel.ro:
 3cc8           00000000 00000000               403d0000 00000000  
 3cd8 Derived2::82140000 00000000               be140000 00000000  
 3ce8           46140000 00000000               00000000 00000000  
 3cf8           583d0000 00000000 Derived1::    82140000 00000000  
 3d08           0a140000 00000000               46140000 00000000  
 3d18           00000000 00000000               703d0000 00000000  
 3d28 Base::    ce130000 00000000               0a140000 00000000  
 3d38           46140000 00000000               00000000 00000000  
 3d48           68200000 00000000               583d0000 00000000   
 3d58           00000000 00000000               78200000 00000000   
 3d68           703d0000 00000000               00000000 00000000  
 3d78           82200000 00000000                     
```
Considering the little-endianness of x86-64, here is how the vtables look like:
```
Base::vtable
3d28 00 00 00 00 00 00 13 ce --> #<Base::function1()>
     00 00 00 00 00 00 14 0a --> #<Base::function2()>
     00 00 00 00 00 00 14 46 --> #<Base::function3()>
3cf0 00 00 00 00 00 00 14 82 --> #<Derived1::function1()>
     00 00 00 00 00 00 14 0a --> #<Base::function2()>
     00 00 00 00 00 00 14 46 --> #<Base::function3()>
3cd8 00 00 00 00 00 00 14 82 --> #<Derived1::function1()>
     00 00 00 00 00 00 14 be --> #<Derived2::function2()>
     00 00 00 00 00 00 14 46 --> #<Base::function3()>
```
Browsing the assembly generated from the machine code, it is easy to see that there are now one constructor generated by the compiler for each class containing a virtual function or inheriting from it. The constructor merely sets up the vptr to the vtable for that class and initializes the vtables appropriately.

Let us now see how the call to ```Derived2::function2()``` is translated by the compiler:
```
    ptr3->function2();
    12eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12ef:	48 8b 00             	mov    (%rax),%rax
    12f2:	48 83 c0 08          	add    $0x8,%rax
    12f6:	48 8b 10             	mov    (%rax),%rdx
    12f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12fd:	48 89 c7             	mov    %rax,%rdi
    1300:	ff d2                	callq  *%rdx
```
The first instruction is loading ```ptr3``` from stack into rax, making it point to both the begining of the object and its ```_vptr```, which also overlaps the pointer to its vtable. In the next three instructions ```ptr3``` is dereferenced again and added by size of one full pointer ```0x8``` so that rdx now points to element [1] in the vtable of ```Derived2```, i.e., ```Derived2::function2()```. The last instruction is calling the member function, while the two instructions before that set up its first argument, which is the default ```this``` pointer read from the stack and passed in rdi according to C calling convention. 

It can be seen that a call to a virtual function entails two additional loads and an indirect call to register, as illustrated on addresses 12ef,12f6,1300, 

# Optimized Machine Code
Using -O3 optimization the call to virtual functions can be further optimized to just computing the vtable address, loading it into a register (rax) and one indirect register call through the vtable. The indirect load and indirect call will strain our d/iCache a little bit while the indirect call may also result in miss prediction. They could also impact the pipeline frontend by stalling the prefetcher. It is not expected that these indirect loads result in page faults or TLB misses as the vtable is likely to be close alongside other member data.
```
    119e:	e8 5d ff ff ff       	callq  1100 <operator new(unsigned long)@plt>
    11a3:	4c 89 ef             	mov    %r13,%rdi
    11a6:	48 89 c5             	mov    %rax,%rbp            # rbp repurposed to point to Derived2
    11a9:	48 8d 05 68 2b 00 00 	lea    0x2b68(%rip),%rax    # move vtable adrs for Derived2 into rax
    11b0:	48 89 45 00          	mov    %rax,0x0(%rbp)       # init vtable, replaces the constructor
...
    11f4:	48 8b 45 00          	mov    0x0(%rbp),%rax       # load vtable adrs into rax
    11f8:	48 89 ef             	mov    %rbp,%rdi            # provide this pointer as first arg
    11fb:	ff 50 08             	callq  *0x8(%rax)           # indirect call through vtable
```
Furthermore, the compiler has optimized out the unnecessary constructor which was used to initialize the vtable and _vptr and replaced it with a simple ```lea``` and ```mov``` instructions, although the ```mov``` is an indirect store which may be Cache unfriendly. 

Lastly, note that even though we used -O3 optimization, non of the virtual member functions were inlined by the compiler as they only get resolved dynamically during runtime, fairly much similar to shared library calls. If one requires the compiler to inline virtual functions they they should be explicitly typecast at the time of function call, i.e., 
```
        ((Derived2*) ptr3)->function2();
```
In this case the compiler had implement something similar to a switch case where it would inline the virtual functions but would still maintain the flexibility to call to any one of them based on a vtable lookup, by implementing something like a jump table inside the main code. Even doing all of that, the code runtime was still not that different from when virtual functions weren't inlined.
# Comparing Performances

Implementing a 500M iteration loop, and using perf to look at cpu, cache, and branch performance of the two alternative implementations one with virtual functions, and one without we see an almost 10x performance improvement when virtual functions are not used:
```
# using virtual functions
$ sudo perf stat -e cycles:u,instructions:u,cache-references:u,cache-misses:u,bus-cycles:u,branches:u,branch-misses:u ./vtbl-loop
Base 375366209937011751
Derived1 375366209937011751
Derived2 250366210187011751

 Performance counter stats for './vtbl-loop':

    11,222,382,310      cycles:u                                                    
    32,002,282,068      instructions:u            #    2.85  insn per cycle         
            17,692      cache-references:u                                          
             8,353      cache-misses:u            #   47.213 % of all cache refs    
        95,327,296      bus-cycles:u                                                
     5,000,351,284      branches:u                                                  
            11,605      branch-misses:u           #    0.00% of all branches        

       2.484058798 seconds time elapsed

       2.480174000 seconds user
       0.004000000 seconds sys


# not using virtual functions (simple overriding)
$ sudo perf stat -e cycles:u,instructions:u,cache-references:u,cache-misses:u,bus-cycles:u,branches:u,branch-misses:u ./novirt-loop
Base 375366209937011751
Derived1 375366209937011751
Derived2 250366210187011751

 Performance counter stats for './novirt-loop':

     1,196,504,412      cycles:u                                                    
     4,627,281,159      instructions:u            #    3.87  insn per cycle         
            17,023      cache-references:u                                          
             7,568      cache-misses:u            #   44.457 % of all cache refs    
        10,279,929      bus-cycles:u                                                
       125,350,585      branches:u                                                  
            11,440      branch-misses:u           #    0.01% of all branches        

       0.268632733 seconds time elapsed

       0.268683000 seconds user
       0.000000000 seconds sys

```
The majority of the performance improvement is due to more efficient inlining when not having to drag along a vtable, which cut down instructions from 32B to 4.6B! Not only that but also we gain better instructions per cycle, from 2.85 up to 3.87 which is probably due to simpler instructions with less stalls and better prefetching when not requiring indirect loads and calls. The cache performance, is slightly better as also expected. It should be noted, however, that the gains we see here are exaggerated because our virtual functions do not perform much themselves, this is mostly not the case in real code. Hence, these findings should be taken with a grain of salt and only as best case improvements. Roughly speaking, when dividing the number of instructions by the 9 member function calls in each iteration of the loop and comparing virtual and non-virtual cases, one can see that each non-virtual member function call costs one instruction, whereas this is seven instructions for virtual function calls, roughly costing 2-3 cycles more.
