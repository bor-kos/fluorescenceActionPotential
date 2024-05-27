function [outParam,indVector,valueVector,anomaly] = manualPeakFluoSignal(RF,responseThreshold,timeStep,IFP,IMP)

% This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <https://www.gnu.org/licenses/>.

%   [NoPeaks,MPPT,MR,TTFP,T25,T50,T75,T90,IndVector,anomaly] = parametrizeFluoSignal(RF,responseThreshold,diffResponseThreshold,timeStep,IFP)
%   Detailed explanation goes here
% if nargin<5
%     IFP=10;
% elseif nargin<4
%     IFP=10;
%     timeStep=36;
% end
% NoPeaks=1;
MPPT=nan(1);
MR=nan(1);
TTFP=nan(1);
T25=nan(1);
T50=nan(1);
T75=nan(1);
T90=nan(1);
indVector=nan(1,5);
valueVector=nan(1,5);
outParam=nan(1,8);


timeVector=-(IFP-1)*timeStep:timeStep:(numel(RF)-10)*timeStep;
MR=min(RF)-1;
anomaly=find(RF>1+responseThreshold); % We shouldn't have signal going into positive too much
if not(isempty(anomaly))
%     disp(anomaly)
    timeVector(anomaly)=[];
    RF(anomaly)=[];
end

locs=IMP;
pks=-RF(IMP);



NoPeaks=numel(pks);
MR=1-min(RF);
TTFP=timeVector(locs(1));
if numel(pks)>1
    mppt=timeVector(locs(end))-timeVector(locs(1));
    MPPT=mppt/numel(pks);
end
% TMaxChange=zeros(numel(DataStruct),1);
% First peak size
valueVector(1)=-pks(1);
FPS=1+pks(1);
I25=locs(1)+find(RF(locs(1):end)>=-pks(1)+FPS*0.25,1,'first')-1;
I50=locs(1)+find(RF(locs(1):end)>=-pks(1)+FPS*0.5,1,'first')-1;
I75=locs(1)+find(RF(locs(1):end)>=-pks(1)+FPS*0.75,1,'first')-1;
I90=locs(1)+find(RF(locs(1):end)>=-pks(1)+FPS*0.9,1,'first')-1;
indVector(1)=locs(1);
if not(isempty(I25))
    T25=timeVector(I25)-timeVector(locs(1));
    indVector(2)=I25;
    valueVector(2)=-pks(1)+FPS*0.25;
end
if not(isempty(I50))
    T50=timeVector(I50)-timeVector(locs(1));
    indVector(3)=I50;
    valueVector(3)=-pks(1)+FPS*0.5;
end
if not(isempty(I75))
    T75=timeVector(I75)-timeVector(locs(1));
    indVector(4)=I75;
    valueVector(4)=-pks(1)+FPS*0.75;
end
if not(isempty(I90))
    T90=timeVector(I90)-timeVector(locs(1));
    indVector(5)=I90;
    valueVector(5)=-pks(1)+FPS*0.90;
end

outParam=[NoPeaks,MPPT,MR,TTFP,T25,T50,T75,T90];


end

