pom_lf = 0.5619;    %pomiar dla 17MHz
pom_hf = 0.3405;     %pomiar dla 166MHz.

%obliczennia
pom_lf = pom_lf/pom_lf_kal(1);%normowanie pomiaru do 1 dla eps=1 (powietrza)
pom_hf = pom_hf/pom_hf_kal(1);
tlf_kal = trans_od_s(17e6,RS,CP,CS,CX0,1e5);%transmitancja dla powietrza 
%służąca do normalizacji
thf_kal = trans_od_s(166e6,RS,CP,CS,CX0,1e5);
sqmax = 10;
    for ep=1:1:max(eps_zakres);%petla poszukujaca epsilon
        for sig_dS_na_m = 0.001:0.01:10.0;%zakres konduktancji [dS/m] poszukiwania rozwiazania
                rx = 10*(8.85/CX0)/(sig_dS_na_m*1e3);%przelicznik z EC na RX
                dtlf = trans_od_s(lf,RS,CP,CS,CX0*ep,rx)/tlf_kal;
                dtlf = pom_lf - dtlf;
                dthf = trans_od_s(hf,RS,CP,CS,CX0*ep,rx)/thf_kal;
                dthf = pom_hf - dthf;
                sq = dtlf*dtlf + dthf*dthf; %suma kw. Odległości transmitancji 
%od punktów pomiarowych
                if sq<sqmax
                    sqmax = sq;
                    RX = rx;
                    SIG_dS_m = 10*(8.85/CX0)/(rx*1e3);%wyniki
                    SIG_uS_cm = 1e4*(8.85/CX0)/(rx*1e3);%wyniki
                    EPS = ep;%wyniki
                end
        end
    end

