<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="thang" type="Int16" dataFormatString="#0" allowNulls="false">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_nv1" onDemand="true">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 100, 100, 130, 0, 0, 0"/>
      <item value="11: [thang].Label, [thang]"/>
      <item value="11-----1: [nam].Label, [nam], [ten_nh_bp3%l]"/>
      <item value="11001001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp2%l]"/>
      <item value="11001000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="110000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOyqIlGLBI5shuY+1hULJNgWtiTxUN/phCpOuEq8/WfQwHwmQT+onYiHoJ+9ZyPvQgiguLMI/9BzVDPDR9T7B40=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA0tMP6U190MXEEY3azAsfa3pdRLncB6eTNeMKNijWOtblGdU2wFtlAS75E4H2N2cfkMUE910Lbnpjcxv7TWSLQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4q4wHRxEMjdryPRwYhSvsNKLmKHJw9LXS/1u3+p6Cxkr6V0zX89ME7xoc2T0tESD/7iDiqqx97kOfN95jzrSi2f/RnHVNY64OVm+jesasXFuFmhdi5mlvlpXq+I/0mwDVeVSeM8BuzNqM61SGTbSGAooecpeLumZnwnlPEUDaaj+YtTIu7Ya3TvoTk2cloVI5cXhM+n/uLyJ2y5jTfgfK9OBdsiSya9fxepaCxibsY3HYIXRlORWbhwfv0x/LM4FRcKboFkevUglm0s5SFGhIE89tZdia1018SSBapal9tI1xjdYRPW958kANB3iw8Fb2xGLsM15FJR8I4swRXymovcuBvUQWd3gmecImApddVVwfBY7JrAk5ZCY66vf7Bj/NyenCi76HHcSSqOaFtDz120IX4E4Pn+KpV1Ze3zxGB71S6S/H7k3sKyCL2BsB5aP/4L3pOz7UpqrPJtY/xeYBPv+igkypRcqrdoqkpJ3f1g5Dm6f9ce7iH2MkRXVb4Ak65GJKZMtSXGHnbgChifjj4EWhIWKUYFYuXH3/FgVElGnIhsMwziY/erOpEGHczNiJF1nXDu6yO29qFAQc/Rfjje1WTdWaZEBmjMtIzQon+9MGBow/KwQCqy2J/Aql3HLjqcoBP7jDVfa91UI49iOTA=</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3UUu57XBBEiC/ktUcE0wn2NrIlGluCOPinGkS1RBdzPW45qjj1RaQyLgvT53skjyfiQMALTVlpfjoAzfZUrP6Q6BFgo8rQG+EDDJynSwg6+O0z/Pb98eUYWTyrY+GzQ+EQFDvr/vdmTxUxCS0CvFojxzR12DW7ejcjleExCAweMRO9GNrfFoYJcuam4ZJ9NyltPAKpEt2iB04zsJEBEwUx1DmRTvLf8O9xETJsbdIhbkeMxMzP4uizaTsxZ9ggr7vp2m1Apyl7oaozCg4LwAcd3+rt1KR1erd3cEjKLf/2LCviwWgCdp01wMnIAneJRFJSfdlNdBUIF5x1MIi5GpS1tdig0O71OE/jNZox3W3R8BLvMSy+eKkefly0Vf8LI2zpjXHgdCKyYvf4zrJiqWriYIktxZNAJrhs1pWOv7Pj/</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkDov1cHj5PI6sEEw0XuZcC/BIRPUApvScsHxvtdmJGAfhox1hxGji+XEFkPhntn6V7d+SFS5yZ5l1EClHEuLdm+HEbbVBWSKI7W6M0RRtSqIWO1xJ20a8Lvb26Xfc9GXHxpieYEffF0iJuimz3PZc7yY1MF5ML2KkGgN385XQPeTfAZOZ4KNEAG5TaMuqe8iCOP3GPIThTOnM1bYV5m1CVfDtVEu0R2iMeSGj9pjLSnarvMdf9er5Pp8t9LLFxLfkPEItxfZ+rC8NNkR7RI/1Tdzi1e4j9tM9AM+6RX74O9O1rfP09cEsnqrkz+z3N75iic0hXfNw8g7OHjw9OjjlVVPSpKeQfdgLyuBs+hYy1Z56rXysIHF8gcUF3qqjT1j9/GgqiO1hdu0hkFbHXoKlVyLhk6fkavbCmKDZLaHl2VMg==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVwOzIR3rAJuatF4WKjCgK7zj0tlA1F6WG0sAhS4+0djQcjxztnGwZtz5BUTaAj2RHPMglVXb5HzDGF8DQoQ/WCpJcdo0Ns98vgZlBv91fXE+TUv6i5bDsufcjejpByVJHfZQ7xu8cnMzimNIA/ysunYI7dc1xKdYsT1G8dR3f6m0B2cgpjwIKFfejOyNVqb/GrvhhD6SEcJ+MFuSRH5TG+YZO3CX7Juhz+rD1oV/GWuZG6YZGfTPRZ9lMKAeVZRtVyyB2pLllYrGw73/53WRPoEPGXEj66h77xQNSRdIijvjDvbR9pKdYyu9P00+t5nX5Nr20+zhSNkR0eHU64UZeJkQGI5Q50xQ4J/tpc1x/E2EUKsvQy59rs4iJl4jOH1/b+vv4rYZ1t8NQHg+xwgpzChos0Dcw2lX86A6nf97A9MTFejhhQGapcvToFbe5pfb0+LMKLzaxFa2zWA84Zk1A4f+wkCkbJRVGzpFWRRdumWsbmuTVREEH7k4Uvfw4mMiSmVJBaUqZkDqNPGQHnYU1Jmo/HdfGbT6ALmh0RqNFpBRUrE6HDlXFPtKHNbe9ESQ4qiYG7A6+0kzBsZWtZpJX/OmjcEBc0ShKx3n4syWoxQ0zEI1R4cFINBjiCp3G7ENKYjaLM+oo7mFAnEh8Nx6T277uRmgBnOXvLPsvVmwjyI+NlLx0Jr21ZFypsSVCNM68mk+0EgL+TRZOCXxzQedEFZnqo7eTC3p60fx1R9CeWI</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>