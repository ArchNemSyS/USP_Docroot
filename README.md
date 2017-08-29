# ULib Servlet Page Docroot

This is a simple template to help others setup a project environment when working with usp files. 

The included makefile keeps will call usp_compile on usp files and syncronises files in the src directory and docroot folders, It doesn't add any functionality to ULib/Userver.  

Most IDEs have the ability to work with makefile projects and therefore this is a conveininet way to intergate the usp workflow into your IDE of choice.

# Setup
Firstly download and install [ULib/UServer](https://github.com/stefanocasazza/ULib/wiki/Getting-Started-With-ULib)
you can skip the configuration steps and use (tweek) the configuration included in the template.

Get a copy of the USP_Docroot template

    git clone https://github.com/ArchNemSyS/USP_Docroot.git
 
Copy all files and folders to a new folder or delete the hidden .git directory.


# Make
Place any headers into the include folder and docroot files (.usp .html .css ...) into the src folder. 
The makefile is human readable if you need to handel additional file types.
Then execute make in a shell within the root of the template:

    make

This will generate the docroot folder, complete with compiled usp files.

# Run
The template also includes a minimal config in the etc/userver.cfg folder and minimal run environment in bin/web_server.sh.
Add/edit any need values in etc/userver.cfg and then execute bin/web_server.sh

# Clean
    
    make clean

This simply removes the docroot folder for a completely fresh build.
