2025.5.26
May 26, 2025  
# TAFSAM (English Version)  

1. This is the code for the paper *Adaptive Financial Time Series Classification: Leveraging Historical Samples from Signal-to-Noise Ratio Margins*.  
2. This paper serves as the theoretical advancement of a previous paper titled *A Novel Reconstructed Training-Set SVM with Roulette Cooperative Coevolution for Financial Time Series Classification*.  
3. The relevant mathematical proofs are complete in both papers, primarily utilizing margin theory in SVM and proposing a sampling theory based on signal-to-noise ratio margins. The mathematical foundation is as follows:  
   ![image](https://github.com/user-attachments/assets/1f2cc9a9-c632-4e39-a296-4c19086ea7d7)  
4. Running this code requires installing the LIBSVM toolkit. You can experiment with the same sample in Professor Chih-Jen Lin’s demo under two different constraints (soft margin and hard margin) to intuitively observe our proposed method. The specific website is as follows:  
   https://www.csie.ntu.edu.tw/~cjlin/libsvm/.  
   The operation interface is shown below:  
   ![image](https://github.com/user-attachments/assets/2ab9fde2-b9d2-45b8-8876-4cb4a7311203)  
5. If you are a computer science researcher, this is all you need. If you are a quantitative trader, you can perform feature selection based on the following image:  
   ![image](https://github.com/user-attachments/assets/bb182079-fa61-4c19-b202-9b13ed6f9353)  
   There are many packages available for calculating financial indicators, and many advanced versions exist now. You can rewrite the dataset processing part in the source code—likely only requiring modifications to function names.


# TAFSAM（中文版）
1. 这是论文（Adaptive Financial Time Series Classification: Leveraging Historical Samples from Signal-to-Noise Ratio Margins）的代码
2. 此论文是之前的论文（A novel reconstructed training-set SVM with roulette cooperative coevolution for financial time series classification）的理论进阶篇
3. 相关的数学证明在两篇论文中都已完备，主要用到SVM中的间隔理论，提出了一个根据信噪比间隔取样的理论。数学基础如下
   ![image](https://github.com/user-attachments/assets/1f2cc9a9-c632-4e39-a296-4c19086ea7d7)
4. 运行此代码需要安装LIBSVM工具包。你在林智仁教授的demo中试玩同一样本，两种约束（软间隔，硬间隔）下，可以非常直观的观察到我们提出方法。具体网址如下 https://www.csie.ntu.edu.tw/~cjlin/libsvm/。操作界面如下![image](https://github.com/user-attachments/assets/2ab9fde2-b9d2-45b8-8876-4cb4a7311203)
5. 如果你是计算机方面的研究人员，到此结束。如果你是量化交易员，可根据下图，做特征选择。![image](https://github.com/user-attachments/assets/bb182079-fa61-4c19-b202-9b13ed6f9353) 计算金融指标的安装包有很多，现在有很多的进阶版本，可在源代码处理数据集的位置自己重写，应该只需要修改函数名即可。

