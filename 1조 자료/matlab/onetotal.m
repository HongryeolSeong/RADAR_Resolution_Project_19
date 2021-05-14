r = csvread('rbtwo.csv',1,0); %csv���� ���� ����
f = r(:,1); %�����Ӽ��� ���� ����
x = r(:,4); %x��ǥ ���� ����
Tx = round(x,1); %x��ǥ �Ҽ��� ù°�ڸ����� �ݿø�
y = r(:,5); %y��ǥ ���� ����
Ty = round(y,1); %y��ǥ �Ҽ��� ù°�ڸ����� �ݿø�
int = r(:,9); %���� ���� ����

tot = [f Tx Ty int]; %�ð�ȭ �� ���� ���

%%%% Intensity�� 20db������ ��� �ش� ���� �߶�
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