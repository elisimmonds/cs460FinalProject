P3.out : Project3.o SetLimits.o LexicalAnalyzer.o SyntacticalAnalyzer.o CodeGenerator.o
	g++ -g -o P3.out Project3.o SetLimits.o LexicalAnalyzer.o SyntacticalAnalyzer.o CodeGenerator.o

Project3.o : Project3.cpp SetLimits.h SyntacticalAnalyzer.h
	g++ -g -c Project3.cpp

SetLimits.o : SetLimits.c SetLimits.h
	g++ -g -c SetLimits.c

LexicalAnalyzer.o : LexicalAnalyzer.cpp LexicalAnalyzer.h
	g++ -g -c LexicalAnalyzer.cpp

SyntacticalAnalyzer.o : SyntacticalAnalyzer.cpp SyntacticalAnalyzer.h LexicalAnalyzer.h CodeGenerator.h
	g++ -g -c -std=c++11 SyntacticalAnalyzer.cpp

CodeGenerator.o : CodeGenerator.h CodeGenerator.cpp LexicalAnalyzer.h
	g++ -g -c CodeGenerator.cpp

clean :
	rm *.o P2.out *.gch


submit : Project2.cpp LexicalAnalyzer.h LexicalAnalyzer.cpp SyntacticalAnalyzer.h SyntacticalAnalyzer.cpp makefile README.txt
	rm -rf TeamVP2
	mkdir TeamVP2
	cp Project2.cpp TeamVP2
	cp LexicalAnalyzer.h TeamVP2
	cp LexicalAnalyzer.cpp TeamVP2
	cp SyntacticalAnalyzer.h TeamVP2
	cp SyntacticalAnalyzer.cpp TeamVP2
	cp makefile TeamVP2
	cp README.txt TeamVP2
	tar cfvz TeamVP2.tgz TeamVP2
	cp TeamVP2.tgz ~tiawatts/cs460drop
