#pragma once

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <libconfig.h++>


using namespace std;
using namespace libconfig;


class Algorithm{
    Config config;

    public:
        Algorithm();
        void execute();
    private:
        int populateSpecsFromFile();

};