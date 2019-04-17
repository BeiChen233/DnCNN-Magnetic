function Save_Image(Hax,Hay,Za,Delta_T,Grid_size,Grid_interval,Image_pixel,i,path,contourf_num)
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


v = get(0,'ScreenSize');% ��ȡ�������Ļ��λ�úͷֱ���
x = -Grid_size:Grid_interval:Grid_size;
y = -Grid_size:Grid_interval:Grid_size;
string_array = ["Hax","Hay","Za","Delta_T"];

%% ����ͼ������
for j=1:size(string_array,2)
    
    f = figure(1);% ��ȡͼ�δ��ڶ�����
    ax = axes('Parent',f);% ��ȡ�����������
    contourf(x,y,eval(string_array(j)),contourf_num);% ���Ƶ�ֵ��ͼ
    set(f,'MenuBar','none','position',[v(3)/2-Image_pixel/2,v(4)/2-Image_pixel/2,Image_pixel,Image_pixel],'Units','pixel');
    set(ax,'xtick', [],'ytick', [],'position',[0,0,1,1]);
    set(f,'Visible','off');
    Frame = getframe(f);%��ȡͼ�δ����ڵ�ͼ��
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


