<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicFieldFilterPara ", '#$query'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"/>
      <footer v="Ngày từ/đến" e="Date from/to"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99O6fPjFYFikFrSjmxSSX3lAxAPubpjyR5IDRJ6z57PrNayX0rzwroqvNNI81jGNrAg==</Encrypted>]]></clientScript>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"/>
    </field>
    <field name="ngay_mo_so" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name ="voucher_from" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="voucher_to" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_vv" allowNulls="false">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Ref. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_du%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

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
    &ReportMarginField;

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110-: [ngay_mo_so].Label, [ngay_mo_so]"/>
      <item value="1101: [voucher_from].Description, [voucher_from], [voucher_to]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7w5cpqmX3EIKPVuu1wM3Mup6zq2UrQRqngfBFN47RAx4iIE7TVl0px+cHcpYhf2jjbo10yZR3KXeyjonNnrrJRydQZ9qhIR9UNgLZm/BuVdi6IGfzbVHuiZNxW0EeaaevsofHEQPkzq9lrFvmZKh3S19rtqgYKGuhW0hxeybi2i/0gaGSocehngcIL6L+bvneQPS/PUn0H1z0W4kmTk1qXL+WunKSYX1Zd1Ku/yCZPY2qHIt1Ky/iIYzjVglhEBqqUa2UpGTsKUjVlciOuETS/YLY5nedqd3Xyl6fvlFtU2ax1sP02B1gd37t/ORJ0NDMIMnXl/b2XvJbfEOxU49M4U5MRIYzP85KDbDppixPMUE2A+jBfMqGiPF4s4WRJX3g==</Encrypted>]]>&DynamicFieldFilterPara;&ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v06bTwzXOCxy8tJk22TzuMcWsSKbzXS2TAPHP5irXprNp6TURCoQPOg4QWTT5B41ON+lRPU3g8YmXIBv+6pjUqSe6B3d5LWwR2CnFou4RJsJzicWoQPCNcaBLzUPhnFk197rk06NIS8OKNfWJ1P35Ne36PvdViELOeLQc2eXX5zv9RA03t/S0oUphZreFXy33aKPEEk8pT+MxVslxeW3fxtUqSrLAybUSq8jh0FqV7kwBhgxq1quRaS13z2ijqKVKMLjVDxX/J7iidgzrTSFoq22XEdDYZ7ae4dPCpv3daP2nBA6CDMzg38R1Z7jNW87OGLEstdA8F7BApDFYjF9UT0vlPIQb+n6DzLRxqU6B6M58BvNA/Io/unwzpVG6VKPHBf50ldYJp2UX5QBnFXZmu8wKFdcjO8N9SUt9ygJ7Aoi8lMqP91FZEDFImxq3UUIc584Jb8ZM2jOlSQki5XZov1/SrkDUn5pX25+T8DNFY2TMIKeKpw9xMm6xy4Vr6du+B6PerMsHX9fmhd16xcufwtoFnzE04ARRimPQLC3YM+HaE5ti1BWM9qXyVXi1+4TVIb5ovLQYusvIhMPPcRmRxJS/88eViV8a1r7/JKpVzgPQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>