function H = landmark2hash(L,S)
if nargin < 2
  S = 0;
end
if length(S) == 1
  S = repmat(S, size(L,1), 1);
end

H = uint32(L(:,1));
F1 = rem(round(L(:,2)-1),2^8);
DF = round(L(:,3)-L(:,2));
if DF < 0
  DF = DF + 2^8;
end
DF = rem(DF,2^6);
DT = rem(abs(round(L(:,4))), 2^6);
H = [S,H,uint32(F1*(2^12)+DF*(2^6)+DT)];