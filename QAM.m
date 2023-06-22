% This is for the modulation and Demodulation of 4-QAM for the data signal
% *********************4-QAM modulation and de-modulation ****************%
%**********************without using inbuilt qam function***************%
clc;
clear all;
close all;

% ********************* Define transmitted signal *************************
x_inp =input('Enter the Input Sequence For QAM modulation'); 
%x_inp = [1 0 0 0 0 1 1 1]; 
%*************************************************************************
%calculate length of the signal sequence
N = length(x_inp);


if(rem(N,2)~=0)
    display('Odd sequence 4-QAM Is not possible')
else
    
    display('THE SIGNAL TRANSMISSION IS POSSIBLE FOR EVEN SEQUENCE');

%****Binary information as stream of bits (binary signal 0 or 1)*******

Tb = 0.001;   
%Data rate = 1kHz i.e., bit period in (seconds)-->can be varied

disp('Binary Input Information at Transmitter: ');
disp(x_inp); 

%higher the nb bit rate value -> no loss of signal
nb=input('Enter the value of bit rate');

f1 = figure(1);
set(f1,'color',[1 1 1]);

%plot the discrete input signal
subplot(3,1,1);

%time_axis contains discrete time intervals to plot input signal(0 to N-1)
time_axis=0:1:length(x_inp)-1;
stem(time_axis,x_inp);

%provide dimensions for the axis
axis([ 0 N 0 1.5]);
ylabel('Amplitude(volt)');
xlabel(' Time(sec)');
title('Input signal as discrete signal');

% *********Convert input signal into polar format*************%
% bit-1 represents postive value  +1
% bit-0 represents negative value -1

%define an array to store the discrete values
x_bit=[]; 




%polar conversion of the input signal

for n=1:1:N   
    if x_inp(n)==1;  
       x_bitt=ones(1,nb);
    else x_inp(n)==0;
        x_bitt=-ones(1,nb);
    end
     x_bit=[x_bit x_bitt];
end


%signal axis represntation for N bit signal  
t1=Tb/nb:Tb/nb:N*Tb; 




subplot(3,1,2);
plot(t1,x_bit,'lineWidth',2);grid on;
axis([ 0 Tb*N -1.5 1.5]);
ylabel('Amplitude(volt)');
xlabel(' Time(sec)');
title('Conversion of Digital signal to Polar signal');




% *********************** QAM Modulation ****************************


Ac1=10; % Amplitude of carrier signal-1
Ac2=1; % Amplitude of carrier signal-2

mc=5; % NQUIST CRITERION -->fc>>fs fc=mc*fs fs=1/Tb

fc=mc*(1/Tb); % carrier frequency for bit 1

fi1=0; % carrier phase for bit 1
fi2=pi; % carrier phase for bit 0

t2=Tb/nb:Tb/nb:Tb;                 

%declarre array to hold modulated signal
%declare array to keep/plot the constellation diagram
x_mod=[];
x_constellation=[];

%representation of our signal amplitude and phase respectively
% 11->Ac2,0    10->Ac1,0   % 00->Ac1,180   01->Ac2,180 

for (i=1:2:N-1)
    if (x_inp(i)==1)
        if(x_inp(i+1)==0)
            x_mod0=Ac1*cos(2*pi*fc*t2+fi1);
            x_const_app=sqrt(Ac1);
        else
            x_mod0=Ac2*cos(2*pi*fc*t2+fi1);%modulation signal with carrier signal 1 
            x_const_app=sqrt(Ac2);
        end
    else
        if(x_inp(i+1)==0)
            x_mod0=Ac1*cos(2*pi*fc*t2+fi2);
            x_const_app=-sqrt(Ac1);
        else
            x_mod0=Ac2*cos(2*pi*fc*t2+fi2);
            x_const_app=-sqrt(Ac2);
        end%modulation signal with carrier signal 2
    end
    x_mod=[x_mod x_mod0];
    x_constellation=[x_constellation x_const_app];
end

%the time index for the modulated signal changes
%for 4 qam 2bits is sampled per cycle
t3=Tb/nb:Tb/nb:Tb*(N/2);


subplot(3,1,3);
plot(t3,x_mod);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('QAM MODULATED INPUT SIGNAL ');
grid on;


%---------------------------------------------------------------------


% ********************* Transmitted signal x ******************************
x_transmitted=x_mod;

% ********************* Channel noise addition*****************************
noise_value=100;

% ********************* Received signal y *********************************
y_rec=awgn(x_transmitted,noise_value);

% ********************* Define QAM Demodulation **************************




%inip is lower limit for product integration of two signals
iniup=1;


n1=0:(0.1/nb):Tb*(N/2);

%array to store in demodulated waveform
y_dem=[];
for i=1:1:(N/2)
  t=Tb/nb:Tb/nb:Tb; 
  
   % carrier siignal/ oscillator signal which was used in modulator
   %carrier signal frequency should be the same as that of modulator
  
   
   c1=cos(2*pi*fc*t);% demodulator osillator signal
 
  y_dem01=c1(1:nb).*y_rec(iniup:(i*nb));
  iniup=(i*nb)+1;
  
  t4=Tb/nb:Tb/nb:Tb;
  
  %trapz is the matlab command for integration
  % trapz takes in the parameters as limits and signal
  z1=trapz(t4,y_dem01);
  
  
  %rounds of to nearest integer value
  A_dem1=round((2*z1/Tb));
   
  
   if(A_dem1==Ac1)
       x1=[1 0];
   elseif(A_dem1==(-Ac1))
       x1=[0 0];
   elseif(A_dem1==(-Ac2))
       x1=[0 1];
   else
       x1=[1 1];
   end
  y_dem=[y_dem x1];
end

x_out=y_dem;

xx_bit=[];
for n=1:length(x_out);
    if x_out(n)==1;
       xx_bitt=ones(1,nb);
    else x_out(n)==0;
        xx_bitt=-ones(1,nb);
    end
     xx_bit=[xx_bit xx_bitt];
end
t4=Tb/nb:Tb/nb:nb*length(x_out)*(Tb/nb);



%*******plotting for noise recieved signal*****************
lent=(length(x_out)-N/2)
f2=figure(2);
set(f2,'color',[1 1 1]);
subplot(3,1,1);
plot(t3,y_rec,'LineWidth',2);grid on;
ylabel('Amplitude(volt)');
xlabel(' Time(sec)');
title('THE SIGNAL RECIEVED AFTER NOISE THROUGH CHANNEL');


%********plotting for demodulated signal after channel**********
subplot(3,1,2);
plot(t4,xx_bit,'LineWidth',2);grid on;
axis( [0 Tb*length(x_out) -1.5 1.5]);
ylabel('Amplitude(volt)');
xlabel(' Time(sec)');
title('OUTPUT DEMODULATED SIGNAL  ');

%********plotting obtained signal in discrete pattern**********

subplot(3,1,3);
stem(time_axis,y_dem);
axis( [0 N 0 1.5]);
ylabel('Amplitude(volt)');
xlabel(' Time(sec)');
title('OUTPUT DEMODULATED SIGNAL IN DISCRETE OBTAINED FORM');




%----------------------------------------------------------------
%Code For Constellation Diagram at the reciever


%now we plot the constellation diagram on where the signal might occur
scatterplot(x_constellation,[],[],'g*',[])
grid on;
figure(3);


%------------------------------------------------------------------
%Code For Constellation Diagram at After adittion of AWGN Noise
c = x_constellation;


sigpower = pow2db(mean(abs(c).^2));
M = length(c);

%random value for generation of noise power
data = randi([0 M-1],2000,1);

%genqadammod basically adds noise signal to our transmitted signal
modData = genqammod(data,c);
rxSig = awgn(modData,20,sigpower);

%plotting noise effected 
h = scatterplot(rxSig);
hold on
%c is used to compare the effected noise with the actual noise
scatterplot(c,[],[],'r*',h)
grid
hold off
end