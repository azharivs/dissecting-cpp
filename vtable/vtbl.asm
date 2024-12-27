
./vtbl:     file format elf64-x86-64

Contents of section .data.rel.ro:
 3cc8 00000000 00000000 403d0000 00000000  ........@=......
 3cd8 82140000 00000000 be140000 00000000  ................
 3ce8 46140000 00000000 00000000 00000000  F...............
 3cf8 583d0000 00000000 82140000 00000000  X=..............
 3d08 0a140000 00000000 46140000 00000000  ........F.......
 3d18 00000000 00000000 703d0000 00000000  ........p=......
 3d28 ce130000 00000000 0a140000 00000000  ................
 3d38 46140000 00000000 00000000 00000000  F...............
 3d48 68200000 00000000 583d0000 00000000  h ......X=......
 3d58 00000000 00000000 78200000 00000000  ........x ......
 3d68 703d0000 00000000 00000000 00000000  p=..............
 3d78 82200000 00000000                    . ......        
Contents of section .dynamic:
 3d80 01000000 00000000 01000000 00000000  ................
 3d90 01000000 00000000 70010000 00000000  ........p.......
 3da0 0c000000 00000000 00100000 00000000  ................
 3db0 0d000000 00000000 f8150000 00000000  ................
 3dc0 19000000 00000000 b03c0000 00000000  .........<......
 3dd0 1b000000 00000000 10000000 00000000  ................
 3de0 1a000000 00000000 c03c0000 00000000  .........<......
 3df0 1c000000 00000000 08000000 00000000  ................
 3e00 f5feff6f 00000000 a0030000 00000000  ...o............
 3e10 05000000 00000000 60050000 00000000  ........`.......
 3e20 06000000 00000000 c8030000 00000000  ................
 3e30 0a000000 00000000 d8010000 00000000  ................
 3e40 0b000000 00000000 18000000 00000000  ................
 3e50 15000000 00000000 00000000 00000000  ................
 3e60 03000000 00000000 803f0000 00000000  .........?......
 3e70 02000000 00000000 90000000 00000000  ................
 3e80 14000000 00000000 07000000 00000000  ................
 3e90 17000000 00000000 c00a0000 00000000  ................
 3ea0 07000000 00000000 c0070000 00000000  ................
 3eb0 08000000 00000000 00030000 00000000  ................
 3ec0 09000000 00000000 18000000 00000000  ................
 3ed0 1e000000 00000000 08000000 00000000  ................
 3ee0 fbffff6f 00000000 01000008 00000000  ...o............
 3ef0 feffff6f 00000000 60070000 00000000  ...o....`.......
 3f00 ffffff6f 00000000 02000000 00000000  ...o............
 3f10 f0ffff6f 00000000 38070000 00000000  ...o....8.......
 3f20 f9ffff6f 00000000 15000000 00000000  ...o............
 3f30 00000000 00000000 00000000 00000000  ................
 3f40 00000000 00000000 00000000 00000000  ................
 3f50 00000000 00000000 00000000 00000000  ................
 3f60 00000000 00000000 00000000 00000000  ................
 3f70 00000000 00000000 00000000 00000000  ................
Contents of section .got:
 3f80 803d0000 00000000 00000000 00000000  .=..............
 3f90 00000000 00000000 30100000 00000000  ........0.......
 3fa0 40100000 00000000 50100000 00000000  @.......P.......
 3fb0 60100000 00000000 70100000 00000000  `.......p.......
 3fc0 80100000 00000000 00000000 00000000  ................
 3fd0 00000000 00000000 00000000 00000000  ................
 3fe0 00000000 00000000 00000000 00000000  ................
 3ff0 00000000 00000000 00000000 00000000  ................
Contents of section .data:
 4000 00000000 00000000 08400000 00000000  .........@......

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 62 2f 00 00    	pushq  0x2f62(%rip)        # 3f88 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 63 2f 00 00 	bnd jmpq *0x2f63(%rip)        # 3f90 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop

Disassembly of section .plt.got:

0000000000001090 <__cxa_finalize@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 2d 2f 00 00 	bnd jmpq *0x2f2d(%rip)        # 3fc8 <__cxa_finalize@GLIBC_2.2.5>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010a0 <__cxa_atexit@plt>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	f2 ff 25 ed 2e 00 00 	bnd jmpq *0x2eed(%rip)        # 3f98 <__cxa_atexit@GLIBC_2.2.5>
    10ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010b0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	f2 ff 25 e5 2e 00 00 	bnd jmpq *0x2ee5(%rip)        # 3fa0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@GLIBCXX_3.4>
    10bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010c0 <operator new(unsigned long)@plt>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	f2 ff 25 dd 2e 00 00 	bnd jmpq *0x2edd(%rip)        # 3fa8 <operator new(unsigned long)@GLIBCXX_3.4>
    10cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010d0 <operator delete(void*, unsigned long)@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 d5 2e 00 00 	bnd jmpq *0x2ed5(%rip)        # 3fb0 <operator delete(void*, unsigned long)@CXXABI_1.3.9>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010e0 <std::ostream::operator<<(std::ostream& (*)(std::ostream&))@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 cd 2e 00 00 	bnd jmpq *0x2ecd(%rip)        # 3fb8 <std::ostream::operator<<(std::ostream& (*)(std::ostream&))@GLIBCXX_3.4>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010f0 <std::ios_base::Init::Init()@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 c5 2e 00 00 	bnd jmpq *0x2ec5(%rip)        # 3fc0 <std::ios_base::Init::Init()@GLIBCXX_3.4>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001100 <_start>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	31 ed                	xor    %ebp,%ebp
    1106:	49 89 d1             	mov    %rdx,%r9
    1109:	5e                   	pop    %rsi
    110a:	48 89 e2             	mov    %rsp,%rdx
    110d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1111:	50                   	push   %rax
    1112:	54                   	push   %rsp
    1113:	4c 8d 05 d6 04 00 00 	lea    0x4d6(%rip),%r8        # 15f0 <__libc_csu_fini>
    111a:	48 8d 0d 5f 04 00 00 	lea    0x45f(%rip),%rcx        # 1580 <__libc_csu_init>
    1121:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 11e9 <main>
    1128:	ff 15 b2 2e 00 00    	callq  *0x2eb2(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    112e:	f4                   	hlt    
    112f:	90                   	nop

0000000000001130 <deregister_tm_clones>:
    1130:	48 8d 3d d9 2e 00 00 	lea    0x2ed9(%rip),%rdi        # 4010 <__TMC_END__>
    1137:	48 8d 05 d2 2e 00 00 	lea    0x2ed2(%rip),%rax        # 4010 <__TMC_END__>
    113e:	48 39 f8             	cmp    %rdi,%rax
    1141:	74 15                	je     1158 <deregister_tm_clones+0x28>
    1143:	48 8b 05 8e 2e 00 00 	mov    0x2e8e(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    114a:	48 85 c0             	test   %rax,%rax
    114d:	74 09                	je     1158 <deregister_tm_clones+0x28>
    114f:	ff e0                	jmpq   *%rax
    1151:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1158:	c3                   	retq   
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <register_tm_clones>:
    1160:	48 8d 3d a9 2e 00 00 	lea    0x2ea9(%rip),%rdi        # 4010 <__TMC_END__>
    1167:	48 8d 35 a2 2e 00 00 	lea    0x2ea2(%rip),%rsi        # 4010 <__TMC_END__>
    116e:	48 29 fe             	sub    %rdi,%rsi
    1171:	48 89 f0             	mov    %rsi,%rax
    1174:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1178:	48 c1 f8 03          	sar    $0x3,%rax
    117c:	48 01 c6             	add    %rax,%rsi
    117f:	48 d1 fe             	sar    %rsi
    1182:	74 14                	je     1198 <register_tm_clones+0x38>
    1184:	48 8b 05 65 2e 00 00 	mov    0x2e65(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    118b:	48 85 c0             	test   %rax,%rax
    118e:	74 08                	je     1198 <register_tm_clones+0x38>
    1190:	ff e0                	jmpq   *%rax
    1192:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1198:	c3                   	retq   
    1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011a0 <__do_global_dtors_aux>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	80 3d a5 2f 00 00 00 	cmpb   $0x0,0x2fa5(%rip)        # 4150 <completed.8061>
    11ab:	75 2b                	jne    11d8 <__do_global_dtors_aux+0x38>
    11ad:	55                   	push   %rbp
    11ae:	48 83 3d 12 2e 00 00 	cmpq   $0x0,0x2e12(%rip)        # 3fc8 <__cxa_finalize@GLIBC_2.2.5>
    11b5:	00 
    11b6:	48 89 e5             	mov    %rsp,%rbp
    11b9:	74 0c                	je     11c7 <__do_global_dtors_aux+0x27>
    11bb:	48 8b 3d 46 2e 00 00 	mov    0x2e46(%rip),%rdi        # 4008 <__dso_handle>
    11c2:	e8 c9 fe ff ff       	callq  1090 <__cxa_finalize@plt>
    11c7:	e8 64 ff ff ff       	callq  1130 <deregister_tm_clones>
    11cc:	c6 05 7d 2f 00 00 01 	movb   $0x1,0x2f7d(%rip)        # 4150 <completed.8061>
    11d3:	5d                   	pop    %rbp
    11d4:	c3                   	retq   
    11d5:	0f 1f 00             	nopl   (%rax)
    11d8:	c3                   	retq   
    11d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011e0 <frame_dummy>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	e9 77 ff ff ff       	jmpq   1160 <register_tm_clones>

00000000000011e9 <main>:
    // not overriding function1() and function3()
};

// driver code
int main()
{
    11e9:	f3 0f 1e fa          	endbr64 
    11ed:	55                   	push   %rbp
    11ee:	48 89 e5             	mov    %rsp,%rbp
    11f1:	53                   	push   %rbx
    11f2:	48 83 ec 28          	sub    $0x28,%rsp
    // defining base class pointers
    Base* ptr1 = new Base();
    11f6:	bf 08 00 00 00       	mov    $0x8,%edi
    11fb:	e8 c0 fe ff ff       	callq  10c0 <operator new(unsigned long)@plt>
    1200:	48 89 c3             	mov    %rax,%rbx
    1203:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    120a:	48 89 df             	mov    %rbx,%rdi
    120d:	e8 e8 02 00 00       	callq  14fa <Base::Base()>
    1212:	48 89 5d d8          	mov    %rbx,-0x28(%rbp)
    Base* ptr2 = new Derived1();
    1216:	bf 08 00 00 00       	mov    $0x8,%edi
    121b:	e8 a0 fe ff ff       	callq  10c0 <operator new(unsigned long)@plt>
    1220:	48 89 c3             	mov    %rax,%rbx
    1223:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    122a:	48 89 df             	mov    %rbx,%rdi
    122d:	e8 e6 02 00 00       	callq  1518 <Derived1::Derived1()>
    1232:	48 89 5d e0          	mov    %rbx,-0x20(%rbp)
    Base* ptr3 = new Derived2();
    1236:	bf 08 00 00 00       	mov    $0x8,%edi
    123b:	e8 80 fe ff ff       	callq  10c0 <operator new(unsigned long)@plt>
    1240:	48 89 c3             	mov    %rax,%rbx
    1243:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    124a:	48 89 df             	mov    %rbx,%rdi
    124d:	e8 f4 02 00 00       	callq  1546 <Derived2::Derived2()>
    1252:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)

    // calling all functions
    ptr1->function1();
    1256:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    125a:	48 8b 00             	mov    (%rax),%rax
    125d:	48 8b 10             	mov    (%rax),%rdx
    1260:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1264:	48 89 c7             	mov    %rax,%rdi
    1267:	ff d2                	callq  *%rdx
    ptr1->function2();
    1269:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    126d:	48 8b 00             	mov    (%rax),%rax
    1270:	48 83 c0 08          	add    $0x8,%rax
    1274:	48 8b 10             	mov    (%rax),%rdx
    1277:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    127b:	48 89 c7             	mov    %rax,%rdi
    127e:	ff d2                	callq  *%rdx
    ptr1->function3();
    1280:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1284:	48 8b 00             	mov    (%rax),%rax
    1287:	48 83 c0 10          	add    $0x10,%rax
    128b:	48 8b 10             	mov    (%rax),%rdx
    128e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1292:	48 89 c7             	mov    %rax,%rdi
    1295:	ff d2                	callq  *%rdx
    ptr2->function1();
    1297:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    129b:	48 8b 00             	mov    (%rax),%rax
    129e:	48 8b 10             	mov    (%rax),%rdx
    12a1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12a5:	48 89 c7             	mov    %rax,%rdi
    12a8:	ff d2                	callq  *%rdx
    ptr2->function2();
    12aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12ae:	48 8b 00             	mov    (%rax),%rax
    12b1:	48 83 c0 08          	add    $0x8,%rax
    12b5:	48 8b 10             	mov    (%rax),%rdx
    12b8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12bc:	48 89 c7             	mov    %rax,%rdi
    12bf:	ff d2                	callq  *%rdx
    ptr2->function3();
    12c1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12c5:	48 8b 00             	mov    (%rax),%rax
    12c8:	48 83 c0 10          	add    $0x10,%rax
    12cc:	48 8b 10             	mov    (%rax),%rdx
    12cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    12d3:	48 89 c7             	mov    %rax,%rdi
    12d6:	ff d2                	callq  *%rdx
    ptr3->function1();
    12d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12dc:	48 8b 00             	mov    (%rax),%rax
    12df:	48 8b 10             	mov    (%rax),%rdx
    12e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12e6:	48 89 c7             	mov    %rax,%rdi
    12e9:	ff d2                	callq  *%rdx
    ptr3->function2();
    12eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12ef:	48 8b 00             	mov    (%rax),%rax
    12f2:	48 83 c0 08          	add    $0x8,%rax
    12f6:	48 8b 10             	mov    (%rax),%rdx
    12f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12fd:	48 89 c7             	mov    %rax,%rdi
    1300:	ff d2                	callq  *%rdx
    ptr3->function3();
    1302:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1306:	48 8b 00             	mov    (%rax),%rax
    1309:	48 83 c0 10          	add    $0x10,%rax
    130d:	48 8b 10             	mov    (%rax),%rdx
    1310:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1314:	48 89 c7             	mov    %rax,%rdi
    1317:	ff d2                	callq  *%rdx

    // deleting objects
    delete ptr1;
    1319:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    131d:	48 85 c0             	test   %rax,%rax
    1320:	74 0d                	je     132f <main+0x146>
    1322:	be 08 00 00 00       	mov    $0x8,%esi
    1327:	48 89 c7             	mov    %rax,%rdi
    132a:	e8 a1 fd ff ff       	callq  10d0 <operator delete(void*, unsigned long)@plt>
    delete ptr2;
    132f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1333:	48 85 c0             	test   %rax,%rax
    1336:	74 0d                	je     1345 <main+0x15c>
    1338:	be 08 00 00 00       	mov    $0x8,%esi
    133d:	48 89 c7             	mov    %rax,%rdi
    1340:	e8 8b fd ff ff       	callq  10d0 <operator delete(void*, unsigned long)@plt>
    delete ptr3;
    1345:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1349:	48 85 c0             	test   %rax,%rax
    134c:	74 0d                	je     135b <main+0x172>
    134e:	be 08 00 00 00       	mov    $0x8,%esi
    1353:	48 89 c7             	mov    %rax,%rdi
    1356:	e8 75 fd ff ff       	callq  10d0 <operator delete(void*, unsigned long)@plt>

    return 0;
    135b:	b8 00 00 00 00       	mov    $0x0,%eax
    1360:	48 83 c4 28          	add    $0x28,%rsp
    1364:	5b                   	pop    %rbx
    1365:	5d                   	pop    %rbp
    1366:	c3                   	retq   

0000000000001367 <__static_initialization_and_destruction_0(int, int)>:
    1367:	f3 0f 1e fa          	endbr64 
    136b:	55                   	push   %rbp
    136c:	48 89 e5             	mov    %rsp,%rbp
    136f:	48 83 ec 10          	sub    $0x10,%rsp
    1373:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1376:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1379:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    137d:	75 32                	jne    13b1 <__static_initialization_and_destruction_0(int, int)+0x4a>
    137f:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
    1386:	75 29                	jne    13b1 <__static_initialization_and_destruction_0(int, int)+0x4a>
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  ///@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
    1388:	48 8d 3d c2 2d 00 00 	lea    0x2dc2(%rip),%rdi        # 4151 <std::__ioinit>
    138f:	e8 5c fd ff ff       	callq  10f0 <std::ios_base::Init::Init()@plt>
    1394:	48 8d 15 6d 2c 00 00 	lea    0x2c6d(%rip),%rdx        # 4008 <__dso_handle>
    139b:	48 8d 35 af 2d 00 00 	lea    0x2daf(%rip),%rsi        # 4151 <std::__ioinit>
    13a2:	48 8b 05 4f 2c 00 00 	mov    0x2c4f(%rip),%rax        # 3ff8 <std::ios_base::Init::~Init()@GLIBCXX_3.4>
    13a9:	48 89 c7             	mov    %rax,%rdi
    13ac:	e8 ef fc ff ff       	callq  10a0 <__cxa_atexit@plt>
    13b1:	90                   	nop
    13b2:	c9                   	leaveq 
    13b3:	c3                   	retq   

00000000000013b4 <_GLOBAL__sub_I_main>:
    13b4:	f3 0f 1e fa          	endbr64 
    13b8:	55                   	push   %rbp
    13b9:	48 89 e5             	mov    %rsp,%rbp
    13bc:	be ff ff 00 00       	mov    $0xffff,%esi
    13c1:	bf 01 00 00 00       	mov    $0x1,%edi
    13c6:	e8 9c ff ff ff       	callq  1367 <__static_initialization_and_destruction_0(int, int)>
    13cb:	5d                   	pop    %rbp
    13cc:	c3                   	retq   
    13cd:	90                   	nop

00000000000013ce <Base::function1()>:
    virtual void function1()
    13ce:	f3 0f 1e fa          	endbr64 
    13d2:	55                   	push   %rbp
    13d3:	48 89 e5             	mov    %rsp,%rbp
    13d6:	48 83 ec 10          	sub    $0x10,%rsp
    13da:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
        cout << "Base function1()" << endl;
    13de:	48 8d 35 20 0c 00 00 	lea    0xc20(%rip),%rsi        # 2005 <std::piecewise_construct+0x1>
    13e5:	48 8d 3d 54 2c 00 00 	lea    0x2c54(%rip),%rdi        # 4040 <std::cout@@GLIBCXX_3.4>
    13ec:	e8 bf fc ff ff       	callq  10b0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    13f1:	48 89 c2             	mov    %rax,%rdx
    13f4:	48 8b 05 d5 2b 00 00 	mov    0x2bd5(%rip),%rax        # 3fd0 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    13fb:	48 89 c6             	mov    %rax,%rsi
    13fe:	48 89 d7             	mov    %rdx,%rdi
    1401:	e8 da fc ff ff       	callq  10e0 <std::ostream::operator<<(std::ostream& (*)(std::ostream&))@plt>
    }
    1406:	90                   	nop
    1407:	c9                   	leaveq 
    1408:	c3                   	retq   
    1409:	90                   	nop

000000000000140a <Base::function2()>:
    virtual void function2()
    140a:	f3 0f 1e fa          	endbr64 
    140e:	55                   	push   %rbp
    140f:	48 89 e5             	mov    %rsp,%rbp
    1412:	48 83 ec 10          	sub    $0x10,%rsp
    1416:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
        cout << "Base function2()" << endl;
    141a:	48 8d 35 f5 0b 00 00 	lea    0xbf5(%rip),%rsi        # 2016 <std::piecewise_construct+0x12>
    1421:	48 8d 3d 18 2c 00 00 	lea    0x2c18(%rip),%rdi        # 4040 <std::cout@@GLIBCXX_3.4>
    1428:	e8 83 fc ff ff       	callq  10b0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    142d:	48 89 c2             	mov    %rax,%rdx
    1430:	48 8b 05 99 2b 00 00 	mov    0x2b99(%rip),%rax        # 3fd0 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    1437:	48 89 c6             	mov    %rax,%rsi
    143a:	48 89 d7             	mov    %rdx,%rdi
    143d:	e8 9e fc ff ff       	callq  10e0 <std::ostream::operator<<(std::ostream& (*)(std::ostream&))@plt>
    }
    1442:	90                   	nop
    1443:	c9                   	leaveq 
    1444:	c3                   	retq   
    1445:	90                   	nop

0000000000001446 <Base::function3()>:
    virtual void function3()
    1446:	f3 0f 1e fa          	endbr64 
    144a:	55                   	push   %rbp
    144b:	48 89 e5             	mov    %rsp,%rbp
    144e:	48 83 ec 10          	sub    $0x10,%rsp
    1452:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
        cout << "Base function3()" << endl;
    1456:	48 8d 35 ca 0b 00 00 	lea    0xbca(%rip),%rsi        # 2027 <std::piecewise_construct+0x23>
    145d:	48 8d 3d dc 2b 00 00 	lea    0x2bdc(%rip),%rdi        # 4040 <std::cout@@GLIBCXX_3.4>
    1464:	e8 47 fc ff ff       	callq  10b0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    1469:	48 89 c2             	mov    %rax,%rdx
    146c:	48 8b 05 5d 2b 00 00 	mov    0x2b5d(%rip),%rax        # 3fd0 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    1473:	48 89 c6             	mov    %rax,%rsi
    1476:	48 89 d7             	mov    %rdx,%rdi
    1479:	e8 62 fc ff ff       	callq  10e0 <std::ostream::operator<<(std::ostream& (*)(std::ostream&))@plt>
    }
    147e:	90                   	nop
    147f:	c9                   	leaveq 
    1480:	c3                   	retq   
    1481:	90                   	nop

0000000000001482 <Derived1::function1()>:
    void function1()
    1482:	f3 0f 1e fa          	endbr64 
    1486:	55                   	push   %rbp
    1487:	48 89 e5             	mov    %rsp,%rbp
    148a:	48 83 ec 10          	sub    $0x10,%rsp
    148e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
        cout << "Derived1 function1()" << endl;
    1492:	48 8d 35 9f 0b 00 00 	lea    0xb9f(%rip),%rsi        # 2038 <std::piecewise_construct+0x34>
    1499:	48 8d 3d a0 2b 00 00 	lea    0x2ba0(%rip),%rdi        # 4040 <std::cout@@GLIBCXX_3.4>
    14a0:	e8 0b fc ff ff       	callq  10b0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    14a5:	48 89 c2             	mov    %rax,%rdx
    14a8:	48 8b 05 21 2b 00 00 	mov    0x2b21(%rip),%rax        # 3fd0 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    14af:	48 89 c6             	mov    %rax,%rsi
    14b2:	48 89 d7             	mov    %rdx,%rdi
    14b5:	e8 26 fc ff ff       	callq  10e0 <std::ostream::operator<<(std::ostream& (*)(std::ostream&))@plt>
    }
    14ba:	90                   	nop
    14bb:	c9                   	leaveq 
    14bc:	c3                   	retq   
    14bd:	90                   	nop

00000000000014be <Derived2::function2()>:
    void function2()
    14be:	f3 0f 1e fa          	endbr64 
    14c2:	55                   	push   %rbp
    14c3:	48 89 e5             	mov    %rsp,%rbp
    14c6:	48 83 ec 10          	sub    $0x10,%rsp
    14ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
        cout << "Derived2 function2()" << endl;
    14ce:	48 8d 35 78 0b 00 00 	lea    0xb78(%rip),%rsi        # 204d <std::piecewise_construct+0x49>
    14d5:	48 8d 3d 64 2b 00 00 	lea    0x2b64(%rip),%rdi        # 4040 <std::cout@@GLIBCXX_3.4>
    14dc:	e8 cf fb ff ff       	callq  10b0 <std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)@plt>
    14e1:	48 89 c2             	mov    %rax,%rdx
    14e4:	48 8b 05 e5 2a 00 00 	mov    0x2ae5(%rip),%rax        # 3fd0 <std::basic_ostream<char, std::char_traits<char> >& std::endl<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&)@GLIBCXX_3.4>
    14eb:	48 89 c6             	mov    %rax,%rsi
    14ee:	48 89 d7             	mov    %rdx,%rdi
    14f1:	e8 ea fb ff ff       	callq  10e0 <std::ostream::operator<<(std::ostream& (*)(std::ostream&))@plt>
    }
    14f6:	90                   	nop
    14f7:	c9                   	leaveq 
    14f8:	c3                   	retq   
    14f9:	90                   	nop

00000000000014fa <Base::Base()>:
class Base {
    14fa:	f3 0f 1e fa          	endbr64 
    14fe:	55                   	push   %rbp
    14ff:	48 89 e5             	mov    %rsp,%rbp
    1502:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1506:	48 8d 15 1b 28 00 00 	lea    0x281b(%rip),%rdx        # 3d28 <vtable for Base+0x10>
    150d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1511:	48 89 10             	mov    %rdx,(%rax)
    1514:	90                   	nop
    1515:	5d                   	pop    %rbp
    1516:	c3                   	retq   
    1517:	90                   	nop

0000000000001518 <Derived1::Derived1()>:
class Derived1 : public Base {
    1518:	f3 0f 1e fa          	endbr64 
    151c:	55                   	push   %rbp
    151d:	48 89 e5             	mov    %rsp,%rbp
    1520:	48 83 ec 10          	sub    $0x10,%rsp
    1524:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1528:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    152c:	48 89 c7             	mov    %rax,%rdi
    152f:	e8 c6 ff ff ff       	callq  14fa <Base::Base()>
    1534:	48 8d 15 c5 27 00 00 	lea    0x27c5(%rip),%rdx        # 3d00 <vtable for Derived1+0x10>
    153b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    153f:	48 89 10             	mov    %rdx,(%rax)
    1542:	90                   	nop
    1543:	c9                   	leaveq 
    1544:	c3                   	retq   
    1545:	90                   	nop

0000000000001546 <Derived2::Derived2()>:
class Derived2 : public Derived1 {
    1546:	f3 0f 1e fa          	endbr64 
    154a:	55                   	push   %rbp
    154b:	48 89 e5             	mov    %rsp,%rbp
    154e:	48 83 ec 10          	sub    $0x10,%rsp
    1552:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1556:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    155a:	48 89 c7             	mov    %rax,%rdi
    155d:	e8 b6 ff ff ff       	callq  1518 <Derived1::Derived1()>
    1562:	48 8d 15 6f 27 00 00 	lea    0x276f(%rip),%rdx        # 3cd8 <vtable for Derived2+0x10>
    1569:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    156d:	48 89 10             	mov    %rdx,(%rax)
    1570:	90                   	nop
    1571:	c9                   	leaveq 
    1572:	c3                   	retq   
    1573:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    157a:	00 00 00 
    157d:	0f 1f 00             	nopl   (%rax)

0000000000001580 <__libc_csu_init>:
    1580:	f3 0f 1e fa          	endbr64 
    1584:	41 57                	push   %r15
    1586:	4c 8d 3d 23 27 00 00 	lea    0x2723(%rip),%r15        # 3cb0 <__frame_dummy_init_array_entry>
    158d:	41 56                	push   %r14
    158f:	49 89 d6             	mov    %rdx,%r14
    1592:	41 55                	push   %r13
    1594:	49 89 f5             	mov    %rsi,%r13
    1597:	41 54                	push   %r12
    1599:	41 89 fc             	mov    %edi,%r12d
    159c:	55                   	push   %rbp
    159d:	48 8d 2d 1c 27 00 00 	lea    0x271c(%rip),%rbp        # 3cc0 <__do_global_dtors_aux_fini_array_entry>
    15a4:	53                   	push   %rbx
    15a5:	4c 29 fd             	sub    %r15,%rbp
    15a8:	48 83 ec 08          	sub    $0x8,%rsp
    15ac:	e8 4f fa ff ff       	callq  1000 <_init>
    15b1:	48 c1 fd 03          	sar    $0x3,%rbp
    15b5:	74 1f                	je     15d6 <__libc_csu_init+0x56>
    15b7:	31 db                	xor    %ebx,%ebx
    15b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    15c0:	4c 89 f2             	mov    %r14,%rdx
    15c3:	4c 89 ee             	mov    %r13,%rsi
    15c6:	44 89 e7             	mov    %r12d,%edi
    15c9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    15cd:	48 83 c3 01          	add    $0x1,%rbx
    15d1:	48 39 dd             	cmp    %rbx,%rbp
    15d4:	75 ea                	jne    15c0 <__libc_csu_init+0x40>
    15d6:	48 83 c4 08          	add    $0x8,%rsp
    15da:	5b                   	pop    %rbx
    15db:	5d                   	pop    %rbp
    15dc:	41 5c                	pop    %r12
    15de:	41 5d                	pop    %r13
    15e0:	41 5e                	pop    %r14
    15e2:	41 5f                	pop    %r15
    15e4:	c3                   	retq   
    15e5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    15ec:	00 00 00 00 

00000000000015f0 <__libc_csu_fini>:
    15f0:	f3 0f 1e fa          	endbr64 
    15f4:	c3                   	retq   

Disassembly of section .fini:

00000000000015f8 <_fini>:
    15f8:	f3 0f 1e fa          	endbr64 
    15fc:	48 83 ec 08          	sub    $0x8,%rsp
    1600:	48 83 c4 08          	add    $0x8,%rsp
    1604:	c3                   	retq   
