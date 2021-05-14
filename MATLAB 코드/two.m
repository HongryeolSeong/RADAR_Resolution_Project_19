r = csvread('rbtwo.csv',1,0); %지점2의 데이터 불러오기
fr = r(:,1);
xr = r(:,4)+d/2; %최종 관측 시점의 좌표로 변환
Txr = round(xr,1);
yr = r(:,5);
Tyr = round(yr,1);
intr = r(:,9);



l = csvread('lbtwo.csv',1,0); %지점1의 데이터 불러오기
fl = l(:,1);
xl = l(:,4)-d; %최종 관측 시점의 좌표로 변환
Txl = round(xl,1);
yl = l(:,5);
Tyl = round(yl,1);
intl = l(:,9);


gr = [fr Txr Tyr intr];
gl = [fl Txl Tyl intl];
sgr = size(gr);
sgl = size(gl);
srowgr = sgr(1,1);
srowgl = sgl(1,1);

if srowgl > srowgr
    gr(srowgr+1:srowgl,1:4) = 0;
elseif srowgr > srowgl
    gl(srowgl+1:srowgr,1:4) = 0;
end

cd1 = gr(:,1) == gl(:,1);
cd2 = gr(:,2) == gl(:,2);
cd3 = gr(:,3) == gl(:,3);

cdall = cd1 & cd2 & cd3;

gr1 = gr(cdall,:);
gl1 = gl(cdall,:);
gl1(:,4) = gr1(:,4) + gl1(:,4);
gr(cdall,:) = [];
gl(cdall,:) = [];

tot = [gr;gl;gl1]; 

cut = tot(:,4) <16;
ctot = tot(cut,:);
ctot(:,4) = 0;
tot(cut,:) = [];

tot1 = [ctot;tot];

T = sortrows(tot1,1); %위에서 나열한 행렬을 프레임 순서대로(오름차순) 정렬
fn = T(:,1);
st = T(1,1);
en = fn(end,1);
int = T(:,4);
sortint = sort(int);
Maxint = sortint(end,1);


for k = st:en
    f = find(fn==k);
    fi = f(1,1);
    ff = f(end,1);
    scatter(T(fi:ff,2), T(fi:ff,3), 15,T(fi:ff,4),'filled'),colorbar;
    
    c = colorbar;
    caxis([0 32])
    c.Label.String = 'Intensity(dB)';
    axis([-3 3 0 5])
    xlabel('X(m)')
    ylabel('Y(m)')
    pause(0.001)
    hold off;
 
    
end