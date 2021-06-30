clear all;
close all;
clc;


%----------------------------------------------
FilePath='C:\Users\Andrew\Desktop\生醫影像HW6_607410167';
oldpath = path;
path(oldpath,[FilePath,'\NSR\'])

%----------------------------------------------

mkdir('Speckle Noise Reduction');
files_test = dir(fullfile('C:\Users\Andrew\Desktop\生醫影像HW6_607410167\newtest' ,'*.jpg'));
lengthFiles_test = length(files_test);
for i = 1:lengthFiles_test;
   
    I = imread(strcat('C:\Users\Andrew\Desktop\生醫影像HW6_607410167\newtest\',files_test(i).name));%檔案所在路徑
    level = 2; %---Second Level Decomposition
    bn = 'HH';
    EI = NSRFilters(I,'wlet',bn,'db1',level);
    imwrite(EI,['C:\Users\Andrew\Desktop\生醫影像HW6_607410167\Speckle Noise Reduction\','Noise_Reduction_',files_test(i).name]);
    
end

%----------------------------------------------













