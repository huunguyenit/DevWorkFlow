<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">

  <!ENTITY defaultForm "DTSOCPKHAC">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicFieldFilterPara ", '#$query'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99O6fPjFYFikFrSjmxSSX3lAxAPubpjyR5IDRJ6z57PrNayX0rzwroqvNNI81jGNrAg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay_mo_so" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" allowNulls="false">
      <header v="Công trình, vụ việc" e="Project, Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk">
      <header v="Tài khoản đối ứng" e="Reference Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
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
    &ReportMarginField;
  </fields>
  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110: [ngay_mo_so].Label, [ngay_mo_so]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [form].Label, [form]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgrIJPOaPIZ+z63f3sdcWm2XBiS2OMPrmO/HZtrlxXovNPoGupmuZmPE51NlEpMpKsAbRLGCfcTjqr4MZSMbO/kqt8PVSDByzHG9aXC1/xKzE=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN06cMdmAF8VTbfDkhp2wWwjUox/E8itaNPQLPF6OjKeu4BuPSVFPC70EXgT4UedYrTxnkLzyjMN89t+7fDlmy8EVC2b33AH9AJf0B1l+KXSQhbn6ztzg9Ab4NH3gZQ4ExpACxrmke5CO0uaENoMtW56Ge5U3w0LxGzqMYA4MQ0qg/yEE4GMw+nyv3HehLeHdYKbibNJtoVd12V6uHHmgDbJ+m+D8GyDj0HR9nRCUYfhbybSsK31l5aPxqD7uJlPxVwUBdniL/Cr5yheWbtp2X+JeDb1RSqToi5jCDpQt+2aSY2dgMmh51+o8OsMVY/AcxQ=</Encrypted>]]>&DynamicFieldFilterPara;&ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v06bTwzXOCxy8tJk22TzuMcWsSKbzXS2TAPHP5irXprNgdc/j1KIYwerKwQ+zCV0zATRGj2B6L0JGvXxmLzv40shoCOrR1Hu3Yv53v1GxNm95jD/eTeTK3o4kqQmafdPJOZNYQcQQnXTq096L/nVUMq3eGj6AdtZ1glaP7H0z0TJizpR7Lo6WJv5ctutRy862Cy2GZXuQ/+N35ie5ladnBlcTajTx59HxN78EaLicYsycVifJE3c/uGnFOYfUnrVCbjnIYSFR60SOKll4MrAsmVljVrbf3Ehkymm4SBX7U3gWOP1/MRuxlgn0dJn2ovRLRWUlsBz14xrfLfmhktT78dc4l36NH8z4DJ6nqpVRE0srHiSS693mCsB/FnMH8vicqehw65BZSrv6w53/KHmZdNjD9ylqeMEJXT5XlmXR8+ntY6sUEKsBp9wR0yuPvkFUeqlanHvwGXghVUvcGbHWP5LHbxELQru0EESg8FifR7ek/2u3lDunk3Sg99ZtBQMP2g/GAC1YA2gI+Nruc8sY0CVoV5RZmCInwbwdu8/wWorA1xWsU2be06Jokt2/nWMGrNJ9YTwCId/cQbDg10vW/ntLeDDRCqRS9p1f3jZpjWhZsQzBlf1E1YJUuYLBlcUkUoMZSe+ux5AHDxd5BmlGG/PabVQUaPOP3PkErHQfDagmShJ9UeNeR6JCZxdLMv/HZ/gPr+5GrDyYjeImChwGCW</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>