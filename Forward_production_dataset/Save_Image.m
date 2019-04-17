function Save_Image(Hax,Hay,Za,Delta_T,Grid_size,Grid_interval,Image_pixel,i,path,contourf_num)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明


v = get(0,'ScreenSize');% 获取计算机屏幕的位置和分辨率
x = -Grid_size:Grid_interval:Grid_size;
y = -Grid_size:Grid_interval:Grid_size;
string_array = ["Hax","Hay","Za","Delta_T"];

%% 保存图像数据
for j=1:size(string_array,2)
    
    f = figure(1);% 获取图形窗口对象句柄
    ax = axes('Parent',f);% 获取坐标轴对象句柄
    contourf(x,y,eval(string_array(j)),contourf_num);% 绘制等值线图
    set(f,'MenuBar','none','position',[v(3)/2-Image_pixel/2,v(4)/2-Image_pixel/2,Image_pixel,Image_pixel],'Units','pixel');
    set(ax,'xtick', [],'ytick', [],'position',[0,0,1,1]);
    set(f,'Visible','off');
    Frame = getframe(f);%获取图形窗口内的图像
    if strcmp(path,"./Train_clean/test_")
        imwrite(rgb2gray(Frame.cdata),['./Train_clean_gray/test_',sprintf('%03d',size(string_array,2)*(i-1)+j),'.bmp'],'bmp');
        imwrite(Frame.cdata,['./Train_clean_color/test_',sprintf('%03d',size(string_array,2)*(i-1)+j),'.bmp'],'bmp');
    end
    if strcmp(path,"./Train_noisy/test_")
        %if strcmp(img_type,"gray")
        imwrite(rgb2gray(Frame.cdata),['./Train_noisy_gray/test_',sprintf('%03d',size(string_array,2)*(i-1)+j),'.bmp'],'bmp');
        %else
        imwrite(Frame.cdata,['./Train_noisy_color/test_',sprintf('%03d',size(string_array,2)*(i-1)+j),'.bmp'],'bmp');
        %end
    end
    clf(f);
end
close all;


