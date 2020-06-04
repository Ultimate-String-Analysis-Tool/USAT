#include <iostream>

#include "Algorithm.hpp"



void Algorithm::execute(){
    using namespace std;
    info("This algorithm has been executed");
    
}

Algorithm::Algorithm() {
    populateSpecsFromFile();
}

int Algorithm::populateSpecsFromFile() {
    // Read the file. If there is an error, report it and exit.
    try
    {
        config.readFile("algorithms/CaesarCipher/specs.cfg");
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

    cout << "Load finished" << endl;

    // Get the algorithm name.
    try
    {
        name = (const char*)config.lookup("name");
        cout << "Algorithm name: " << name << endl << endl;
    }
    catch(const SettingNotFoundException &nfex)
    {
        cerr << "No 'name' setting in configuration file." << endl;
        return(EXIT_FAILURE);
    }
    
    //Check if this algorithm is an Encryption
    if(config.exists("encryption")){

    }



    return 0;
}