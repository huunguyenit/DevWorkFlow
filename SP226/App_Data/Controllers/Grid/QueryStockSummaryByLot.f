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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVWXpTl64fUqOkOmlvcDc7W0kPSLmgntip2DYQ4z9O4NvcOHIn26VYVCmBCqiTWABFwebuAsrfkFsYxQ3eULnPMD4RqHLh5h/cGz9iTg3l5XyFkkRV7biu9KK3CQuadUOiGgljBr3L1Jq5AEBKOt9olzB0N/3zNURqZ5TF5jfCokgqB+tsLrVQ1ed1mgUfOW2Dlcr19TcuDEEb1sOj2ahMMlPms7ChbjB/F2QFFlaThtuDZE8mJix1Eib6+KerTLpvi989fwOsKn4OmiqLGyNNBodeaqXEuVZY60X3EZSuY0SgsuCzL8ofnwfp14QdLPUrgDgHQ6Wptw66bd37kW7mUw=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết phát sinh" e="Detail of Amount Incurred"></title>
  <subTitle v="%s1, từ ngày %d1 đến ngày %d2..." e="%s2, Date from %d1 to %d2..."></subTitle>
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
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nhập xuất" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Sl nhập" e="Received Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nhập nt" e="FC Receive Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nhập" e="Receive Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Sl xuất" e="Issued Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền xuất nt" e="FC Issued Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền xuất" e="Issued Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
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
      <field name="dien_giai"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP/hPlQ2h1pE4kiDDFigByLzKR4JlCrDoWmBl3YUTG0/IWFKwXgLXBVUZLXWsYYxQ585jbFAMLQBuCP6QSpEFp4Wfela1+vwj6nmGCPherTvifNKlDRmiPKyVmXyaMapx7W7lKu2Bb6gQxhzdTaEGarvzYIL2u1kZ0yy5hmIrokJ</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4oHJASoJTGTydDRZBbHt0z3YrgJdqGjnjsKk5KNNHJpDDsrd2fCFFL662RMk2AiHnixyRR/kVmRLKx39l4Jo3831wUgfQogqWckIbYH168gdNRAwAHFfYWR21aU7iDNHMaslr0sObkTOdi/a289WMLJz8wsvGv7YeJhQ8dstZPzUGfPsczcbNLpX6+/+1EMYTJ+lo722J0zo8Jp2NqKLpVQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5Z2dt0Kj3v7j0IkkZhdlRndOyS4WqmEgZkOQm+dpfnWapPpJQpL+7WYJEApIfh1IjMNvvr4H5OqzzYyHpFPCZAxK38YhT/Os16o28TXC6JMOrHz/sa9TlF6TlzDjjkMAl</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJJmum7mIAHH0P0rJgwZBtmxnUBXBNVG5pvSJm9Gh/Y6ctdFBZCbu4MUanKgqr4dZSURaDeJIAno9Cs+/bX9PG52AVfS7OHf0/mcqour4vohi070Aqe5JyKyCY+zjOps4EGclQ/kphnIyLOTxy9nN2XngchNIkN903Lxr6ng1nsRaGtuYfXIFJa7dWpA3vpmUF2oOWCeM+vW7tnqOolza8jTtJ9nf4Rgie8x3zbsYfHbLBrKpGIMkHIwIRs3anhsRVfSdvZLB/AlV+COCizprNGjohBUeXeTnaap+KqsFNacIL64/yYgwkRZ6zSQ10cRn40735glrxnqWSnpgG5kV6OnZ78xT8sOXmmNOyfegIpZTco4pCJVjyAZ3p+utLe8LhFAFyVlH9eNTn6qRKvaG4JfwkLQhuMWixY5xcSG60PgQw==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>