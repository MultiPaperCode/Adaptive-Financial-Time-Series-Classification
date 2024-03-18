clc;
clear;
[Information,Time,AllInformation]=xlsread('MaoTai');
Time=Time(2:end,:);
%提取出53个金融指标
DateDayCandle=datenum(Time);         %ios日历形式
% d2 = datetime(DateDayCandle,'ConvertFrom','datenum')；此函数可转换回正常日历的形式
Open = Information(:,1);
High = Information(:,2);
Low=Information(:,3);
Close=Information(:,4);
Volume=Information(:,5);
Length=10;%周期选择5天
Type=0;%默认简单平移，有0.1.2三种选择。
Price=Close;%价格序列选择关盘价格
ADValue=AD(High,Low,Close,Volume);
[ARValue,BRValue]=ARBR(Open,High,Low,Close,Length);%yes
[UpAroon,DownAroon] =AROON(High,Low,Length);
ATRValue=ATR(High,Low,Close,Length,Type);
BIASValue=BIAS(Price,Length,Type);
Width=2;
[UpperLine,MiddleLine,LowerLine]=BOLL(Price,Length,Width,Type);
CCIValue=CCI(High,Low,Close,Length);
CMOValue=CMO(Price,Length);
CRValue=CR(High,Low,Close,Length);
CVValue=CV(High,Low,Length);
%FastLength-计算DMAValue时的短周期，常用10
%SlowLength-计算DMAValue时的长周期，常用50
%SmoothLength-计算AMAValue时的周期，常用10
FastLength=10;
SlowLength=50;
SmoothLength=10;
[DMAValue,AMAValue]=DMA(Price,FastLength,SlowLength,SmoothLength);
% N-计算趋向指标和趋向平均线时所考虑的周期
N=14;
[PosDI,NegDI,ADX]=DMI(High,Low,Close,N);
DPOValue=DPO(Price,Length);
EMAValue=EMA(Price,Length);
%N-求EMA时所考虑的周期，常用14
%M-求MAEMV时所考虑的周期，常用9
M=9;
[EMVValue,MAEMVValue]=EMV(High,Low,Volume,N,M);
% UpperLineValue, MiddleLineValue, LowerLineValue]=ENV(Price,Length,Width,Type);
ForceIndexValue=ForceIndex(Price,Volume);
%N-计算RSV时所考虑的周期（RSV是体现现在的价格处于过去n天的位置情况）,常用14
M=3;%M-计算K值时的参数,常用3
D=3;%L-计算D值时的参数,常用3
S=3;%S-计算J值时的参数,常用3
L=3;
[KValue,DValue,JValue]=KDJ(High,Low,Close,N,M,L,S);
MAValue=MA(Price,Length);
FastLength=12;%FastLength-计算DIF时的短周期，常用12
SlowLength=26;%SlowLength-计算DIF时的长周期，常用26
DEALength=9;%DEALength-计算DEA时的周期，常用9
[DIF,DEA,MACDValue]=MACD(Price,FastLength,SlowLength,DEALength);
MFIValue=MFI(High,Low,Close,Volume,Length);
[WR,MR,SR,WS,MS,SS]=MIKE(High,Low,Close,Length);
MTMValue=MTM(Price,Length);
NVIValue=NVI(Close,Volume);
OBVValue=OBV(Price,Volume);
PSYValue=PSY(Price,Length);
PVIValue=PVI(Close,Volume);
ROCValue=ROC(Price,Length);
RSIValue=RSI(Price,Length);
stdLength=10;%stdLength-计算标准差时的周期，常用10个Bar
Length=14;%Length-计算RVI时的周期，常用14个Bar
RVIValue=RVI(Price,stdLength,Length);
%a-初始加速因子
%b-加速因子的最大值
%[SARofCurBar,SARofNextBar,Position,Transition]=SAR(a,b);
%SmoothLength-对TRIXValue进行平滑时考虑的长度
SmoothLength=Length;
[TRIXValue,MATRIXValue]=TRIX(Price,Length,SmoothLength);
VHFValue=VHF(Price,Length);
VRValue=VR(Price,Volume,Length);
WADValue=WAD(High,Low,Close);
WMSValue=WMS(High,Low,Close,N);
WVADValue=WVAD(Open,High,Low,Close,Volume,Length);%yes
Label=[];
N=length(Information)-1;
for i = 2:length(Information)
    if Information(i,4)-Information(i-1,4)>0
        Label(i-1)=1;
    else
        Label(i-1)=-1;
    end
end
%%1
ARRAY1= WVADValue;%PSYValue PVIValue ROCValue RSIValue RVIValue TRIXValue,MATRIXValue VHFValue  上移
%2/3
ARRAY2=[ARValue BRValue];
%4、5
ARRAY3=[ADValue MFIValue];
%6、7、8、9/10/11、12/13/14、15/16/17/18/19/20、21、22
ARRAY4=[ATRValue CCIValue CRValue PosDI NegDI ADX KValue DValue JValue WR MR SR WS MS SS WADValue WMSValue];
%%23/24
ARRAY5=[EMVValue MAEMVValue];
%25/26、27
ARRAY6=[UpAroon DownAroon CVValue];
%28、29`
ARRAY7=[ForceIndexValue VRValue];
%30、31/32/33、34、35/36、37、38、39、40/41/42、
ARRAY8=[BIASValue UpperLine MiddleLine LowerLine CMOValue DMAValue AMAValue DPOValue EMAValue MAValue DIF,DEA,MACDValue];
Train=[ARRAY1,ARRAY2,ARRAY3,ARRAY4,ARRAY5,ARRAY6,ARRAY7,ARRAY8];
Train=Train(1:end-1,:);
Label=Label';%涨或者跌
F0=[Open,High,Low,Close,Volume];
F0=F0(1:end-1,:);
save F0 F0
save Train Train;
save Label Label;