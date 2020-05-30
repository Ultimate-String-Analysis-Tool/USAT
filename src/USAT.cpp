// USAT.cpp : Defines the entry point for the application.
//

#include "USAT.h"

#include "Algorithm.hpp"

using namespace std;

int main()
{
	cout << "Hello CMake." << endl;

	Algorithm a;
	a.execute();

	Algorithm* a2 = new Algorithm();
	a2->execute();
	delete a2;

	return 0;
}