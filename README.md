# USAT
The Ultimate String Analysis Tool is **yet to be** be a cross-platform suite of command-line programs that identify files, hashes, and encrypted messages from strings of text. The toolset is implemented with a modular, extendible approach in mind:

Every type of string, whether that's an encoding for a file, a hash, or an encrypted message, has its own characteristics. For example, 
we can assume that a simple Caesar cipher would only contain alphanumeric text with whitespace and common symbols like punctuation marks. That "fingerprint" can be stored in a file that can then be used to determine if an arbitrary string could be a Caesar cipher.

By combining the Caesar cipher's fingerprint with a standalone application that encodes and decodes arbitrary text, an automated workflow can be created to find all plausible interpretations of a string, and, if any interpretation is an encoding or encryption, attempt to decode or decrypt the string.

## Build
This project currently builds with CMake and no additional dependencies or parameters. Build it as you would any other CMake project.

Some build tools are also available:
* [build.bat](build.bat) can be used to build the system on Windows platforms, given that CMake, Ninja, and Clang are installed.
* [build.sh](build.bat) can be used to build the system on Linux platforms. CMake, Make, and GCC are the required build tools, but on Debian-based systems, they will be installed and updated automatically.

## Contributions
This project is in its early stage of development, but contributions are always welcome, from bug fixes to new tools and even low-level framework ideas and suggestions.
