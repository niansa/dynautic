/// This test contains some of the loops from the GCC vectrorizer example page [1].
/// Dorit Nuzman who developed the gcc vectorizer said that we can use them in our test suite.
///
/// [1] - http://gcc.gnu.org/projects/tree-ssa/vectorization.html

#define SMALL_PROBLEM_SIZE
#define N 1024
#define M 32
#define K 4
#define ALIGNED16 __attribute__((aligned(16)))

struct A {
  int ca[N];
};

struct Buffers {
  unsigned short usa[N];
  short sa[N];
  short sb[N];
  short sc[N];
  unsigned int   ua[N];
  int   ia[N] ALIGNED16;
  int   ib[N] ALIGNED16;
  int   ic[N] ALIGNED16;
  unsigned int ub[N];
  unsigned int uc[N];
  // float fa[N], fb[N];
  // float da[N], db[N], dc[N], dd[N];
  int dj[N];

  struct A s;

  int a[N*2] ALIGNED16;
  int b[N*2] ALIGNED16;
  int c[N*2] ALIGNED16;
  int d[N*2] ALIGNED16;

  int G[M][N];
};

__attribute__((noinline))
void dump_regs(unsigned long a) {
  asm("svc #6");
}

__attribute__((noinline))
void example1 (struct Buffers *bfs) {
  int i;

  for (i=0; i<256; i++){
    bfs->a[i] = bfs->b[i] + bfs->c[i];
  }
}

__attribute__((noinline))
void example2a (struct Buffers *bfs, int n, int x) {
   int i;

   /* feature: support for unknown loop bound  */
   /* feature: support for loop invariants  */
   for (i=0; i<n; i++) {
      bfs->b[i] = x;
   }
}

__attribute__((noinline))
void example2b (struct Buffers *bfs, int n, int x) {
  int i = 0;
   /* feature: general loop exit condition  */
   /* feature: support for bitwise operations  */
   while (n--){
      bfs->a[i] = bfs->b[i]&bfs->c[i]; i++;
   }
}


typedef int aint __attribute__ ((__aligned__(16)));
__attribute__((noinline))
void example3 (struct Buffers *bfs, int n, aint * __restrict__ p, aint * __restrict q) {

   /* feature: support for (aligned) pointer accesses.  */
   while (n--){
      *p++ = *q++;
   }
}

__attribute__((noinline))
void example4a (struct Buffers *bfs, int n, aint * __restrict__ p, aint * __restrict__ q) {
   /* feature: support for (aligned) pointer accesses  */
   /* feature: support for constants  */
   while (n--){
      *p++ = *q++ + 5;
   }
}

__attribute__((noinline))
void example4b (struct Buffers *bfs, int n, aint * __restrict__ p, aint * __restrict__ q) {
   int i;

   /* feature: support for read accesses with a compile time known misalignment  */
   for (i=0; i<n; i++){
      bfs->a[i] = bfs->b[i+1] + bfs->c[i+3];
   }
}

__attribute__((noinline))
void example4c (struct Buffers *bfs, int n, aint * __restrict__ p, aint * __restrict__ q) {
   int i;
    const int MAX = 4;
   /* feature: support for if-conversion  */
   for (i=0; i<n; i++){
      int j = bfs->a[i];
      bfs->b[i] = (j > MAX ? MAX : 0);
   }
}

__attribute__((noinline))
void  example5 (struct Buffers *bfs, int n, struct A *s) {
  int i;
  for (i = 0; i < n; i++) {
    /* feature: support for alignable struct access  */
    bfs->s.ca[i] = 5;
  }
}

__attribute__((noinline))
void  example7 (struct Buffers *bfs, int x) {
   int i;

   /* feature: support for read accesses with an unknown misalignment  */
   for (i=0; i<N; i++){
      bfs->a[i] = bfs->b[i+x];
   }
}

__attribute__((noinline))
void example8 (struct Buffers *bfs, int x) {
   int i,j;

   /* feature: support for multidimensional arrays  */
   for (i=0; i<M; i++) {
     for (j=0; j<N; j++) {
       bfs->G[i][j] = x;
     }
   }
}


__attribute__((noinline))
void example9 (struct Buffers *bfs, unsigned *ret) {
  int i;

  /* feature: support summation reduction.
     note: in case of floats use -funsafe-math-optimizations  */
  unsigned int diff = 0;
  for (i = 0; i < N; i++) {
    diff += (bfs->ub[i] - bfs->uc[i]);
  }

  *ret = diff;
}


/* feature: support data-types of different sizes.
   Currently only a single vector-size per target is supported; 
   it can accommodate n elements such that n = vector-size/element-size 
   (e.g, 4 ints, 8 shorts, or 16 chars for a vector of size 16 bytes). 
   A combination of data-types of different sizes in the same loop 
   requires special handling. This support is now present in mainline,
   and also includes support for type conversions.  */
__attribute__((noinline))
void example10a(struct Buffers *bfs, short *__restrict__ sa, short *__restrict__ sb, short *__restrict__ sc, int* __restrict__ ia, int* __restrict__ ib, int* __restrict__ ic) {
  int i;
  for (i = 0; i < N; i++) {
    bfs->ia[i] = bfs->ib[i] + bfs->ic[i];
    bfs->sa[i] = bfs->sb[i] + bfs->sc[i];
  }
}

__attribute__((noinline))
void example10b(struct Buffers *bfs, short *__restrict__ sa, short *__restrict__ sb, short *__restrict__ sc, int* __restrict__ ia, int* __restrict__ ib, int* __restrict__ ic) {
  int i;
  for (i = 0; i < N; i++) {
    bfs->ia[i] = (int) bfs->sb[i];
  }
}

/* feature: support strided accesses - the data elements
   that are to be operated upon in parallel are not consecutive - they
   are accessed with a stride > 1 (in the example, the stride is 2):  */
__attribute__((noinline))
void example11(struct Buffers *bfs) {
   int i;
  for (i = 0; i < N/2; i++){
    bfs->a[i] = bfs->b[2*i+1] * bfs->c[2*i+1] - bfs->b[2*i] * bfs->c[2*i];
    bfs->d[i] = bfs->b[2*i] * bfs->c[2*i+1] + bfs->b[2*i+1] * bfs->c[2*i];
  }
}


__attribute__((noinline))
void example12(struct Buffers *bfs) {
  for (int i = 0; i < N; i++) {
    bfs->a[i] = i;
  }
}

__attribute__((noinline))
void example13(struct Buffers *bfs, int **A, int **B, int *out) {
  int i,j;
  for (i = 0; i < M; i++) {
    int diff = 0;
    for (j = 0; j < N; j+=8) {
      diff += (A[i][j] - B[i][j]);
    }
    out[i] = diff;
  }
}

__attribute__((noinline))
void example14(struct Buffers *bfs, int **in, int **coeff, int *out) {
  int k,j,i=0;
  for (k = 0; k < K; k++) {
    int sum = 0;
    for (j = 0; j < M; j++)
      for (i = 0; i < N; i++)
          sum += in[i+k][j] * coeff[i][j];

    out[k] = sum;
  }

}

__attribute__((noinline))
void example23 (struct Buffers *bfs, unsigned short *src, unsigned int *dst)
{
  int i;

  for (i = 0; i < 256; i++)
    *dst++ = *src++ << 7;
}


// __attribute__((noinline))
// void example24 (struct Buffers *bfs, short x, short y)
// {
//   int i;
//   for (i = 0; i < N; i++)
//     ic[i] = fa[i] < fb[i] ? x : y;
// }


// __attribute__((noinline))
// void example25 (struct Buffers *bfs, void)
// {
//   int i;
//   char x, y;
//   for (i = 0; i < N; i++)
//     {
//       x = (da[i] < db[i]);
//       y = (dc[i] < dd[i]);
//       dj[i] = x & y;
//     }
// }

void init_memory(void *start, void* end) {
  unsigned char state = 1;
  while (start != end) {
    state *= 7; state ^= 0x27; state += 1;
    *((unsigned char*)start) = state;
    start = ((char*)start) + 1;
  }
}

// void init_memory_float(float *start, float* end) {
//   float state = 1.0;
//   while (start != end) {
//     state *= 1.1;
//     *start = state;
//     start++;
//   }
// }

unsigned digest_memory(void *start, void* end) {
  unsigned state = 1;
  while (start != end) {
    state *= 3;
    state ^= *((unsigned char*)start);
    state = (state >> 8  ^ state << 8);
    start = ((char*)start) + 1;
  }
  return state;
}


#define BENCH(NAME, RUN_LINE, ITER, DIGEST_LINE) {\
  RUN_LINE;\
  for (int i=0; i < (ITER); ++i) RUN_LINE;\
  fres += DIGEST_LINE;\
 }


__attribute__((section(".start")))
unsigned long _start()
{
  unsigned fres = 0;

  struct Buffers bfs;

  unsigned dummy = 0;
#ifdef SMALL_PROBLEM_SIZE
  const int Mi = 1<<10;
#else
  const int Mi = 1<<18;
#endif
  init_memory(&bfs.ia[0], &bfs.ia[N]);
  init_memory(&bfs.ib[0], &bfs.ib[N]);
  init_memory(&bfs.ic[0], &bfs.ic[N]);
  init_memory(&bfs.sa[0], &bfs.sa[N]);
  init_memory(&bfs.sb[0], &bfs.sb[N]);
  init_memory(&bfs.sc[0], &bfs.sc[N]);
  init_memory(&bfs.a[0], &bfs.a[N*2]);
  init_memory(&bfs.b[0], &bfs.b[N*2]);
  init_memory(&bfs.c[0], &bfs.c[N*2]);
  init_memory(&bfs.ua[0], &bfs.ua[N]);
  init_memory(&bfs.ub[0], &bfs.ub[N]);
  init_memory(&bfs.uc[0], &bfs.uc[N]);
  init_memory(&bfs.G[0][0], &bfs.G[0][N]);
  // init_memory_float(&bfs.fa[0], &bfs.fa[N]);
  // init_memory_float(&bfs.fb[0], &bfs.fb[N]);
  // init_memory_float(&bfs.da[0], &bfs.da[N]);
  // init_memory_float(&bfs.db[0], &bfs.db[N]);
  // init_memory_float(&bfs.dc[0], &bfs.dc[N]);
  // init_memory_float(&bfs.dd[0], &bfs.dd[N]);

  BENCH("Example1",   example1(&bfs), Mi*10, digest_memory(&bfs.a[0], &bfs.a[256]));
  BENCH("Example2a",  example2a(&bfs, N, 2), Mi*4, digest_memory(&bfs.b[0], &bfs.b[N]));
  BENCH("Example2b",  example2b(&bfs, N, 2), Mi*2, digest_memory(&bfs.a[0], &bfs.a[N]));
  BENCH("Example3",   example3(&bfs, N, bfs.ia, bfs.ib), Mi*2, digest_memory(&bfs.ia[0], &bfs.ia[N]));
  BENCH("Example4a",  example4a(&bfs, N, bfs.ia, bfs.ib), Mi*2, digest_memory(&bfs.ia[0], &bfs.ia[N]));
  BENCH("Example4b",  example4b(&bfs, N-10, bfs.ia, bfs.ib), Mi*2, digest_memory(&bfs.ia[0], &bfs.ia[N]));
  BENCH("Example4c",  example4c(&bfs, N, bfs.ia, bfs.ib), Mi*2, digest_memory(&bfs.ib[0], &bfs.ib[N]));
  BENCH("Example7",   example7(&bfs, 4), Mi*4, digest_memory(&bfs.a[0], &bfs.a[N]));
  BENCH("Example8",   example8(&bfs, 8), Mi/4, digest_memory(&bfs.G[0][0], &bfs.G[0][N]));
  BENCH("Example9",   example9(&bfs, &dummy), Mi*2, dummy);
  BENCH("Example10a", example10a(&bfs, bfs.sa,bfs.sb,bfs.sc,bfs.ia,bfs.ib,bfs.ic), Mi*2, digest_memory(&bfs.ia[0], &bfs.ia[N]) + digest_memory(&bfs.sa[0], &bfs.sa[N]));
  BENCH("Example10b", example10b(&bfs, bfs.sa,bfs.sb,bfs.sc,bfs.ia,bfs.ib,bfs.ic), Mi*4, digest_memory(&bfs.ia[0], &bfs.ia[N]));
  BENCH("Example11",  example11(&bfs), Mi*2, digest_memory(&bfs.d[0], &bfs.d[N]));
  // BENCH("Example12",  example12(&bfs), Mi*4, digest_memory(&bfs.a[0], &bfs.a[N]));   !!! UNKNOWN INSTRUCTION !!!
  BENCH("Example23",  example23(&bfs, bfs.usa,bfs.ua), Mi*8, digest_memory(&bfs.usa[0], &bfs.usa[256]));
  //BENCH("Example24",  example24(&bfs, 2,4), Mi*2, 0);
  //BENCH("Example25",  example25(&bfs), Mi*2, digest_memory(&bfs.dj[0], &bfs.dj[N]));

  return fres;
}
