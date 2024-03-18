clc;
clear;
[Information,Time,AllInformation]=xlsread('MaoTai');
Time=Time(2:end,:);
%��ȡ��53������ָ��
DateDayCandle=datenum(Time);         %ios������ʽ
% d2 = datetime(DateDayCandle,'ConvertFrom','datenum')���˺�����ת����������������ʽ
Open = Information(:,1);
High = Information(:,2);
Low=Information(:,3);
Close=Information(:,4);
Volume=Information(:,5);
Length=10;%����ѡ��5��
Type=0;%Ĭ�ϼ�ƽ�ƣ���0.1.2����ѡ��
Price=Close;%�۸�����ѡ����̼۸�
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
%FastLength-����DMAValueʱ�Ķ����ڣ�����10
%SlowLength-����DMAValueʱ�ĳ����ڣ�����50
%SmoothLength-����AMAValueʱ�����ڣ�����10
FastLength=10;
SlowLength=50;
SmoothLength=10;
[DMAValue,AMAValue]=DMA(Price,FastLength,SlowLength,SmoothLength);
% N-��������ָ�������ƽ����ʱ�����ǵ�����
N=14;
[PosDI,NegDI,ADX]=DMI(High,Low,Close,N);
DPOValue=DPO(Price,Length);
EMAValue=EMA(Price,Length);
%N-��EMAʱ�����ǵ����ڣ�����14
%M-��MAEMVʱ�����ǵ����ڣ�����9
M=9;
[EMVValue,MAEMVValue]=EMV(High,Low,Volume,N,M);
% UpperLineValue, MiddleLineValue, LowerLineValue]=ENV(Price,Length,Width,Type);
ForceIndexValue=ForceIndex(Price,Volume);
%N-����RSVʱ�����ǵ����ڣ�RSV���������ڵļ۸��ڹ�ȥn���λ�������,����14
M=3;%M-����Kֵʱ�Ĳ���,����3
D=3;%L-����Dֵʱ�Ĳ���,����3
S=3;%S-����Jֵʱ�Ĳ���,����3
L=3;
[KValue,DValue,JValue]=KDJ(High,Low,Close,N,M,L,S);
MAValue=MA(Price,Length);
FastLength=12;%FastLength-����DIFʱ�Ķ����ڣ�����12
SlowLength=26;%SlowLength-����DIFʱ�ĳ����ڣ�����26
DEALength=9;%DEALength-����DEAʱ�����ڣ�����9
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
stdLength=10;%stdLength-�����׼��ʱ�����ڣ�����10��Bar
Length=14;%Length-����RVIʱ�����ڣ�����14��Bar
RVIValue=RVI(Price,stdLength,Length);
%a-��ʼ��������
%b-�������ӵ����ֵ
%[SARofCurBar,SARofNextBar,Position,Transition]=SAR(a,b);
%SmoothLength-��TRIXValue����ƽ��ʱ���ǵĳ���
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
ARRAY1= WVADValue;%PSYValue PVIValue ROCValue RSIValue RVIValue TRIXValue,MATRIXValue VHFValue  ����
%2/3
ARRAY2=[ARValue BRValue];
%4��5
ARRAY3=[ADValue MFIValue];
%6��7��8��9/10/11��12/13/14��15/16/17/18/19/20��21��22
ARRAY4=[ATRValue CCIValue CRValue PosDI NegDI ADX KValue DValue JValue WR MR SR WS MS SS WADValue WMSValue];
%%23/24
ARRAY5=[EMVValue MAEMVValue];
%25/26��27
ARRAY6=[UpAroon DownAroon CVValue];
%28��29`
ARRAY7=[ForceIndexValue VRValue];
%30��31/32/33��34��35/36��37��38��39��40/41/42��
ARRAY8=[BIASValue UpperLine MiddleLine LowerLine CMOValue DMAValue AMAValue DPOValue EMAValue MAValue DIF,DEA,MACDValue];
Train=[ARRAY1,ARRAY2,ARRAY3,ARRAY4,ARRAY5,ARRAY6,ARRAY7,ARRAY8];
Train=Train(1:end-1,:);
Label=Label';%�ǻ��ߵ�
F0=[Open,High,Low,Close,Volume];
F0=F0(1:end-1,:);
save F0 F0
save Train Train;
save Label Label;