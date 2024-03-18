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
for x=X:Window:Length-X
    y=y+1;

    %Window:length(LABLE)-(RowsOfTrain+Window+1)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %将样本分成独立的三部分训练集（train set），验证集（validation set ) 和测试集（test set）
    TrainSet_labels = Label(x:x+RowsOfTrain,:);
    TrainSet = F0(x:x+RowsOfTrain,:);
    TestSet_labels = Label(x+RowsOfTrain+Window+1:x+RowsOfTrain+Window+PREDICT_DAYS,:);
    TestSet=F0(x+RowsOfTrain+Window+1:x+RowsOfTrain+Window+PREDICT_DAYS,:);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %选特征的有五组，现在先不定close组的特征数目，过大,看运行情况
    model = svmtrain(TrainSet_labels,TrainSet);
    [pre, xx,~] = svmpredict(TestSet_labels,TestSet,model);
    Accuracy(y)=xx(1,1);
end
No_Accuracy=mean(Accuracy)
ACC(1)=No_Accuracy;
save ACC ACC