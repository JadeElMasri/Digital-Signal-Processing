Wp = 50/100;%fs/20
Ws = 60/100;
Rp = 1;
Rs = 40;
[n,Wn] = ellipord(Wp,Ws,Rp,Rs); %This provides us with the order of the filter n and cutoff frequencies 
[b,a] = ellip(n,Rp,Rs,Wp,"low"); %Gets the numerator and the denominator of the transfer function
[h,w] = freqz(b,a);


% %Plotting the Magnitude response
figure(1);
[db,mag,pha,grd,w] = freqz_m(b,a);
plot(w/pi,db,'b','linewidth',1.5);
axis([0 1 -50 -5]);
xlabel("Frequency");
ylabel("Magnitude Response");
grid on;

figure(2)
[db,mag,pha,grd,w] = freqz_m(b,a);
plot(w/pi,mag,'b','linewidth',1.5);
axis([0 0.5 0.85 1.05]);
xlabel("Frequency");
ylabel("Magnitude Response");
grid on;


figure(3);
[z,p,k] = ellipap(n,Rp,Rs);
sos = zp2sos(z,p,k);
grpdelay(sos,151);
xlabel("frequency");
ylabel("Group Delay");
grid on;


%Plotting the Impulse Response
figure(4);
impulse_response = impz(b, a, 150); % Generate 150 samples of the impulse response
stem(0:length(impulse_response)-1, impulse_response);
xlabel('Sample');
ylabel('Amplitude');
grid on;


