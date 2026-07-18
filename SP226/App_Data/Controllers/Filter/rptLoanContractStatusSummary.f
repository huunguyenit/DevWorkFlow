<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày vay từ" e="Loan Date from"/>
      <footer v="Ngày vay từ/đến" e="Loan Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày vay đến" e="Loan Date to"/>
    </field>
    <field name="tk">
      <header v="Tài khoản vay" e="Loan Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ga6Hgm9ZGvvGEmRrkOThrs0CaJNcG/2FlHGilRpcn54W+9QF1RVAXEAKcboE18Wdw==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_ku" onDemand="true">
      <header v="Mã khế ước" e="Loan Contract Code"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="loai_ku = '{$%c[loai_ku]}' and status = '1'" check="loai_ku = '{$%c[loai_ku]}'"/>
    </field>
    <field name="ten_ku%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Mã vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_hd">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ds_tt" clientDefault="1">
      <header v="Ds trạng thái khế ước" e="Loan Contract Status"/>
      <items style="Lookup" controller="Lookup" key="type = '001'" check="1= 1"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100-: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100-: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="110100-: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100-: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11000--: [ds_tt].Label, [ds_tt]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3m+8cX2snwOMfHl0KJNV6mfetTcw503xqUHSlVoW9wd02V6xpiI+RXkz8Be+Q0/yI97FlN2jcMYH21f79MJMXKzRlQE4B69aQkNFoL/ZwIoyBsqiky6OXVZnhFe6uBabKV9JMg1u78EMdoXqcGkPOl2DNcrmZ+7Cko+1+Daz7vMwjjREi/2IlDtK4iWNUtfq/w7szrC+V5jkXujE65+HxI6nHqt2a9gLRxtt9WGiEYeD2+Ks+zAJBBIciQtwlRMfdJ6DcadkYzqIuy17pn8xzjL7JlNhwerw0nNrRUgUvoBJIi+N+z+L20hC0CWlCJwrpxNLnubGVZJojsa0Wsiv5vA==</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcURw/Do7H+Kl14uU6kebQUhD7mEQ/Uomp30Kpu8PIOnq5heE1DqaLovT5MIoN+FFj7qb0YwRqB+jLHAedDZQpWGf0K0l7ZB5079LBg01GaTU3gKhhJUYV52301QxSmZKKTuphH9JvgPQMmwPZuFIC1hVRM/32fEI1jzsYCeh+Ts6R7JZ8Bq8KslbZvPlhO5rBJjHuOM6BOWy3ddtvSC5W+bWKxspCa6fihS4wKlAtTgp1Dy9+xqzTCInyHlC2rKSulVDU2pT1dpgyZlRZdKLhmvy2+/M636HrYg8ac0RYcIcPApYqpFzzRKK6EzNdGjPlfg20j/oax+QoRv7i8Yfy7FJdE0A64o/I0zbkebJpMDEsZQtZ3JoAPG2efyNGTZ4vI+ojDtytVq2ZxxOIE9uy0dpuIbTW86npq/2EupMeZTbaFF45kB51+5rcDFHxcv9l0YhqX1+oAqWV5UVifuPbxWnPwDgVQzuJbbRgJJJCcSy27TQQjmDKiIfDs/lyImY6qKNbgorsreJZ/kUMAElbSf79F4AWqxKzr5uz2+rEZcXY=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>