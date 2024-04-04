function T = trans_od_s(f,RS,CP,CS,CX,RX)
%funkcja oblicza kształt modułu transmitancji modelu pomiarowego
% dla czestotliwosci f[Hz], RS,RX w kiloomach, CP, CS, CX0 w pikofaradach
s = complex(0,2*pi*f); % liczba zespolona !!!!!!!
A= RS*1e3;
B= s*CP*1e-12;
C= s*CS*1e-12;
D= s*CX*1e-12; % ten parametr może być wektorem tzn. Cx=Cx0*[wektor eps_kal]
E= RX*1e3;
T = (1./(1./A+B+1./(1./C+1./(D+1./E)))); % działania na liczbach zespolonych i wektorowych
T = abs(T); % wynik – wartość bezwzględna

