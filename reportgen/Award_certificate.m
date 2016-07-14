% Award_certificate.m
import mlreportgen.dom.*;
d=Document('�������ɽ�״','docx');
open(d);

%% ҳ������
s = d.CurrentDOCXSection;
s.PageSize.Orientation  ='landscape'; % portrait(default)
s.PageSize.Height = '8.5in';
s.PageSize.Width = '11in';
s.PageMargins.Left = '2.0cm';
s.PageMargins.Right = '2.0cm';
s.PageMargins.Top = '2.5cm';
s.PageMargins.Bottom = '2.5cm';
% ����������ʽ����
songti=FontFamily;
songti.FamilyName='Arial';
songti.EastAsiaFamilyName='����';
kaiti=FontFamily;
kaiti.FamilyName='Arial';
kaiti.EastAsiaFamilyName='����';


h=Paragraph([char(10),'��  ״',char(10)]);
h.Style={kaiti,FontSize('40pt'),HAlign('center'),...
    Color('red'),Bold(1),WhiteSpace('preserve')};

p1=Paragraph('XXX ͬѧ�� 2016 ѧ�� ��һѧ�� ��ĩ�����гɼ����㣬�ٻ�');
p1.Style={songti,FontSize('20pt'),...
    WhiteSpace('preserve')};

p2=Paragraph('һ �� ��');
p2.Style={songti,FontSize('40pt'),HAlign('center'),...
    Color('red'),WhiteSpace('preserve'),...
    OuterMargin('0pt','0pt','30pt','30pt')};


p3=Paragraph(['           �ط���֤�����ʹ�����',char([10,10,10])]);
p3.Style={songti,FontSize('20pt'),...
    WhiteSpace('preserve')};


p4=Paragraph(['XXX�е�һ��ѧ',char(10),'��0һ�� ������']);
p4.Style={songti,FontSize('20pt'),HAlign('right'),...
    WhiteSpace('preserve')};

[~,textdata]=xlsread(filename);
name=textdata(2:10,1);

for i=1:length(name)
    PageBreakBefore();
    append(d,clone(h));
    PageBreakBefore(0);
    
    p1=Paragraph([name{i},' ͬѧ�� 2016 ѧ�� ��һ',...
        'ѧ�� ��ĩ�����гɼ����㣬�ٻ�']);
    p1.Style={songti,FontSize('20pt'),...
        WhiteSpace('preserve')};
    append(d,p1);
    append(d,clone(p2));
    append(d,clone(p3));
    append(d,clone(p4));
end


close(d);
rptview(d.OutputPath);




