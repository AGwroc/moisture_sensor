    figure(1)
    hold off;
    tlf_eps_rx = trans_od_s(lf,RS,CP,CS,CX0*eps_zakres,RX)/tlf_kal;
    thf_eps_rx = trans_od_s(hf,RS,CP,CS,CX0*eps_zakres,RX)/thf_kal;
    plot(eps_zakres,tlf_eps_rx,'.',eps_zakres,thf_eps_rx,'--',EPS,pom_lf,'x',EPS,pom_hf,'*');
    hold on;
    thf_eps = trans_od_s(hf,RS,CP,CS,CX0*eps_zakres,1e5)/thf_kal;
    tlf_eps = trans_od_s( lf,RS,CP,CS,CX0*eps_zakres,1e5)/tlf_kal;
    plot(eps_kal,thf,'o',eps_zakres,thf_eps,'-.',eps_kal,tlf,'s',eps_zakres,tlf_eps,'-.');
    grid on;

