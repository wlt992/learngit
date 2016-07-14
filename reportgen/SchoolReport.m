% SchoolReport.m
% n=ѧ������
% Ϊʹ�ó���ɶ��Լ�ǿ��������Ҫ��ʽ���ɼ���
% 1. ��һ�и�ʽ������������ѧ�ƣ��ܷ�
% 2. ֻ��ѧ���ɼ���û���������ӵ���Ϣ��
% 3. ���ֳɼ�����ȱ���벻Ҫ��������䣬���Կ��Ż�������(ȱ��)��䡣

%% ���ݵ���
filename='�ɼ�.xlsx';
savename='�ɼ���';
[score,textdata]=xlsread(filename);
m=3; %ѧ����
n=size(score,1);% ѧ������
name=textdata(2:n+1,1);
mean_score=mean(score,'omitnan');
max_score=max(score,[],'omitnan');
grade=Gradegen(score); %Gradegen���Զ��庯�������ɸ���ͬѧ�ĵȼ�

%ģ�壬ʵ����Ӧ����score���ȼ���Ӧ����grade
template=cell(5,m+1);
template(1,1:m+1)={'����','����','��ѧ','�ܷ�'};
template(2:5,1)={'ʵ���ɼ�';'ƽ���ɼ�';'��߳ɼ�';'�ȼ�'};

%% ��ؽӿ�
import mlreportgen.dom.*;
d = Document(savename,'docx',fullfile(pwd,'mytemplate'));
open(d);

%% ��ʼ����word�ɼ����б�

% ��ӷָ���
hr = HorizontalRule();
hr.Style={Border('dotdash','blue','2px')};
append(d,hr);
% n��ѧ��������m��ѧ����
for i=1:n
    % �����
    template{1,1}=name{i};
    for jj=2:m+1
        s=score(i,jj-1);
        if isnan(s)
            s='ȱ��';
        else
            s=num2str(s);
        end
        template{2,jj}=s;% �������
        template{3,jj}=sprintf('%4.2f',mean_score(jj-1));%ѧ��ƽ������
        template{4,jj}=num2str(max_score(jj-1));%ѧ����߷���
        template{5,jj}=grade{i,jj-1};% �ȼ�
    end

    q=Table(template,'mytable2'); 
    q.TableEntriesStyle={Width('100'),Height('50')};
    append(d,q);
    append(d,clone(hr));
end
close(d);
rptview(d.OutputPath);