#pragma once

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <libconfig.h++>


using namespace std;
using namespace libconfig;


class Algorithm{

    public:
        Algorithm();
        void execute();
    private:
        int populateSpecsFromFile();
        Config config;

};