function [] = plot_Dirac(fileData)

vD=fileData(1:end,2);
arrayLengthHolder=length(unique(vD));
vSD=zeros(arrayLengthHolder,1);
iSD=zeros(arrayLengthHolder,1);

%Holds all indices where the vSD is 100mV
vSD_Locations=find(vD==0.1000);
vSD=vD(vSD_Locations);
iSD=fileData(vSD_Locations,3);

rSD=vSD./iSD;

vG=fileData(vSD_Locations,4);

figure(1);
%Attempt to lower tolerances as we are using low values; trying to get fit
options.StepTolerance = 1e-20;
options.FunctionTolerance = 1e-20;
options.OptimalityTolerance = 1e-20;
lorentzfit(vG,rSD);
%Lorentzfit does not want to work as it sets the default option values and
%does not appear to allow for overwrite. We are using far too values and
%far too low in magnitude values I presume..

figure(2);
slm = slmengine(vG,rSD,'increas','on','plot','on','knots',vG);

figure(3);
plot(vG,rSD);

%Change the font size for better viewing
set(gca,'FontSize',14);
    
xlabel("Gate Voltage [V]")
ylabel("Resistance [Ohms]")
title("Source-Drain Resistance versus Gate Voltage");

end