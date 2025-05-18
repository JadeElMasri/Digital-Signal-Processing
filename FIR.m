fs=200;% sampling frequency
fp=(100/200);%passband frequency
fst=(120/200);%stopband frequency
As=40;%stopband ripple
Rp= 1;%passband ripple
[d1,d2] = db2delta(Rp,As)%converting to absolute specs
%FIR Filter Design
[n,fo,ao,weight] = firpmord([fp,fst],[1,0],[d1,d2]);
b = firpm(n,fo,ao,weight);
 [db,mag,pha,grd,w]=freqz_m(b,[1]);

figure(1);
plot(w/pi, db,'b','linewidth',1.5);
xlabel("Frequency");
ylabel("Magnitude Response From -50db to -5db");
axis([0 1 -50 -5]);
grid on;

figure(2);
plot(w/pi, mag,'b','linewidth',1.5);
xlabel("Frequency");
ylabel("Magnitude Response From 0.85 to 1.05");
axis([0 0.5  0.85 1.05]);
grid on;


figure(3);
plot(w/pi, grd,'b','linewidth',1.5);
title('Group Delay','fontsize',10);
 xlabel("Frequency");
 ylabel("Group Delay");
axis([0 1 0 150]);
grid on;


figure(4);
impulse_response = impz(b, [1], 150); % Generate 150 samples of the impulse response
stem(0:length(impulse_response)-1, impulse_response);
xlabel('Sample');
ylabel('Amplitude');
grid on;


