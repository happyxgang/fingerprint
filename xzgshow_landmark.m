function [out] = xzgshow_landmark(D, L)

if nargin < 4
  T = [];
end
if nargin < 5
  C = 'o-r';
end
if nargin < 2


%    D = csvread('/home/kevin/Desktop/spectrum');
%    D = D';
%    L = csvread('/home/kevin/Desktop/landmarks');
%    L = L-1;
   D_origin = wavread('/home/kevin/Documents/34_origin.wav');
   L_origin = find_landmarks(D_origin,8000);
   
   D = wavread('/home/kevin/Documents/record/34-20record.wav');
   L = find_landmarks(D,8000);
   
   D2 = wavread('/home/kevin/Documents/record/34-70record.wav');
   L2 = find_landmarks(D2,8000);
end

targetSR = 8000;

fft_ms = 64;
nfft = round(targetSR/1000*fft_ms);

win_overlap = 2;

my_win_overlap = 4;

fbase = targetSR/nfft;
tbase = fft_ms/win_overlap/1000;
my_tbase = fft_ms/my_win_overlap/1000;

% S = D;

S=abs(xzgspecgram(D,nfft,targetSR,nfft,256));
S2=abs(xzgspecgram(D2,nfft,targetSR,nfft,256));

if length(D) > 0
   
  [nr,nc] = size(S);
  tt = [1:nc]*my_tbase;
  ff = [0:nr-1]*fbase;
subplot(2,1,1),
   imagesc(tt,ff,20*log10(S));
 axis xy
  ca = caxis;
  caxis([-80 0]+ca(2));

end
  
hold on
L = xzg_get_same_hash(L_origin, L);
for i = 1:size(L,1);
  lrow = L(i,:);
  t1q = lrow(1);
  f1q = lrow(2);
  f2q = lrow(3);
  dtq = lrow(4);
  t2q = t1q+dtq;
  t1 = t1q*tbase/2;
  t2 = t2q*tbase/2;
  f1 = f1q*fbase;
  f2 = f2q*fbase;
  plot([t1 t2],[f1 f2],C);

end
hold off



if length(D) > 0
   
  [nr,nc] = size(S2);
  tt = [1:nc]*my_tbase;
  ff = [0:nr-1]*fbase;

 subplot(2,1,2),
  imagesc(tt,ff,20*log10(S2));
  axis xy
  ca = caxis;
  caxis([-80 0]+ca(2));
end
  
hold on
L2 = xzg_get_same_hash(L_origin,L2);
for i = 1:size(L2,1);
  lrow = L2(i,:);
  t1q = lrow(1);
  f1q = lrow(2);
  f2q = lrow(3);
  dtq = lrow(4);
  t2q = t1q+dtq;
  t1 = t1q*tbase/2;
  t2 = t2q*tbase/2;
  f1 = f1q*fbase;
  f2 = f2q*fbase;
  plot([t1 t2],[f1 f2],C);
 
end



start_of_l2 = 1;
same_landmark = [];


% for index1 =1:size(L,1);
%     lm1 = L(index1,:);
%     for index2 = start_of_l2:size(L2,1);
%         lm2 = L2(index2,:);
%         if (lm1(1)<lm2(1))
%             continue;
%         elseif (lm1(1)<=lm2(1))
%             start_of_l2 = index2;
%             break;
%         else
%             lm_sub=lm1-lm2;
%             if(min(lm_sub)==1&&max(lm_sub)==1)
%                 same_landmark = [ same_landmark lm1];
%             end
%         end
%     end
% end

% for index1 = 1:size(L,1);
%     lm1 = L(index1,:);
%     for index2 = 1:size(L2,1);
%         lm2 = L2(index2,:);
%         lm_sub=lm1-lm2;
%         if(min(lm_sub)==1&&max(lm_sub)==1)
%             same_landmark=[same_landmark lm1];
%         end
%     end
% end
% 
% same_landmark = vec2mat(same_landmark,4);
% 
% for i = 1:size(same_landmark,1);
%   lrow = same_landmark(i,:);
%   t1q = lrow(1);
%   f1q = lrow(2);
%   f2q = lrow(3);
%   dtq = lrow(4);
%   t2q = t1q+dtq;
%   t1 = t1q*tbase;
%   t2 = t2q*tbase;
%   f1 = f1q*fbase;
%   f2 = f2q*fbase;
%   plot([t1 t2],[f1 f2],C);
% end

hold off

% if length(T) == 2
%   a = axis;
%   axis([T(1) T(2) a(3) a(4)]);
% end