<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hợp đồng từ ngày" e="Contract Date from"/>
      <footer v="Hợp đồng từ/đến ngày" e="Contract Date from/to"/>
    </field>
    <field name="den_ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hợp đồng đến ngày" e="Contract Date to"/>
    </field>
    <field name="tu_ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Voucher Date from"/>
      <footer v="Chứng từ từ/đến ngày" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"/>
    </field>
    <field name="ma_hd">
      <header v="Mã hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd1">
      <header v="Nhóm hợp đồng" e="Contract Group"/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_hd2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_hd3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="tk" clientDefault="111,112">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="2" clientDefault="2" align="right" inactivate="true">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101--: [tu_ngay_hd].Description, [tu_ngay_hd], [den_ngay_hd]"/>
      <item value="1101--: [tu_ngay_ct].Description, [tu_ngay_ct], [den_ngay_ct]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11011-: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>
      <item value="11000-: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000: [tk_du].Label, [tk_du]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDA8vs91/cbQB8uaRMUw0OPPLJJP6WxEUVev3pRJ7IqyajDYIHbWA7sJjACimQso8HIddp1zJ8i6kddpPHtYGBjKJMteiM7PkXaueQhXGTqkiwlWErr9tqfeEtLEcV1+K+YY1h+FAnpOBeYtSEtka9rtBQb/7GByg5SK2RIQLrmLFw7U5Zd5wA2j+beYonfIr8Vi6wjxPof88t3UsFR1hTtZJRTGdSiJtwN9s4UGDMQa8Hf2xZ9wghmaE448svKGaFXSyoXS/eRulH+FF/+Vd/UbUcYWyd6d0eM0rUfGYFiwkMTXsuwdsf+VGGVF9bD2jA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGPZnLxEgMXyd3jZjwpfyq4cG8TnTZ1hYWrxBX28mk/JZSpAwSZqEJ9dTnH7z+J8gSfYzAXJbc/KkSnQ5VWuIE9dRejyE203arL5HGjyml5kg9M660OFY9r8PlUemhlT64eCIYsRC3u1KijaNe/+WJzVJsyFvmgQKxxQuFWqhMxupmq2PKqqAxwL87fd0SSXgPK2HBAPrKJMyLlRibfMqwVSUg5/ZNEc1ZF6O+901ZtXbaAnsaFECzTC3iQINzSGvY48wBQgH8nzcCX4MAULV44FvL1t18OBFB1E4v2eFPQLc/Eb46DSDyGKpqnHSjyPk9HLUCJaEwnXVZRodGniy9xr5kdaun1B2rEaPHTqb/L7vXr3+KColcg232ye5XJ8u9/sDb4ndk+JYU63FswlhYXsb5ru+6in+Kv2e4QTACPkHUZ1PjSFApAcdub0D6f9T1q26OgPEp3x6cDorG7JmeesZ9XXt0Q3HoAwLME2WxJ4PYHOR/GJ94vTS3PDw6FWF3xqCGf2U2zUwB1jSpXltuXnEQ7nK1G90zYCgnB9UXt1</Encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>