clc;
clear all;

%%%%%%%%%%%%% ex. 2
catik = imread('catik.png');

%%%%%%%%%%%%% ex. 3
imshow(catik);
pause;

%%%%%%%%%%%%% ex. 4
imwrite(catik, 'catik.jpg');

%%%%%%%%%%%%% ex. 5
imwrite(catik, 'catik.png');

%%%%%%%%%%%%% ex. 6
i_j = imfinfo('catik.jpg');
i_p = imfinfo('catik.png');

%%%%%%%%%%%%% ex. 7
k_jpg = (i_j.Width * i_j.Height * i_j.BitDepth) / (8 * i_j.FileSize);
k_png = (i_p.Width * i_p.Height * i_p.BitDepth) / (8 * i_p.FileSize);
if k_jpg > k_png
    fprintf("k_jpg > k_png\n");
else
    fprintf("k_jpg < k_png\n");
end

%%%%%%%%%%%%% ex. 8
gr_catik = rgb2gray(catik);
imshow(gr_catik);
pause;
imwrite(gr_catik, 'gr_catik.png');

%%%%%%%%%%%%% ex. 9
catik_25 = mat2gray(gr_catik, [255*0.25, 255]);
imshow(catik_25);
pause;
imwrite(catik_25, './Logical/catik_25.png');

catik_50 = mat2gray(gr_catik, [255*0.50, 255]);
imshow(catik_50);
pause;
imwrite(catik_50, './Logical/catik_50.png');

catik_75 = mat2gray(gr_catik, [255*0.75, 255]);
imshow(catik_75);
pause;
imwrite(catik_75, './Logical/catik_75.png');

%%%%%%%%%%%%% ex. 10
catik_1 = logical(bitget(gr_catik, 1));
imshow(catik_1);
pause;
imwrite(catik_1, './BitPlane/catik_1.png');

catik_2 = logical(bitget(gr_catik, 2));
imshow(catik_2);
pause;
imwrite(catik_2, './BitPlane/catik_2.png');

catik_3 = logical(bitget(gr_catik, 3));
imshow(catik_3);
pause;
imwrite(catik_2, './BitPlane/catik_3.png');

catik_4 = logical(bitget(gr_catik, 4));
imshow(catik_4);
pause;
imwrite(catik_2, './BitPlane/catik_4.png');

catik_5 = logical(bitget(gr_catik, 5));
imshow(catik_5);
pause;
imwrite(catik_2, './BitPlane/catik_5.png');

catik_6 = logical(bitget(gr_catik, 6));
imshow(catik_6);
pause;
imwrite(catik_2, './BitPlane/catik_6.png');

catik_7 = logical(bitget(gr_catik, 7));
imshow(catik_7);
pause;
imwrite(catik_2, './BitPlane/catik_7.png');

catik_8 = logical(bitget(gr_catik, 8));
imshow(catik_8);
pause;
imwrite(catik_2, './BitPlane/catik_8.png');

%%%%%%%%%%%%% ex. 11
catik_5d = mat2gray(blkproc(gr_catik, [5 5], 'mean2(x) * ones(size(x))'));
imwrite(catik_5d, './Discret/catik_5d.png');

catik_10d = mat2gray(blkproc(gr_catik, [10 10], 'mean2(x) * ones(size(x))'));
imwrite(catik_10d, './Discret/catik_10d.png');

catik_20d = mat2gray(blkproc(gr_catik, [20 20], 'mean2(x) * ones(size(x))'));
imwrite(catik_20d, './Discret/catik_20d.png');

catik_50d = mat2gray(blkproc(gr_catik, [50 50], 'mean2(x) * ones(size(x))'));
imwrite(catik_50d, './Discret/catik_50d.png');

%%%%%%%%%%%% ex. 12
catik_4q = mat2gray(imquantize(gr_catik, linspace(0, 255, 5)));
imwrite(catik_4q, './Quantiz/catik_4q.png');

catik_16q = mat2gray(imquantize(gr_catik, linspace(0, 255, 17)));
imwrite(catik_16q, './Quantiz/catik_16q.png');

catik_32q = mat2gray(imquantize(gr_catik, linspace(0, 255, 33)));
imwrite(catik_32q, './Quantiz/catik_32q.png');

catik_64q = mat2gray(imquantize(gr_catik, linspace(0, 255, 65)));
imwrite(catik_64q, './Quantiz/catik_64q.png');

catik_128q = mat2gray(imquantize(gr_catik, linspace(0, 255, 129)));
imwrite(catik_128q, './Quantiz/catik_128q.png');

%%%%%%%%%%% ex. 13 
x_c = i_j.Width/2;
y_c = i_j.Height/2;
ab = 100;
xmin = x_c - ab/2;
ymin = y_c - ab/2;
catik_cr = imcrop(gr_catik, [xmin ymin ab ab]);
imshow(catik_cr);
pause;
imwrite(catik_cr, './Crop/catik_cr.png');

%%%%%%%%%%%% ex. 14
N1 = [gr_catik(20, 17), gr_catik(21, 16),gr_catik(22, 17),gr_catik(21, 18)];
N2 = [gr_catik(14, 11), gr_catik(15, 10),gr_catik(16, 11),gr_catik(15, 12)];
N3 = [gr_catik(18, 88), gr_catik(18, 87),gr_catik(19, 87),gr_catik(20, 87), gr_catik(20, 88), gr_catik(20, 89),gr_catik(19, 89),gr_catik(18, 89)];

%%%%%%%%%%%% ex. 15
mean_br = mean(mean(gr_catik));

%%%%%%%%%%%% ex. 16
catik_new = gr_catik;
ab_mark = 20;

catik_cr_1 = imcrop(gr_catik, [0 0 ab_mark ab_mark]);
mean_cr_1 = mean(mean(catik_cr_1));
catik_cr_2 = imcrop(gr_catik, [i_j.Height-ab_mark 0 ab_mark ab_mark]);
mean_cr_2 = mean(mean(catik_cr_2));
catik_cr_3 = imcrop(gr_catik, [0 i_j.Width-ab_mark ab_mark ab_mark]);
mean_cr_3 = mean(mean(catik_cr_3));
catik_cr_4 = imcrop(gr_catik, [i_j.Height-ab_mark i_j.Width-ab_mark ab_mark ab_mark]);
mean_cr_4 = mean(mean(catik_cr_4));
catik_cr_5 = imcrop(gr_catik, [x_c-ab_mark/2 y_c-ab_mark/2 ab_mark ab_mark]);
mean_cr_5 = mean(mean(catik_cr_5));

if mean_cr_1 < 128
    catik_new = insertShape(catik_new, "FilledRectangle", [0 0 ab_mark ab_mark], "Color", {"white"}, "Opacity", 1);
else
    catik_new = insertShape(catik_new, "FilledRectangle", [0 0 ab_mark ab_mark], "Color", {"black"}, "Opacity", 1);
end

if mean_cr_2 < 128
    catik_new = insertShape(catik_new, "FilledRectangle", [i_j.Height-ab_mark 0 ab_mark ab_mark], "Color", {"white"}, "Opacity", 1);
else
    catik_new = insertShape(catik_new, "FilledRectangle", [i_j.Height-ab_mark 0 ab_mark ab_mark], "Color", {"black"}, "Opacity", 1);
end

if mean_cr_3 < 128
    catik_new = insertShape(catik_new, "FilledRectangle", [0 i_j.Width-ab_mark ab_mark ab_mark], "Color", {"white"}, "Opacity", 1);
else
    catik_new = insertShape(catik_new, "FilledRectangle", [0 i_j.Width-ab_mark ab_mark ab_mark], "Color", {"black"}, "Opacity", 1);
end

if mean_cr_4 < 128
    catik_new = insertShape(catik_new, "FilledRectangle", [i_j.Height-ab_mark i_j.Width-ab_mark ab_mark ab_mark], "Color", {"white"}, "Opacity", 1);
else
    catik_new = insertShape(catik_new, "FilledRectangle", [i_j.Height-ab_mark i_j.Width-ab_mark ab_mark ab_mark], "Color", {"black"}, "Opacity", 1);
end

if mean_cr_5 < 128
    catik_new = insertShape(catik_new, "FilledRectangle", [x_c-ab_mark/2 y_c-ab_mark/2 ab_mark ab_mark], "Color", {"white"}, "Opacity", 1);
else
    catik_new = insertShape(catik_new, "FilledRectangle", [x_c-ab_mark/2 y_c-ab_mark/2 ab_mark ab_mark], "Color", {"black"}, "Opacity", 1);
end

imshow(catik_new);

imwrite(catik_new, './Marks/catik_mark.png');