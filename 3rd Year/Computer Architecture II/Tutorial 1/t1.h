//
// NB: "extern C" to avoid procedure name mangling by compiler
//

extern "C" int bias;
extern "C" int _cdecl poly(int);   // _cdecl calling convention
extern "C" int _cdecl factorial(int);   // _cdecl calling convention
extern "C" int _cdecl multiple_k_asm(int, int, uint16_t array[]);

// eof
