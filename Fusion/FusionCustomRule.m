%% Function for the proposed image fusion

function c = FusionCustomRule(A,B)
%{
A: Input GPR image
B: Input UEA image
c: Output fused image 
%}

% Defining mean minus plus one standard deviation of images that is described in the
% fusion algorithm
topA = mean2(A) + 1*std2(A);
topB = mean2(B) + 1*std2(B);
btmA = mean2(A) - 1*std2(A);
btmB = mean2(B) - 1*std2(B);

% Defining the 9 cases in fusion algorithm

% Case 1
topAtopB = (A >= topA & B >= topB);

% Case 2
btmAbtmB = (A < btmA & B < btmB);

% Case 3
topAmidB = (A>=topA & B< topB & B>=btmB);

% Case 4
topBmidA = (A<topA & A>=btmA & B>= topB);

% Case 5
btmAmidB = (A<btmA & B>=btmB & B<topB); 

% Case 6
btmBmidA = (A>=btmA & A<topA & B<btmB);

% Case 7
midAmidB = (A<topA & A>= btmA & B<topB & B>=btmB);

% Case 8
topAbtmB = (A > topA & B < btmB);

% Case 9
topBbtmA = (B > topB & A < btmA);


% Applying fusion rules
c = max(A.*topAtopB,B.*topAtopB)+ min(A.*btmAbtmB,B.*btmAbtmB) + A.*topAmidB + (A.*topBmidA+B.*topBmidA)/2 + (btmAmidB.*A+btmAmidB.*B)/2 + btmBmidA.*B+  (A.*midAmidB + B.*midAmidB)/2 + A.*topAbtmB + (B.*topBbtmA +A.*topBbtmA)/2 ;

end