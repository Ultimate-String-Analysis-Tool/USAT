#include "Encryption.hpp"

using namespace std;
using namespace libconfig;

void Encryption::initialize(Config* c, string* name){
    string message = "A parameter with the name " + *name + " does not exist.";
    throw invalid_argument(message.c_str());
}