function mkupdate(prog_name, web, download_web)

% MKUPDATE is simple function for remote programm files update from 
% git-server to end user. It will be useful for your end user to make 
% update of current version of your program.
%
% OUTPUT:
%    this m-file will scan your specified github repository, check program 
%    version, download files if needed and change dowloaded file in current folder. 
%
% INPUT:
%   prog_name - name of you program on github (example: 'mkupdate')
%   web - http site of raw version of "current_version" file (example: 'https://raw.githubusercontent.com/CyberHusky/mkupdate/master/current_version.txt')
%   download_web - http site of zip archive of your program on github (example: 'https://github.com/CyberHusky/mkupdate/archive/master.zip')

cur_local_ver = cell2mat( importdata([pwd, filesep, 'current_version.txt']) );
cur_local_ver = str2double( cur_local_ver(2:end) );


cur_gl_ver = cell2mat ( cellstr( webread(web) ) );
cur_gl_ver = str2double( cur_gl_ver(2:end) );



if cur_gl_ver > cur_local_ver
    
    zip([prog_name,'.bak'], pwd) % make backup files in zip
    
    unzip(download_web) % alternative - websave([prog_name,'.zip'], download_web)

    file = dir([pwd, filesep, prog_name, '-master']);
    for i=3:length(file)
        status = movefile([file(i).folder, filesep, file(i).name], [pwd, filesep, file(i).name]);
    end
    rmdir([pwd, filesep, prog_name, '-master']) % delete buffer folder
    
else
    errordlg(['Current version of program: ',cellstr(webread(web))],'Update is not necessary!')
    
end
