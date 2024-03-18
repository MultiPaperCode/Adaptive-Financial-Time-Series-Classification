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
load ACC
y=0;
Train=[Train F0];
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %将样本分成独立的三部分训练集（train set），验证集（validation set ) 和测试集（test set）
    TrainSet_labels1 = Label(x:x+RowsOfTrain,:);
    TrainSet1 = Train(x:x+RowsOfTrain,:);
    %     union_set_labels=[TrainSet_labels;errorLable];
    %     union_setSet=[TrainSet;errorTrain];
%     validationSet_labels1 = Label(x+RowsOfTrain+1:x+RowsOfTrain+Window,:);
%     validationSet1=Train(x+RowsOfTrain+1:x+RowsOfTrain+Window,:);
    validationSet_labels1 = Label(x+RowsOfTrain+1:x+RowsOfTrain+Window+PREDICT_DAYS,:);
    validationSet1=Train(x+RowsOfTrain+1:x+RowsOfTrain+Window+PREDICT_DAYS,:);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    model = svmtrain(TrainSet_labels1,TrainSet1);
    [pre, xx,~] = svmpredict(validationSet_labels1,validationSet1,model);
    L=0;
    for j=1:length(pre)
        if pre(j,:)==validationSet_labels1(j,:)
            L=L+1;
            errorLable(L,:)=validationSet_labels1(j,:);
            errorTrain(L,:)=validationSet1(j,:);
        end
    end
    %%%%%%以上代码取出了errordata
    TrainSet_labels = Label(x+X:x+RowsOfTrain+X,:);
    TrainSet = Train(x+X:x+RowsOfTrain+X,:);
    union_set_labels=[TrainSet_labels;errorLable];
    union_setSet=[TrainSet;errorTrain];
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
    model = svmtrain(Label(x+RowsOfTrain+Window+1:x+2*RowsOfTrain+Window,:),ModelMatrix(x+RowsOfTrain+Window+1:x+2*RowsOfTrain+Window,:));
    [pre, xx,~] = svmpredict(Label(x+2*(RowsOfTrain+Window)+1:x+2*(RowsOfTrain+Window)+PREDICT_DAYS,:),ModelMatrix(x+2*(RowsOfTrain+Window)+1:x+2*(RowsOfTrain+Window)+PREDICT_DAYS,:),model);
    accuracy(y)=xx(1,1);
end
Adaboost_Feature_Accuracy=mean(accuracy);
ACC(4)=Adaboost_Feature_Accuracy;
save ACC ACC