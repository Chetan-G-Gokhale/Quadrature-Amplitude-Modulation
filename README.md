# Quadrature-Amplitude-Modulation
4-Quadrature Amplitude Modulation using Matlab without using inbuilt libraries

<!--ts-->
   * [INTRODUCTION](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation#introduction)
   * [RESULTS](#public)
       * [CASE 1](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation#case-1-odd-length-sequence-signal)
       * [CASE 2](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation#case-2even-sequence-and-lower-sampling-bit-rate)
       * [CASE 3](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation#case-3-even-sequence-and-higher-sampling-bit-rate)
    
 <!--te-->


 # INTRODUCTION
4-QAM (Quadrature Amplitude Modulation) is a digital modulation technique used in communication systems. It combines amplitude and phase modulation to represent digital information. In 4-QAM, four different combinations of amplitude and phase are used to represent binary symbols. Two carrier signals, 90 degrees out of phase, are employed in this scheme.

The symbols in 4-QAM are represented as points on a two-dimensional signal constellation diagram. The I (in-phase) and Q (quadrature) components determine the position of each symbol. These components vary the amplitude and phase of the carrier signals to create the different combinations.

To transmit data, the binary input is divided into pairs and mapped to the closest symbol on the constellation diagram. At the receiver, the received signal is demodulated by identifying the closest symbol and converting it back to binary data.

4-QAM strikes a balance between data rate and spectral efficiency. It offers higher data rates compared to simpler modulation schemes while maintaining reasonable performance. Wireless communication systems like Wi-Fi, cellular networks, and satellite communications commonly utilize 4-QAM for reliable data transmission in noisy environments. Its implementation requires a more complex receiver design due to the increased complexity of the signal constellation. Overall, 4-QAM provides an effective solution for digital communication over various channels.

## TRANSMITTER
The transmitter in a 4-QAM (Quadrature Amplitude Modulation) system is responsible for converting digital data into modulated signals that can be transmitted over a communication channel. It performs several key functions to achieve this conversion.

Firstly, the transmitter receives the digital data to be transmitted. The data is typically in binary form, consisting of 0s and 1s. This data is then divided into pairs of bits, each representing a symbol in the 4-QAM scheme.

Next, the transmitter maps each pair of bits to a specific symbol on the 4-QAM constellation diagram. This mapping assigns specific amplitude and phase values to the I (in-phase) and Q (quadrature) components of the carrier signals. The constellation diagram helps determine the appropriate amplitude and phase for each symbol.

Once the symbols are determined, the transmitter generates the corresponding modulated signals by combining the modulated I and Q components. The modulated signals represent the desired amplitude and phase variations required to transmit the symbols.

The transmitter then performs any necessary upconversion and amplification to prepare the modulated signals for transmission over the channel. Upconversion involves shifting the signal to a higher frequency range suitable for transmission, while amplification ensures the signals have sufficient power for propagation.

Additionally, the transmitter may incorporate error correction coding and modulation techniques to enhance the robustness of the transmitted signals. These techniques help combat channel impairments and improve the overall reliability of the communication system.

In summary, the transmitter in a 4-QAM system converts digital data into modulated signals by mapping symbols onto a constellation diagram and combining the modulated I and Q components. It also handles upconversion, amplification, and may employ error correction coding to optimize the transmission process.
The QAM modulator essentially follows the idea that can be seen from the basic 
QAM theory where there are two carrier signals with a phase shift of 90° between them .<br>

These are then amplitude modulated with the two data streams known as the 
I or In-phase and the Q or quadrature data streams. These are generated in the 
baseband processing area.
The two resultant signals are summed and then processed as required in the RF 
signal chain, 
<br>
<br>
![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/274868a0-af4a-4b77-acab-d221a65f2518)



## RECIEVER

The receiver in a QAM (Quadrature Amplitude Modulation) system is responsible for recovering the transmitted digital data from the received modulated signals. It performs several key functions to achieve this demodulation and decoding process.

Firstly, the receiver receives the modulated signals that have been transmitted over the communication channel. These signals may have undergone distortion, noise, and interference during transmission. The receiver's task is to mitigate these effects and extract the original transmitted data.

The receiver begins by performing downconversion, which involves shifting the received signals to a lower frequency range. This process is necessary to bring the signals back to their original frequency band for further processing.

Next, the receiver separates the received signals into their I (in-phase) and Q (quadrature) components. This is done by employing a quadrature demodulator, which uses the phase and amplitude information of the received signals to extract the I and Q components.

Once the I and Q components are obtained, the receiver performs demodulation by comparing the amplitudes and phases of the components with the symbols on the QAM constellation diagram. The receiver determines the closest symbol to the received values and maps it back to the corresponding digital data.

After demodulation, the receiver may employ error correction decoding techniques to correct any errors that may have occurred during transmission. These techniques use redundancy in the transmitted data to detect and correct errors, improving the overall accuracy of the received data.

Finally, the receiver outputs the recovered digital data in its original binary form, making it available for further processing or utilization.

Overall, the receiver in a QAM system plays a crucial role in demodulating and decoding the received signals, compensating for channel impairments, and recovering the original digital data. Its functions include downconversion, separation of I and Q components, demodulation, error correction decoding, and outputting the recovered data.
<br>
<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/cf6bd969-dbcb-4f54-9ff6-649a2f76f9bb)

# RESULTS

## CASE 1: Odd length Sequence Signal
4-Qam always requires 2^n number of bits as input. As it represents 2bit of input 
with a particular phase and particular amplitude. So if the sequence is odd
One single bit would be able to pair with any other bit for QAM modulation. <br>
Therefore QAM modulation is not possible for odd length signal sequence
<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/79cd1f48-218b-412e-9b8b-607e5a9cffa4)

 <br>



## CASE 2:Even Sequence and lower sampling bit rate

The signal length maybe even ,and constellation diagram are also obtained are 
true but due to lower order bit rate conversion i.e.
While converting it from discrete format to polar format, it leads to loss in 
information of the signal which produces a garbage output in the receiver.
Even Though the signal length is even ,but due to lower order rate conversion of 
Discrete input signal into polar format ,The QAM modulation and demodulation 
is done but there is a loss of message signal.
<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/93cb6add-f230-4ff7-9ec9-adf1cb4c1aa7)

<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/f46f8ac0-512e-4975-a8ed-c1a22ec0970f)

<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/74e81123-3811-48d6-bef8-9617e03dadfd)


<br>




## CASE 3: Even Sequence and higher sampling bit rate

The signal tranmission is possible because the length of the signal is even .
As 4-QAM requires 2^n because it represents 2bits of input with a particular phase 
and particular amplitude
Due to Higher order bit rate the signal conversion is possible to polar format.
Therefore For a Even Length signal and greater order conversion of 
discrete signal into polar signal .4-QAM modulation and demodulation 
has been succesful ,and is verified using the waveforms
<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/5847e5ee-b790-4315-9932-125ce16a5868)


<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/8d4cf4f7-d740-4e6f-af95-643ff37f590c)


<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/e67b044f-e978-4fe2-ac32-1dc6dcd97f0a)


<br>

![image](https://github.com/Chetan-G-Gokhale/Quadrature-Amplitude-Modulation/assets/126239004/f97136a2-1fb7-4fcd-b7c6-11df6f1c2a53)


<br>




