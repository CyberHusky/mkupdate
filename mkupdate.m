% mkupdate - function for remote programm files update from git-server
% filesep - separator for current OS version (win, lin etc.)
% computer - information about PC witch MatLab run (https://www.mathworks.com/help/matlab/ref/computer.html)

clc
clear

cur_local_ver = cell2mat( importdata([pwd, filesep, 'current_version.txt']) );
cur_local_ver = str2double(cur_local_ver(2:end));


