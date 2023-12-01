# Simple makefile demonstration.

# Here we are creating variable that are frequently used in entire Makefile.
CXX = gcc
CXXFLAGS = -Wno-implicit-function-declaration
OBJECT_FILES = main.o hello.o
 
all: final

# This LHS is target which we will specify while running make command i.e. make final.
# RHS is prerequisites i.e. which files are necessary to execute commands for target final.
# If the prerequisites files are not there then make will look for building those files first 
# and then execute the final.
final: main.o hello.o
	@echo "Linking and generating final executable"
	$(CXX) $(CXXFLAGS) main.o hello.o -o final
	chmod +x final

main: main.c
	@echo "Compiling the main.c into object file"
	$(CXX) $(CXXFLAGS) -c main.c

hello: hello.c
	@echo "Compiling the hello.c into object file"
	$(CXX) $(CXXFLAGS) -c hello.c

clean: 
	@echo "Removing the executables"
	rm main.o hello.o final

