## mkupdate
# Function for remote update of personal MatLab files.

MKUPDATE is simple function for remote programm files update from 
git-server to end user. It will be useful for your end user to make 
update of current version of your program.

OUTPUT:
    this m-file will scan your specified github repository, check program 
    version, download files if needed and change dowloaded file in current folder. 

INPUT:
   prog_name - name of you program on github (example: 'mkupdate')
   web - http site of raw version of "current_version" file (example: 'https://raw.githubusercontent.com/CyberHusky/mkupdate/master/current_version.txt')
   download_web - http site of zip archive of your program on github (example: 'https://github.com/CyberHusky/mkupdate/archive/master.zip')

