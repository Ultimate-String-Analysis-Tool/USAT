#pragma once

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <spdlog/spdlog.h>
#include <libconfig.h++>
#include "Encryption.hpp"


using namespace std;
using namespace libconfig;
using namespace spdlog;


class Algorithm{

    public:
        Algorithm();
        void execute();
        
    private:
        int populateSpecsFromFile();
        Config config;
        string name;
        string folderName;
        string description;
        string stringRegEx;

        Encryption* encryption;

};