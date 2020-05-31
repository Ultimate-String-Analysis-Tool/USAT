#include <iostream>

#include "Algorithm.hpp"

void Algorithm::execute(){
    using namespace std;
    cout << "This algorithm has been executed" << endl;
    
}

Algorithm::Algorithm() {
    populateSpecsFromFile();
}

int Algorithm::populateSpecsFromFile() {
    // Read the file. If there is an error, report it and exit.
    try
    {
        config.readFile("example.cfg");
    }
    catch(const FileIOException &fioex)
    {
        cerr << "I/O error while reading file." << endl;
        return(EXIT_FAILURE);
    }
    catch(const ParseException &pex)
    {
        cerr << "Parse error at " << pex.getFile() << ":" << pex.getLine()
                    << " - " << pex.getError() << endl;
        return(EXIT_FAILURE);
    }
}