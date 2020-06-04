#pragma once

#include <libconfig.h++>
#include <iostream>

using namespace std;
using namespace libconfig;

class Encryption{
    struct Parameter{
        string name;
        string description;
        string readable_requirement;
        string requirement;
        string value;
        bool value_set = false;
    };
    public:
        void initialize(Config* c, string* name);
        std::string* getDescription();
        int execute();
    private:
        Parameter* parameters;
        int num_parameters;
        string executable;
        string name;
        string description;
        string string_requirement;
};