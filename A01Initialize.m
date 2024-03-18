clc;
clear;
A00GetData;
load Label
Length=length(Label);
ACC=[];
RowsOfTrain=600;
Window=200;
PREDICT_DAYS=200;
X=RowsOfTrain+Window+PREDICT_DAYS;
A1={};
A1{1,1}=1;
A2={};
A2{1,1}=[2 3];
A3={};
A3{1,1}=4;
A3{1,2}=5;
A4={};
A4{1,1}=6;
A4{1,2}=7;
A4{1,3}=8;
A4{1,4}=[9,10,11];
A4{1,5}=[12 13 14];
A4{1,6}=[15 16 17 18 19 20];
A4{1,7}=21;
A4{1,8}=22;
A5={};
A5{1,1}=[23 24];
A6={};
A6{1,1}=[25,26];
A6{1,2}=27;
A7={};
A7{1,1}=28;
A7{1,2}=29;
A8={};
A8{1,1}=30;
A8{1,2}=[31,32,33];
A8{1,3}=34;
A8{1,4}=[35 36];
A8{1,5}=37;
A8{1,6}=38;
A8{1,7}=39;
A8{1,8}=[40 41 42];
A9={};
A9{1,1}=43;
A9{1,2}=44;
A9{1,3}=45;
A9{1,4}=46;
A9{1,5}=47;
save A1 A1
save A2 A2
save A3 A3
save A4 A4
save A5 A5
save A6 A6
save A7 A7
save A8 A8
save A9 A9
save RowsOfTrain RowsOfTrain
save Window Window
save Length Length
save PREDICT_DAYS PREDICT_DAYS
save ACC ACC
save X X
%%开始程序
A02_NoOperation
A03_AdaboostOfAll
A04_feature_extraction
A05_Adaboost_Feature
save resultData
quit