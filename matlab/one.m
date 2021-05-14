r = csvread('rbtwo.csv',1,0); %csv파일 변수 지정
f = r(:,1); %프레임순서 변수 지정
x = r(:,4); %x좌표 변수 지정
Tx = round(x,1); %x좌표 소수점 첫째자리까지 반올림
y = r(:,5); %y좌표 변수 지정
Ty = round(y,1); %y좌표 소수점 첫째자리까지 반올림
int = r(:,9); %강도 변수 지정

tot = [f Tx Ty int]; %시각화 할 최종 행렬

%%%% Intensity가 20db이하인 경우 해당 열을 잘라냄
cut = tot(:,4) <16; 
ctot = tot(cut,:);
ctot(:,4) = 0;
tot(cut,:) = [];

tot1 = [tot;ctot];

T = sortrows(tot1,1);


fn = T(:,1); %행렬T의 프레임 넘버 행렬
st = fn(1,1); %프레임 넘버의 첫번째 넘버
en = fn(end,1); %프레임 넘버의 마지막 넘버
Tint = T(:,4); %행렬T의 강도
sortint = sort(Tint); %강도를 오름차순으로 정렬
Maxint = sortint(end,1); %강도의 Max값


for k = st:en %프레임 순서대로 이미지를 시각화 하기 위한 반복문
    f = find(fn==k);
    fi = f(1,1);
    ff = f(end,1);
        
    scatter(T(fi:ff,2), T(fi:ff,3), 15, T(fi:ff,4),'filled'),colorbar;
    % 행렬 T를 산점도로 시각화
    c = colorbar;
    caxis([0 30]) %강도의 범위
    c.Label.String = 'Intensity(dB)';
    axis([-5 5 0 5]) %좌표 x와 y의 범위
    xlabel('X(m)')
    ylabel('Y(m)')
    pause(0.05)
    hold off;
 % 한 프레임 당 0.05초씩 산점도로 나타난 후 그 다음 프레임 산점도로 넘어가게됨.
    
end