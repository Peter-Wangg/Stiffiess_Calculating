clear all;
close all;
clc;

%----------------------------------------------
FilePath='C:\Users\Andrew\Desktop\生醫影像HW6_607410167';
oldpath = path;
path(oldpath,[FilePath,'\test\'])

%----------------------------------------------

mkdir('newtest');
files_test = dir(fullfile('C:\Users\Andrew\Desktop\生醫影像HW6_607410167\test','*.jpg'));
lengthFiles_test = length(files_test);

fixed=imread('C:\Users\Andrew\Desktop\生醫影像HW6_607410167\test\Image_1.jpg');
fixed=fixed(:,:,1);
fixed=fixed(50:570,200:585);

for i = 1:lengthFiles_test;
   
    moving = imread(strcat('C:\Users\Andrew\Desktop\生醫影像HW6_607410167\test\',files_test(i).name));%檔案所在路徑
        
    moving=moving(:,:,1);
    moving=moving(50:570,200:585);
    [optimizer, metric] = imregconfig('multimodal');
    movingRegistered = imregister(moving, fixed, 'translation', optimizer, metric);
    imwrite(movingRegistered,['C:\Users\Andrew\Desktop\生醫影像HW6_607410167\newtest\',files_test(i).name]);
    
end
