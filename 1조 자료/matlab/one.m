r = csvread('rbtwo.csv',1,0); %csv���� ���� ����
f = r(:,1); %�����Ӽ��� ���� ����
x = r(:,4); %x��ǥ ���� ����
Tx = round(x,1); %x��ǥ �Ҽ��� ù°�ڸ����� �ݿø�
y = r(:,5); %y��ǥ ���� ����
Ty = round(y,1); %y��ǥ �Ҽ��� ù°�ڸ����� �ݿø�
int = r(:,9); %���� ���� ����

tot = [f Tx Ty int]; %�ð�ȭ �� ���� ���

%%%% Intensity�� 20db������ ��� �ش� ���� �߶�
cut = tot(:,4) <16; 
ctot = tot(cut,:);
ctot(:,4) = 0;
tot(cut,:) = [];

tot1 = [tot;ctot];

T = sortrows(tot1,1);


fn = T(:,1); %���T�� ������ �ѹ� ���
st = fn(1,1); %������ �ѹ��� ù��° �ѹ�
en = fn(end,1); %������ �ѹ��� ������ �ѹ�
Tint = T(:,4); %���T�� ����
sortint = sort(Tint); %������ ������������ ����
Maxint = sortint(end,1); %������ Max��


for k = st:en %������ ������� �̹����� �ð�ȭ �ϱ� ���� �ݺ���
    f = find(fn==k);
    fi = f(1,1);
    ff = f(end,1);
        
    scatter(T(fi:ff,2), T(fi:ff,3), 15, T(fi:ff,4),'filled'),colorbar;
    % ��� T�� �������� �ð�ȭ
    c = colorbar;
    caxis([0 30]) %������ ����
    c.Label.String = 'Intensity(dB)';
    axis([-5 5 0 5]) %��ǥ x�� y�� ����
    xlabel('X(m)')
    ylabel('Y(m)')
    pause(0.05)
    hold off;
 % �� ������ �� 0.05�ʾ� �������� ��Ÿ�� �� �� ���� ������ �������� �Ѿ�Ե�.
    
end