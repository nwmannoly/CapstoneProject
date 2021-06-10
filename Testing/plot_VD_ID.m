function [] = plot_VD_ID(vD,iD)

    figure(1)
    hold on
    i=1;j=21;
    
    %Each line is individually plotted to allow for a proper legend
    plot(vD(i:j),iD(i:j),'DisplayName','VG=-45V');
    plot(vD(i+j:j*2),iD(i+j:j*2),'DisplayName','VG=-40V');
    plot(vD(i+j*2:j*3),iD(i+j*2:j*3),'DisplayName','VG=-35V');
    plot(vD(i+j*3:j*4),iD(i+j*3:j*4),'DisplayName','VG=-30V');
    plot(vD(i+j*4:j*5),iD(i+j*4:j*5),'DisplayName','VG=-25V');
    plot(vD(i+j*5:j*6),iD(i+j*5:j*6),'DisplayName','VG=-20V');
    plot(vD(i+j*6:j*7),iD(i+j*6:j*7),'DisplayName','VG=-15V');
    plot(vD(i+j*7:j*8),iD(i+j*7:j*8),'DisplayName','VG=-10V');
    plot(vD(i+j*8:j*9),iD(i+j*8:j*9),'DisplayName','VG=-5V');
    plot(vD(i+j*9:j*10),iD(i+j*9:j*10),'DisplayName','VG=0V');
    plot(vD(i+j*10:j*11),iD(i+j*10:j*11),'DisplayName','VG=5V');
    plot(vD(i+j*11:j*12),iD(i+j*11:j*12),'DisplayName','VG=10V');
    plot(vD(i+j*12:j*13),iD(i+j*12:j*13),'DisplayName','VG=15V');
    plot(vD(i+j*13:j*14),iD(i+j*13:j*14),'DisplayName','VG=20V');
    plot(vD(i+j*14:j*15),iD(i+j*14:j*15),'DisplayName','VG=25V');
    plot(vD(i+j*15:j*16),iD(i+j*15:j*16),'DisplayName','VG=30V');
    plot(vD(i+j*16:j*17),iD(i+j*16:j*17),'DisplayName','VG=35V');
    plot(vD(i+j*17:j*18),iD(i+j*17:j*18),'DisplayName','VG=40V');
    plot(vD(i+j*18:j*19),iD(i+j*18:j*19),'DisplayName','VG=45V');

    %Change the font size for better viewing
    set(gca,'FontSize',14);
    
    grid on;
    xlabel("Drain-Source Voltage in gFET Device [V]")
    ylabel("Drain-Source Current in gFET Device [A]")
    title("VD-ID gFET Device Data for VG Sweep");
    legend;
    hold off;

end

