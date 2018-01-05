% mkupdate - function for remote programm files update from git-server
% filesep - separator for current OS version (win, lin etc.)
% computer - information about PC witch MatLab run (https://www.mathworks.com/help/matlab/ref/computer.html)

clc
clear

prog_name = 'mkupdate';
web = 'https://raw.githubusercontent.com/CyberHusky/mkupdate/master/current_version.txt';
download_web = 'https://github.com/CyberHusky/mkupdate/archive/master.zip';

cur_local_ver = cell2mat( importdata([pwd, filesep, 'current_version.txt']) );
cur_local_ver = str2double( cur_local_ver(2:end) );


cur_gl_ver = cell2mat ( cellstr( webread(web) ) );
cur_gl_ver = str2double( cur_gl_ver(2:end) );
% https://github.com/CyberHusky/mkupdate/archive/master.zip


% websave([prog_name,'.zip'], download_web)


% movefile ([pwd, filesep, prog_name, '-master'], pwd)
% movefile /home/artem/GitHub/mkupdate/mkupdate-master/begin_test.m /home/artem/GitHub/mkupdate/begin_test.m
% copyfile ([pwd, filesep, prog_name, '-master'], pwd)

if cur_gl_ver > cur_local_ver
    
    zip([prog_name,'.bak'], pwd)
    
    unzip(download_web)

    file = dir([pwd, filesep, prog_name, '-master']);
    for i=3:length(file)
        status = movefile([file(i).folder, filesep, file(i).name], [pwd, filesep, file(i).name]);
    end
    rmdir([pwd, filesep, prog_name, '-master'])
    
    
end
