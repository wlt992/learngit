% ����ģ���е���ʽ�����ɱ���
% ��������İ�Word���Դ���ʽ������μ�Ŀ¼�µ�pdf�ĵ�

import mlreportgen.dom.*
%Document.createTemplate('mytemplate.dotx','docx');
d=Document('demo3','docx',fullfile(pwd,'mytemplate'));
open(d);


%% ����
p=Paragraph('�ɼ����浥','Heading 1');
append(d,p);

%% ���ֶ���(doc mlreportgen.dom.Paragraph)
append(d,Heading(2,'һ������ģ��'));
s='�����Ƕ���';
s=repmat(s,[1,30]);
p = Paragraph(s,'mypara1');%�Զ��������ʽ
append(d,p);

%% ��ӿյĶ�����
for i=1:8
    append(d,' ');
end

%% ������
append(d,Heading(2,'�������ģ��'));
t={'����','����','��ѧ','Ӣ��'; ...
    '�ɼ�','70','94','82'; ...
    '�ȼ�','C','A','B'}; 
p=Table(t,'mytable1');% �Զ�������ʽ
append(d,p);

close(d);
rptview(d.OutputPath);