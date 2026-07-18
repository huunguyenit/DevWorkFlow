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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OSBWtOIdGzHK/nfWSH19X6kBdqhXiwZPwsJbP3sSclsbYJc8ka6pSXqjU07fVk9JeKojYKsrohuvxOwweRUyuwyB8LSfD50q3yC7j4CTNjQNtM/sqORnzJbSp8vXpj8MGrdX54qZbE09nwUPM4PWD0/h7EJP6sP+fxcli1XsVsh7AtN2+tx1/Sw3oGf4gJagEw68MpKrDVzl0ckfAJQQSCvNLiCnG73XNOuixJD83sSbGxHoxd4glmOHMWHFGEtUZx8s6sgkb585++OqSDRXkzmvK+fcr0ruwdvuZeg9WuY2myw5f3t6iVtzpbXouxsc8Ac4kA+thRhDMG6n4fFxtlidqURGtFQkyKB4lFPdHEr1GfLGBsPMGMDeHm51jBBBd/eRrd4dWU6caA3FMKBrdV4k9kjXG/+ZAc8DAoTmq9c35soL5xAsjstJj9bv+Jf6M1f7Rkic5l1dTpqkEMqf1HNMNEgmUjhfr3CDkJHtURbKQ=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" width="80" type="DateTime" dataFormatString="@datetimeFormat" allowFilter="&GridQueryAllowFilter;">
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

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ncc" e="Supplier"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên ncc" e="Supplier Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_nhap" type="Decimal" dataFormatString="@quantityViewFormat" aggregate="Sum" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá mua nt" e="FC Purchase Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền hàng nt" e="FC Purchase Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Chi phí nt" e="FC Charge"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập khẩu nt" e="FC Import"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế nt" e="FC Tax"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="60" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" width="100" type="Decimal" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá mua" e="Purchase Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền hàng" e="Purchase Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Chi phí" e="Charge"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập khẩu" e="Import"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế" e="Tax"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kho" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Kho hàng" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
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

      <field name="sl_nhap"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="cp_nt"/>
      <field name="nk_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="thue_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="cp"/>
      <field name="nk"/>
      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="thue"/>

      <field name="ma_kho"/>
      <field name="ma_vv"/>
      <field name="ma_nx"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfd7snYrqgNeD8yQnGbHnI7odsD4lvXJCFQOmvhqIEIIPBSSOrrR7I+Ov1VSwQKUF+pALjHajGhq7s0Ia2yQXuIY1Z0ARavYWNLFlHeReEtVVYnEQIS40FjgW8zhYA7bqWVUuVTpZeLbjMpFe99FrGWLWoGJZ8XPCjf7AZGUj7rm4Fxw4k+doLIqbp8wntg51hszhqdN98wHI61/X7KrlMn5bXUmwz3twMLyJd3MKgo8Wn5FMFlnvijYfQYRHdy9g0k=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4oHJASoJTGTydDRZBbHt0z3YrgJdqGjnjsKk5KNNHJpBrzyHeJxCqU4ysiSNRBTDV5jiMM+lr3cwmXSwZuSaf9pUldUdk/3szlbu1TF/blYuYKQQVRaj7Qt5NCc4bgw8JiFyQEbv8idbloXK7iyUv2ERZhNrYUZVK0dxXKNBN0kORXPtDgRtPQmo6nCU5m1eFKWIERKivHncnhQKZZS1IhN8leZPvZb4ucK+WnJojIFZ2HE9oGrmaVozxetrzAsQ9R8Q1kUk6oPNyrz1URuxBCdgvHqdRTj6p7X9bR2wZYDRJVcu0S0/TEnVX0ApHLSA6Ew/4/Qi/FKu8G+Xt6yE7GJjWJN8FE6HN7S3oIKkJ6cNmPHf4TFLWkaMtMTmrCzFYG5wGhkwv0Xd2O7kFeeZH6EB3deaNDdUWhq6ySQeYJysdFYzCIgNhZMO9TgKkUaXTHlTQoT3si1dPZ5mdYP/7C26bC5WK6xQGVKiErQFoyPPvw6ckZRx1rEx+CL01DrQvmQVna/mZaogwTHQ8l8qIzg==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5Z2dt0Kj3v7j0IkkZhdlRnQF+qCLoXcJpPzgggwHwt1n33uIYZ5wj+8GmM9N0NicnRQEme6KvGCMrkMAX3Hiy0JEg0SjqZwrwwUFiUcuvJ5OoMYOq/gID7XQps3SWktQS</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCua0OJbd72P+q/AvRHJMSa75OV6hDz4qnQVERTpr8zlNmTefGbrMkYTRLqK/KlJJfZCi15m4fVWV2SJHuLbJjPmWH2uYdmBbPTOR7SMjdURVE+4W02N6FrTd5rVEFMGcDCNaVNb/CUUuKMSlh9a3Qi1DV0F2hRPM07cVWVtr3wO2BEj3Qc03V8xTZk7mObyT18Qs3uOknH7SoxQbQBdfsx6er9/14RyytCrkEQSut0CO6Tuu8ufru8DG8LaWqe1NHj2aHXKj1LyDyoZ3bvePpX75PQnqFlDMD5UggYYKW0bqwRenoPWJf/lQwvf7ZHof05/A2JLUNbycFIblSHdk6tD0dVZHPgfZ6b1aAjS2XwCfB8zdPB/loiiXenxZ8f9otMWbpsdmGCBVuoe26kXQHaMaqNKr2mfVReHkRHlKH4Y4Az93fyvFW7H3C9T3bbZLZISOyiBZPo1fBDnxfcfVkP4</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>