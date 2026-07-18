<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'StockDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF82lz+vTa3Lj29aFkebuIelYSUsaR1LA59KGJf5y8RtyJPEENMQgOQYJF10/TBuRaJo6mpxWSZPQ/9emZ4RKmLZlu5yA5PXZ9rblUEVNtgNDTfs3SwK5aYSS1upsrM37m9z4sfFmbsvqP2fqR6BqK7A5i51on0eCO2gWkurCFU5ZvFdIEzUvADUFT79HIuPc/ZksFDVYtazicTPL7nW4khkI9SBmXQPAvrf/XXbB3S8JpaDV42oansyAqAQ5i+7VvzYqISgGF65xPb3lLSWW5a5CFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" aliasName="a" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="so_luong_nvl" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aliasName="CASE WHEN a.nxt = 1 THEN - a.sl_nhap ELSE a.sl_xuat END" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Đơn giá nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thanh_tien_nvl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" aliasName="CASE WHEN a.nxt = 1 THEN - a.tien_nt_n ELSE a.tien_nt_x END" allowFilter="&GridQueryAllowFilter;">
      <header v="Thành tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="60" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Đơn giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thanh_tien_nvl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" aliasName="CASE WHEN a.nxt = 1 THEN - a.tien_nhap ELSE a.tien_xuat END" allowFilter="&GridQueryAllowFilter;">
      <header v="Thành tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="so_luong_nvl"/>
      <field name="gia_nt"/>
      <field name="thanh_tien_nvl_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="thanh_tien_nvl"/>

      <field name="dien_giai"/>
      <field name="ma_nx"/>
      <field name="ma_kho"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfd7snYrqgNeD8yQnGbHnI7odsD4lvXJCFQOmvhqIEIIPBSSOrrR7I+Ov1VSwQKUF+rIMfMVtb+FN8hqlv52HqD3apF5AEK4GC4PXeZMF6XjBorqNA3fCzZGKd5LpqaPSL92Ewk2e8FrQuirCrEFbbusR2TWNPMtIT+aJPb3H8bA51j56djn/PhNoUQ0pcgaMluJZ1O+atjT1qQigcLIJyvcl0OPEDNkcWC13Zk/a8hyV5oW6vJGXcEITgFNGyk3xmk=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4oHJASoJTGTydDRZBbHt0z8RuTuslzLIwSHIlJSeR9jrZ1iQlvcLgN3fqMfo2y89WInO1LOdBYc9NteETJVaCKIAtfQGhwm6IUfwU2w/vhcZ/zBqMPKUzcAWFdEcT5/9cXmltg9Khy2dCFc/dHl/7TlPVWYCSMyEHSrzocnHIebumy69ax9ZsG75To+7pMtlFaNZ+eWSh2HvqBIzFOIT4cWqmKFNaoWYD+9opT9te3R8=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Rxt/BsBsvX4M6O3ueiaQf0c4vBStxxGMoZxxjcP6UpbtgggRGnx9ZfIODAQmBDTwUFEkaACYEdY38D9LEIaUjFaegmW97RS0S8o4t5C0voN7T8QqR7/sGeNpkZtdPFe6Potkokx9RseSONhRfLC0Jp7LHN8YPVdpQisFOiRygYIYwlb0PZoeCQBW/XPx/5KHXHoeNrPNyQT9sKA+NXEv1R9+ybtvtm8BAQjsNfEoVFlMqj5/00cAmSr9sFde5OcxYkYcaTarMCZ3ZySee9rfrqTs8DkcP0LpyyAK8Y3bimhckC8vSrxB3uXFYE6ANr7hC+yHdz5Y9hoVQiWY+SUhR6M369gH0O/lLZISpozAxiQ8NuJW/ojBWw8SgCTmWB8a3OaseqCVaZrCEe7ytS92i/bTF7JZ3GR3EluOWVQBHob</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqq3At2L3WQjYS4dMfV4Eai86qNAYjqdOPWI0yJR4zUk4w+t19fzq6rfC98xmVpwZTYBHTPb0sZKgBPxtvieOxX53rEMgb6OCzWjMJk+92Pe/KQ0rl7zy8iYqZPQ2yqiyMxg5sF/mkzxZ4+kIksuSzjUmOvZ8C39IpqtvoRztfiuo=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>