VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 29
EXTRAVERSION = -00054-g5f01537

obj-m += lkmprotect.o

# Cambiar al directorio del fuente del kernel
KDIR = PATH_TO_KERNEL
# Cambiar al directorio de las herramientas para hacer cross compiling
CROSS_COMPILE= CROSS_COMPILING_TOOLS
PWD := $(shell pwd)

all:
	make -C $(KDIR) ARCH=arm CROSS_COMPILE=${CROSS_COMPILE} EXTRA_CFLAGS=-fno-pic -Wall -Wextra -Wwrite-strings  SUBDIRS=$(PWD) modules
	rm -rf *.c~
	rm -rf *.mod*
	rm -rf *.o

clean:
	make -C $(KDIR) ARCH=arm CROSS_COMPILE={CROSS_COMPILE} EXTRA_CFLAGS=-fno-pic SUBDIRS=$(PWD) clean
