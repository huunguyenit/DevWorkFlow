<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_vay_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay từ" e="Loan Date from"></header>
      <footer v="Ngày vay từ/đến" e="Loan Date from/to"></footer>
    </field>
    <field name="ngay_vay_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay đến" e="Loan Date to"></header>
    </field>
    <field name="ngay_bc" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="so_ngay" dataFormatString="###0" clientDefault="30" align="right">
      <header v="Số ngày cảnh báo" e="Warning Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk">
      <header v="Tài khoản vay" e="Loan Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ga6Hgm9ZGvvGEmRrkOThrs0CaJNcG/2FlHGilRpcn54W+9QF1RVAXEAKcboE18Wdw==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_ku">
      <header v="Mã khế ước" e="Loan Contract Code"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="loai_ku = '{$%c[loai_ku]}' and status = '1'" check="loai_ku = '{$%c[loai_ku]}'"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="status" clientDefault="1">
      <header v="Danh sách trạng thái" e="Status List"></header>
      <items style="Lookup" controller="Lookup" key="type = '001'" check="1 = 1"/>
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
      <item value="1101: [ngay_vay_from].Description, [ngay_vay_from], [ngay_vay_to]"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110: [so_ngay].Label, [so_ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="11000: [status].Label, [status]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3m+8cX2snwOMfHl0KJNV6mfetTcw503xqUHSlVoW9wd22upw+dy2LWlJpJF9lnquJfKlYeVgT4S7AV3uSYugW7vtJ2aObBb/4pRN7EnInGHvB3dOB81olHho8mN6AEmbtuOdtvsh0fUPUoPX3IrVGjsV2iKmG6r3coVpLMIidTpFCYdxkXQEx55ZQSXIh8f0+IglqIpnnGwDK+Zn4D285SuQRnyBGWFaeqawg2IHSh02V3kxJGuJwBsrBhnTrfvOY4wNPrW30oIBDpRQ7vBErwchMKdb3/W3abxOp9NgZ94kD2LSbnJAfIAKJGFZO8yt5</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6oVqgI+1J5dAPNfBxh9Xe9bz2DGQj65H0UYlz57mw8KZR8LiRISckU5KjGO6azb7UQMfQjcVnBDmM0G7hG5WPqqcHABHAQs44f8vg31qMqlFQlIgkZXH/rQExqA1IxChpZZtCsmW41/ZXKInER7QlFEQDLxgcLwDydrrdNpVQfg7HJ/6jQ3M7dRMlZf22jH0Awy+SyHxfpg6GF9vlB/2Irz7wZuVGdUH2ul/YDbNuAKuoJQ0m08KCF2px7zgQyX6Y5RqbUDR2Mq0yqhttRpxwyfOYtKS4r4H2xJMMh/tAxvtif/XrJ23SzxR0Rm2z3Ftgz0aPx9QJzr9Ds7RwhA6no+xse80w9gPYDzMEVDgTXezSKmz0lf+0UtNuWFbrhBnJABiyjJBkFR3K1erIl6EgwYoyvUD008V5OCLzShXUY8sYw03FOTtuWufRRK59dSPShLCbFe2Dx+djsjNCkGYNCv2pFMm/mFmPI0n/MHVbwR0nplcJ8SC50dRl2BvTW+Scj1g3VbUEdPvaTwoSGiHI+fGL0PAGSmFkesSrvD4wp56uv6ijmjrMjKBX/hCGpSbXZMP9vagOBHvButnaMqUbbb4byKUeXIJ4idPajkAzj2gnN/m9TNubmxdUnEvbdXJU=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>