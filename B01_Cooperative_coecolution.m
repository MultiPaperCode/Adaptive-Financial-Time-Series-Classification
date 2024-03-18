FeatureOfCell=Co_feature';
NumberFeatureOfCell=length(FeatureOfCell);
MatrixExhaustively=ff2n(NumberFeatureOfCell);
[m,n]=size(MatrixExhaustively);
Acc=[];
for i=2:m
    F=[];
    for j=1:n
        if MatrixExhaustively(i,j)==1
            F=[F cell2mat(FeatureOfCell(1,j))];
        end
    end
    MatrixFeatures=Train(:,F);
    model = svmtrain(Label(1:RowsOfTrain,:),MatrixFeatures(1:RowsOfTrain,:));
    [pre, xx,~] = svmpredict(Label(RowsOfTrain+1:RowsOfTrain+Window,:),MatrixFeatures(RowsOfTrain+1:RowsOfTrain+Window,:),model);
     Acc(:,i)=xx(1,1);
end
[M,index]=max(Acc);
ValueOfGroup=MatrixExhaustively(index,:);
Group=[];
for j=1:n
    if ValueOfGroup(1,j)==1
        Group=[Group cell2mat(FeatureOfCell(1,j))];
    end
end
bestValueFeature=Group;
