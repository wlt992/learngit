% demo2.m
import mlreportgen.dom.*;
d=Document('demo2','docx');
open(d);

%% ҳ������
s = d.CurrentDOCXSection;
s.PageSize.Orientation  ='landscape'; % portrait(default)
s.PageSize.Height = '8.5in';
s.PageSize.Width = '11in';
s.PageMargins.Left = '3.0cm';
s.PageMargins.Right = '3.0cm';
s.PageMargins.Top = '2.5cm';
s.PageMargins.Bottom = '2.5cm';
% ����������ʽ����
heiti=FontFamily;
heiti.FamilyName='Arial';
heiti.EastAsiaFamilyName='����';
songti=FontFamily;
songti.FamilyName='Arial';
songti.EastAsiaFamilyName='����';

%% ����
p=Heading(1,'Matlab �Զ�������ģ��');% һ������
%p.Color='red';
%p.HAlign='center';
p.Style={heiti,Color('red'),HAlign('center')};
append(d,p);

%% ����
append(d,Heading(2,'һ������ģ��'));
s='�����Ƕ��䡣';
s=repmat(s,[1,12]);
p = Paragraph(s);
% ����������ʽ�Զ���
p.Style={songti,Color('blue'),...
    LineSpacing(1.5),...
    OuterMargin('10pt','0pt','0pt','10pt')};
p1=Text('�»��ߡ�');%ͬ������.
p1.Underline='single';
p1.Color='red';
append(p,p1);
append(p,s);
p2=ExternalLink('http://github.com/gasongjian/', '������');
append(p,p2);
p.FontSize='14pt';
p.FirstLineIndent='28pt';%���������2���ַ���С
append(d,p);

%% ���ױ��
append(d,Heading(2,'�����򵥱��'));
t={'־��','����','��ѧ','Ӣ��'; ...
    '�ɼ�','70','98','89'; ...
    '�ȼ�','B','A','A'};
p=Table(t);

% ��ʽ����Ԫ���еĶ���
for ii=1:p.NRows
    for jj=1:p.NCols
        t=entry(p,ii,jj);
         t.Children(1).Style={songti,...
            Color('green'),...
            FontSize('12pt'),...
            LineSpacing(1.0),...
            OuterMargin('0pt','0pt','0pt','0pt')};
    end
end

p.Style = {Border('single','blue','3px'), ...
               ColSep('single','blue','1px'), ...
               RowSep('single','blue','1px')};

p.Width = '50%';
p.HAlign='center';% ���ж���
p.TableEntriesHAlign='center';
p.TableEntriesVAlign='middle';
append(d,p);

%% ���ӱ��
append(d,Heading(2,'�������ӱ��'));
q = Table(5);
q.Border = 'single';
q.ColSep = 'single';
q.RowSep = 'single';

row = TableRow;
te = TableEntry('�㷨����');
te.RowSpan = 2;
append(row, te);

te = TableEntry('��һ��');
te.ColSpan = 2;
%te.Border = 'single';
append(row, te);
te = TableEntry('�ڶ���');
te.ColSpan = 2;
%te.Border = 'single';
append(row, te);
append(q,row);

% �ڶ���
row=TableRow;
append(row,TableEntry('T1'));
append(row,TableEntry('T2'));
append(row,TableEntry('T3'));
append(row,TableEntry('T4'));
append(q,row);

% ������
t=TableRow;
append(t,TableEntry('��Ŀ'));
for i=1:4
    append(t,TableEntry(''));
end
append(q,t);
append(q,clone(t));
append(q,clone(t));
append(q,clone(t));
q.TableEntriesStyle={Width('80'),Height('40')};
q.Style = {Border('single','green','3px'), ...
    ColSep('single','green','1px'), ...
    RowSep('single','green','1px')};

q.HAlign='center';% ���ж���
q.TableEntriesHAlign='center';
q.TableEntriesVAlign='middle';
append(d,q);

%% ����ͼƬ
append(d,Heading(2,'�ġ�ͼƬģ��'));
p1 = Image('myPlot_img.png');
% ScaleToFit��Ϊ��ʹͼƬ��С��Ӧҳ�棬Ҳ���Ի����·����Զ����С����
%p1.Style={HAlign('center'),ScaleToFit(1)};
p1.Style={HAlign('center'),Width('600px'),Height('400px')};
append(d,p1);

close(d);
rptview(d.OutputPath);

