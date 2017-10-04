# ULib Servlet Page Docroot

This is a simple template to help others setup a project environment when working with [usp files](https://github.com/stefanocasazza/ULib/wiki/ULib-Servlet-Pages). 

The included makefile will call usp_compile on usp files and synchronises files in the src directory and docroot folders, It doesn't add any functionality to ULib/Userver.  

Most IDEs have the ability to work with makefile projects and therefore this is a convenient way to integrate the usp workflow into your IDE of choice.

Please note make doesn't support spaces in path/filenames and at present this build system ignores dependence's, ie if you change a header the sources that use it will not be flagged for a rebuild by make. 

# Setup
Firstly download and install [ULib/UServer](https://github.com/stefanocasazza/ULib/wiki/Getting-Started-With-ULib)
you can skip the configuration steps and use (tweak) the configuration included in the template.

Get a copy of the USP_Docroot template

    git clone https://github.com/ArchNemSyS/USP_Docroot.git
 
Copy all files and folders to a new folder or delete the hidden .git directory.


# Make
Place any headers into the include folder and docroot files (.usp .html .css ...) into the src folder. 
The makefile is human readable if you need to handle additional file types.
Then execute make in a shell within the root of the template:

    make

This will generate the docroot folder, complete with compiled usp files.

# Run
The template also includes a minimal config in the etc/userver.cfg folder and minimal run environment in bin/web_server.sh.
Add/edit any need values in etc/userver.cfg and then execute bin/web_server.sh

# Clean
    
    make clean

This simply removes the docroot folder for a completely fresh build.
