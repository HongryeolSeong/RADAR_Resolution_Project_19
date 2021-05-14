r = csvread('rbtwo.csv',1,0); %csv파일 변수 지정
f = r(:,1); %프레임순서 변수 지정
x = r(:,4); %x좌표 변수 지정
Tx = round(x,1); %x좌표 소수점 첫째자리까지 반올림
y = r(:,5); %y좌표 변수 지정
Ty = round(y,1); %y좌표 소수점 첫째자리까지 반올림
int = r(:,9); %강도 변수 지정

tot = [f Tx Ty int]; %시각화 할 최종 행렬

%%%% Intensity가 20db이하인 경우 해당 열을 잘라냄
cut = tot(:,4) <15; 
ctot = tot(cut,:);
ctot(:,4) = 0;
tot(cut,:) = [];

tot1 = [tot;ctot];

T = sortrows(tot1,1);




fn = T(:,1);
p = fn(end,1);
Tint = T(:,4);
sortint = sort(Tint);
Maxint = sortint(end,1);

    scatter(T(244:255,2), T(244:255,3), 15,T(244:255,4),'filled'),colorbar;
    
    c = colorbar;
    caxis([0 30])
    c.Label.String = 'Intensity(dB)';
    axis([-5 5 0 3])
    xlabel('X(m)')
    ylabel('Y(m)')