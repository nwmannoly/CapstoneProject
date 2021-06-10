function [] = dataExtraction(~)
%The function launches a file selection screen able to read in any text
%based file generated with the HP 4155 using TAB delimiters.
%No required inputs
%Outputs VD/ID plots relative to the Gate Voltage
%Will output resistance and dirac points
dataBeginsOnRow=4;

%Small catch incase user selects cancel by mistake
for i=(1:1:2)
    fID=uigetfile('.txt');
    if (fID~=0)
        break;
    end
end

%Small check to see if we are doing breakdown voltages. Implemented this so
%we can still use the base code as the extraction is essentially the same
%for any tab delimited file from the HP4155
dialog=questdlg('Is this a breakdown voltage sweep?', ...
    'Yes','No');

%Ends script if cancel is hit twice in succession
if fID==0
    fprintf("\nYou have not selected a file after being prompted twice. Goodbye!\n");
    return;
end

%At this point the first 4 rows of the read in data is merely the header of
%the file contents, so it can be ignored for data extractoin
try
    fileData = dlmread(fID,"\t", dataBeginsOnRow, 0);
catch
    fprintf("\nFile is formatted by starting data on offset row, attempting again using offset..\n");
    dataBeginsOnRow=5;
    fileData = dlmread(fID,"\t", dataBeginsOnRow, 0);
end

% if(dialog=='No')
%     %Some sample number manipulation to have the gate voltage relative to each
%     %column
    columnModifier=ceil((fileData(1:end,1)/21))-10;
    vGate=5*(columnModifier);
    fileData(1:end,4)=vGate;
    
    vD=fileData(1:end,2);
    iD=fileData(1:end,3);
    vG=fileData(1:end,4);
    
    set(gca,'FontSize',32);
    
    plot_VD_ID(vD,iD);
%     plot_Dirac(fileData);
%     
% else
%    vS=fileData(1:end,2);
%    iS=fileData(1:end,3);
%    plot_IV_curve(vS,iS);
%end


%fprintf("\nRelative Dirac for the imported data is: %f \n",diracPoint);

end