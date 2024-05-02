ENTRY(_start)

PHDRS
{
    text    PT_LOAD    FLAGS((1 << 0) | (1 << 2)) ; /* Execute + Read */
    rodata  PT_LOAD    FLAGS((1 << 2)) ;            /* Read only */
    data    PT_LOAD    FLAGS((1 << 1) | (1 << 2)) ; /* Write + Read */
    dynamic PT_DYNAMIC FLAGS((1 << 1) | (1 << 2)) ; /* Dynamic PHDR for relocations */
}

SECTIONS
{
    . = 0xe0000;

    .start : {
        *(.start .start.*)
    } :text
    .text : {
        *(.text .text.*)
    } :text
    .rodata : {
        *(.rodata .rodata.*)
    } :rodata
    .data : {
        *(.data .data.*)
    } :data
    .dynamic : {
        *(.dynamic)
    } :data :dynamic
    .bss : {
        *(.bss .bss.*)
        *(COMMON)
    } :data
    /DISCARD/ : {
        *(.eh_frame)
        *(.note .note.*)
    }
}
