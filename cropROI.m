clear all;
close all;
clc;

mkdir('ROI');
%----------------------------------------------
FilePath='C:\Users\Andrew\Desktop\生醫影像HW6_607410167';
cd([FilePath,'\Speckle Noise Reduction']);

I = imread('Noise_Reduction_Image_1.jpg');  
[Img0,rect]=imcrop(I);

files_test = dir(fullfile('C:\Users\Andrew\Desktop\生醫影像HW6_607410167\Speckle Noise Reduction','*.jpg'));
lengthFiles_test = length(files_test);
for i = 1:lengthFiles_test;
   
    I = imread(strcat('C:\Users\Andrew\Desktop\生醫影像HW6_607410167\Speckle Noise Reduction\',files_test(i).name));%檔案所在路徑
        
    I2 = imcrop(I,[rect(1) rect(2) rect(3) rect(4)]);
    
    imwrite(I2,['C:\Users\Andrew\Desktop\生醫影像HW6_607410167\ROI\','ROI_',files_test(i).name]);
end

%----------------------------------------------