#include <stdint.h>

#define VGA_WIDTH 80
#define VGA_HEIGHT 25
#define VGA_MEMORY ((uint16_t*)0xB8000)

int cursor = 0;

void clear_screen() {
    for (int i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++) {
        VGA_MEMORY[i] = (0x0F << 8) | ' ';
    }
}

void print(const char* str) {
    while (*str) {
        VGA_MEMORY[cursor++] = (0x0F << 8) | *str++;
    }
}


__attribute__((section(".multiboot")))
const unsigned long multiboot_header[] = {
    0x1BADB002,
    0x00,
    -(0x1BADB002)
};


void kernel_main() {
    clear_screen();
    print("PulseOs booted.");
    while (1);
}