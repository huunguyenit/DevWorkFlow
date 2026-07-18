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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVWXpTl64fUqOkOmlvcDc7W3BHHrxd1f9lp48+ayWyhisu/gs1qXBUuL1hYObcKSvzWxo5nkHctISdqdPll7QaNjaGCFt36eMBUeulN1VfGpYbGKYwYbtr+TPWlTUq+w8KrG5rRMDu/rqW4hWAevpmklz1SVd1/xIhqaS7tw8FM3pNckIaSX2j1G/h1D/k4+ZvSjVUhbTkhCUq0ZHJPPuxQ9Ay5BW6IoQgH+Rtt+jXjXZvtkZyorWOH7cY932h1zr8zbXKWTnEzDjHkWAl+0thNs=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết nhập xuất vật tư trong kỳ" e="Stock Movement"></title>
  <subTitle v="Vật tư: %c, từ ngày %d1 đến ngày %d2..." e="Item: %c, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Sl nhập" e="Received Q'ty"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Sl xuất" e="Issued Q'ty"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nhập nt" e="FC Receive Amt."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền xuất nt" e="FC Issued Amt."></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nhập" e="Receive Amt."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền xuất" e="Issued Amt."></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vv" width="80" allowFilter="&GridQueryAllowFilter;">
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
      <field name="ma_nx"/>
      <field name="ma_kho"/>

      <field name="sl_nhap"/>
      <field name="sl_xuat"/>

      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="tien_nt_x"/>

      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="tien_xuat"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfd7snYrqgNeD8yQnGbHnI7odsD4lvXJCFQOmvhqIEIIPBSSOrrR7I+Ov1VSwQKUF+pALjHajGhq7s0Ia2yQXuIY1Z0ARavYWNLFlHeReEtVVQdCBgxb4xuSdt8+b5N+eRK7Dwqrq36+H1wfHWL4SIVwHOcy478dZogCdaVz7STfdlazjg05JhCZFjTkqwFoiObkieV36EPKDT7bGHZinhNis8t8KpFuI42GT8dGnipkaxbJJFW7RfIivD9WW0JuzqM=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPa19dM+48GlYPDBs5oot6WcXgOVtPkrm/vUobg8aL8ScOoXAWIpO3hsRm+4vNfJvIRNYD0mZo3Ivq8nKWV8DvHJWFjQdGwq9ApzTF+Mno41LEJocLaMBaYDKowx9oom7Mk5iFoYx6ahPSk1CxygtyXdMtvtBOldDU0lzcEsefaigTJ8J25PO6V6VA1mvAcfiCx95iKR992IdpEfayRg5N2d3oUQbSyYCbrxWDI+5hEie+s/+ZWdkTgu8DFBAl3qVdkFd328c0s20Tr/StlAt7pC8YMdBwc0i3Kn7cYHDHv4t3bznhpbdvvpmLvGuvGtgdMAuQd0scHYeSSiKQLTIWI=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5Z2dt0Kj3v7j0IkkZhdlRndOyS4WqmEgZkOQm+dpfnWZllEFrr7VfIPVFmKClxsBa211tVVKKm3TIXqANkY3+WRoM1ucUoz4QvBDiDpz1IatZZd4AdPs+sEcNBnjNocpL</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf6s1VYpYTszUwSDgixQkA3FfB1HAKGH0rxF7KXGV471356uoZh6CctbBXpoXtnYKw5TaNxzuhQAoXpU/w29A8Eec060LCZR58jurYJUZPQVRhCPhKxeh+PhC5zUj0VPZRr4/qGhiew7nw5NYQO4vsHCquO2B6/rJXtGmw5BPFd1eWLLvl6DlaBAHYMeFDNepWHR4vleAJDDWV2M4AzmGwRo=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>