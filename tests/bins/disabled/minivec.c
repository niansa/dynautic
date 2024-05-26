__attribute__((noinline))
void example1(int *a, int *b, int *c) {
  int i;

  for (i=0; i<256; i++){
    a[i] = b[i] + c[i];
  }
}


__attribute__((section(".start")))
unsigned long _start()
{
  int a[1024*2];
  int b[1024*2];
  int c[1024*2];

  example1(a, b, c);
  for (int i=0; i < ((1<<10)*10); ++i)
    example1(a, b, c);

  return 0;
}
