eps_kal = [1 3 20 32 40 80];%epsilony dla ktrych kalibrujemy
pom_lf_kal = [0.5964    0.5942  0.5869 0.584    0.5836 0.5805];%napiecia det 17MHz 
pom_hf_kal = [0.5187    0.485   0.3704 0.3448   0.3337 0.3103];%napiecia det 166MHz
lf = 17e6; %czestotliwosc w Hz
hf = 166e6;
%normowanie wyników - 1dla powietrza eps=1
tlf = pom_lf_kal/pom_lf_kal(1);%otrzymujemy wektor jak pom_lf_kal z „1” na pierwszym miejscu
thf = pom_hf_kal/pom_hf_kal(1);
%obliczenia - szukamy najmniejszej odleg³oœci punktów pomiarowych od funkcji transmitancji
% dla czterech parametrów tzn. Rs, Cp, Cs i Cx0
sqmax=10;
eps_zakres = (1:85);%zakres epsilona poszukiwania rozwiazania
for rs=0.120:0.001:0.126; %Rs wyra¿one w KOhm
    for cp=6.5:0.1:12; %wszystkie pojemnoœci wyra¿one w pF
        for cs=10:0.1:20;
            for cx0=0.5:0.01:1.0; 
                dtlf = trans_od_s(lf,rs,cp,cs,cx0*eps_kal,1e5);
                dtlf = dtlf/dtlf(1); %normalizacja transmitancji dla 17MHz
                dtlf = tlf - dtlf;
                dthf = trans_od_s(hf,rs,cp,cs,cx0*eps_kal,1e5);
                dthf = dthf/dthf(1); %normalizacja transmitancji dla 166MHz
                dthf = thf - dthf;
 sq = sum(dtlf.*dtlf) + sum(dthf.*dthf); %suma kw. odleg³oœci transmitancji i 
                    			    %pomiarów – znormalizowanych do 1 dla 
    %eps=1
                if sq<sqmax
                    sqmax = sq;
                    CP = cp;
                    CS = cs;
                    CX0 = cx0;
                    RS = rs;
                end
            end
        end
    end
end

