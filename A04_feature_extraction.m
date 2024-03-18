clc
clear
load F0
load Train
load Label
load Length
load Window
load RowsOfTrain
load PREDICT_DAYS


load X
y=0;
Train=[Train F0];
load ACC
for  x=1:Window:Length-2*X
    load A1
    load A2
    load A3
    load A4
    load A5
    load A6
    load A7
    load A8
    load A9
    y=y+1;

    %%%%%%以上代码取出了errordata
    TrainSet_labels = Label(x+X:x+RowsOfTrain+X,:);
    TrainSet = Train(x+X:x+RowsOfTrain+X,:);
    validationSet_labels = Label(x+RowsOfTrain+1+X:x+RowsOfTrain+Window+X,:);
    validationSet=Train(x+RowsOfTrain+1+X:x+RowsOfTrain+Window+X,:);
    TestSet_labels = Label(x+RowsOfTrain+Window+1+X:x+2*X,:);
    TestSet=Train(x+RowsOfTrain+Window+1+X:x+2*X,:);
    Group1;
    Group2;
    Group3;
    Group4;
    Group5;
    Group6;
    Group7;
    Group8;
    Group9;
    OverGroup={A1 A2 A3 A4 A5 A6 A7 A8 A9};
    get_Feature_sons=[];
    for j=1:length(OverGroup')
        get_Feature_sons=[get_Feature_sons cell2mat(OverGroup(1,j))];
    end
    ModelMatrix=Train(:,get_Feature_sons);
    model = svmtrain(Label(x+X:x+RowsOfTrain+X,:),ModelMatrix(x+X:x+RowsOfTrain+X,:));
    [pre, xx,~] = svmpredict(Label(x+RowsOfTrain+Window+1+X:x+2*X,:),ModelMatrix(x+RowsOfTrain+Window+1+X:x+2*X,:),model);
    accuracy(y)=xx(1,1);
end
Feature_Accuracy=mean(accuracy);
ACC(3)=Feature_Accuracy;
save ACC ACC