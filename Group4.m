Feature_Group=A4;
Feature_Length=length(Feature_Group);
Matrix_Exhaustively=ff2n(Feature_Length);
[m,n]=size(Matrix_Exhaustively);
ACCURACY=[];
for i=1:m
    Feature_this={};
    for j=1:n
        if Matrix_Exhaustively(i,j)==1
            Feature_this=[Feature_this cell2mat(Feature_Group(1,j))];
        end
    end
    
    %到这里读取到了A3中依次取到的行数
      Feature_this=[Feature_this A1 A2 A3 A5 A6 A7 A8 A9];
    getTrueLine=[];
    for j=1:length(Feature_this')
        
      getTrueLine=[getTrueLine cell2mat(Feature_this(1,j))];
        
    end
    Matrix_Features=TrainSet(:,getTrueLine);
    model = svmtrain(TrainSet_labels,Matrix_Features);
    [pre, xx,~] = svmpredict(validationSet_labels,validationSet,model);
    ACCURACY(:,i)=xx(1,1);
end
[maxValue,index]=max(ACCURACY);
Value_Best=Matrix_Exhaustively(index,:);
getTrueNumber=[];
for j=1:n
    if Value_Best(1,j)==1
        getTrueNumber=[getTrueNumber cell2mat(Feature_Group(1,j))];
    end
end
A4=getTrueNumber;