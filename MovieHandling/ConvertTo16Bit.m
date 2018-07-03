function [IMG,varargout]=ConvertTo16Bit(IMGs,varargin)

if nargin==1
    Ma=max(max(IMGs));
    Mi=min(min(IMGs));
else
    Mi=varargin{1};
    Ma=varargin{2};
end
IMG=uint16((IMGs-Mi)/(Ma-Mi)*32767);
varargout{1}=Mi;
varargout{2}=Ma;