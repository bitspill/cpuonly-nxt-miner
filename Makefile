CC=g++
CFLAGS=-I. -m64
LDFLAGS=-static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive -static-libstdc++ -static-libgcc -m64
%.o: %.cpp $(DEPS)
	$(CC) -O2 -Wall -std=c++0x -c -o $@ $< $(CFLAGS)

miner: main.o uint128_t.o uint256_t.o happyhttp.o
	g++ -o miner main.o uint128_t.o uint256_t.o happyhttp.o $(LDFLAGS) 
