clc
clear
load F0
load Train
load Label
load Window
load Length
load RowsOfTrain
load PREDICT_DAYS

load X
load ACC
Train=[Train F0];
y=0;
for x=1:Window:Length-2*X
    y=y+1;

    %Window:length(LABLE)-(RowsOfTrain+Window+1)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %将样本分成独立的三部分训练集（train set），验证集（validation set ) 和测试集（test set）
    TrainSet_labels1 = Label(x:x+RowsOfTrain,:);
    TrainSet1 = Train(x:x+RowsOfTrain,:);
    %     union_set_labels=[TrainSet_labels;errorLable];
    %     union_setSet=[TrainSet;errorTrain];
    validationSet_labels1 = Label(x+RowsOfTrain+1:x+RowsOfTrain+Window,:);
    validationSet1=Train(x+RowsOfTrain+1:x+RowsOfTrain+Window,:);
    TestSet_labels1 = Label(x+RowsOfTrain+Window+1:x+RowsOfTrain+Window+PREDICT_DAYS,:);
    TestSet1=Train(x+RowsOfTrain+Window+1:x+RowsOfTrain+Window+PREDICT_DAYS,:);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %选特征的有五组，现在先不定close组的特征数目，过大,看运行情况
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
    
    TrainSet_labels = Label(x+X:x+RowsOfTrain+X,:);
    TrainSet = Train(x+X:x+RowsOfTrain+X,:);
    union_set_labels=[TrainSet_labels;errorLable];
    union_setSet=[TrainSet;errorTrain];
    validationSet_labels = Label(x+RowsOfTrain+1+X:x+RowsOfTrain+Window+X,:);
    validationSet=Train(x+RowsOfTrain+1+X:x+RowsOfTrain+Window+X,:);
    TestSet_labels = Label(x+RowsOfTrain+Window+1+X:x+2*X,:);
    TestSet=Train(x+RowsOfTrain+Window+1+X:x+2*X,:);
    model = svmtrain(union_set_labels,union_setSet);
    [pre, xx,~] = svmpredict(TestSet_labels,TestSet,model);
    accuracy(y)=xx(1,1);
end
AdaboostOfAccuracy=mean(accuracy)
ACC(2)=AdaboostOfAccuracy;
save ACC ACC