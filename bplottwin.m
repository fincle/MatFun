function [h] = bplottwin(s,varargin)
%bplotdual - Takes a structural vector with standard formate and plots a
%pair of plots (one for each channel datasets plotted for both SA channels under legend entries. Passes
%function handes to calling function through array. Auto skips ch2 if not
%there.
%
% Syntax:  function_name(struc)
%
% Inputs:
%    struc - structured array with following elements
%
%                 f: [800�1 double]
%               ch1: [800�1 double]
%               ch2: [800�1 double]
%         PlotTitle: 'Plot all title'
%          Ch1Title: 'channelOneTitle'
%          Ch2Title: 'ChannelTwoTitle'
%        xaxisLabel: 'xaxislabel'
%     yaxisLabelCh1: 'yaxislabelCh1'
%     yaxisLabelCh2: 'yaxislabelCh2'
%         legendch1: 'annotation1'
%         legendch2: 'anotation2'
%           comment: 'comment'
%         fStitched: [800�1 double]
%       ch1Stitched: [800�1 double]
%       ch2Stitched: [800�1 double]
%
% Outputs:
%    h list - returns figure handles
%
% Example: 
%    load a structured array using import2struct.m then run
%    bplottwin(struc)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: import2struct.m

% Author: Andrew Wade
% Work address: West-bridge Caltech
% email: awade@ligo.caltech.edu
% Website: 
% Created: 20170123; Last revision: 20170123

%------------- BEGIN CODE --------------

%% Parsing optional starting number for figures
if length(varargin)>1
    error('Error, too many input argument or wrong type. \nType help bplotdual for usage')
elseif length(varargin)==1
    startFigNum = varargin{1};
else
    startFigNum = 1;
end



%Standard two pannel plot displaying one set of data (for each channel for
%each plot
for n = 1:length(s.MetaList)
    h{n} = figure(startFigNum + 2*(n-1));
    plot(s.(char(s.MetaList(n))).fStitched,s.(char(s.MetaList(n))).ch1Stitched)
    ax = gca; % Returns handle of the curret axes for the current figure
    ax.GridLineStyle = '-'; % Sets grid lines to solid instead of defult dotted
    ax.MinorGridLineStyle = '-'; % Sets minor grid lines to solid instead of defult dotted
    ax.XScale = 'log'; %Sets axis type to 'log'
    ax.YScale = 'log';
    ax.FontSize = 14; % Set the font size to something readable
    % % ax.YLim = [-170,-80]; % Set y-axis limits
    ax.XLim = [min(min(s.(char(s.MetaList(n))).fStitched)),max(max(s.(char(s.MetaList(n))).fStitched))];
    title(s.(char(s.MetaList(n))).Ch1Title)
    xlabel(s.(char(s.MetaList(n))).xaxisLabel)
    ylabel(s.(char(s.MetaList(n))).yaxisLabelCh1)
    legend(s.(char(s.MetaList(n))).legendch1)
    grid on
    hold off
    
    if isfield(s.(s.MetaList{n}),'ch2') %Skips plotting second channel if isn't there
        figure(startFigNum + 1 + 2*(n-1))
        plot(s.(char(s.MetaList(n))).fStitched,s.(char(s.MetaList(n))).ch2Stitched)
        ax = gca; % Returns handle of the curret axes for the current figure
        ax.GridLineStyle = '-'; % Sets grid lines to solid instead of defult dotted
        ax.MinorGridLineStyle = '-'; % Sets minor grid lines to solid instead of defult dotted
        ax.XScale = 'log'; %Sets axis type to 'log'
        ax.YScale = 'log';
        ax.FontSize = 14; % Set the font size to something readable
        % % ax.YLim = [-170,-80]; % Set y-axis limits
        ax.XLim = [min(min(s.(char(s.MetaList(n))).fStitched)),max(max(s.(char(s.MetaList(n))).fStitched))];
        title(s.(char(s.MetaList(n))).Ch2Title)
        xlabel(s.(char(s.MetaList(n))).xaxisLabel)
        ylabel(s.(char(s.MetaList(n))).yaxisLabelCh1)
        legend(s.(char(s.MetaList(n))).legendch2)
        grid on
        hold off
    end
end


%------------- END OF CODE --------------
%Please send suggestions/questions to address at top of script

end