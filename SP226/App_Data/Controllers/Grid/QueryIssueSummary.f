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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS3KW/Lk3+fXWY3PtQ7SDLWWRdbi89ckV/rVl/ylP/3s7ncQui80Ub2oWYNWS3apv9zBOD4vu7bR7VczNpxWUBuPSAOzefo5vIQV5en4N9Qzpb5eCUlQ3pG8ZizTgTPoKqBXKJXYe79anBduEISBfzIZCubdkqK2iPgGanR4Q8LLpuxCzMHP2YChePaCxTWhmJFfnE2GvprtEet76r4KXkP6dnmlmqpa3jC/DILx/NaNtsCLo27NDc8QF6WgF9NozM0V/riLbZ7oMPb2dsnp8hNFRW0kP4Y/3mAlmv2oBD5foVFIbUSqQ0n9zF5DZEqjh8NYNd7p9M7wfFCi/Zcb33aWqIZRMzLlEq6qQiOfVEpAwo7hHOqDvlBQsJ7/ty9VtIlpU+n0z4hZnklQCXH4qFHL6AXldpxbZw4ZK+W55JQ9GxFUNemEBOvgsdgCIO+oHXaUjFacu0l5Hctsk8Q2V6+Q==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phát sinh chi tiết" e="Detail of Item"></title>
  <subTitle v="Vật tư: %c - %s. Từ ngày %d1 đến ngày %d2..." e="Item: %c - %s. Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
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
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Unit Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amt."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="60" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" width="100" type="Decimal" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Unit Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kho" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_nx%l" width="300" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên nx" e="Reason Name"></header>
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
      <field name="dien_giai"/>

      <field name="sl_xuat"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="gia"/>
      <field name="tien_xuat"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohUZXDeD66gE6FDrovP/fp4tA37XPItty48Vl9PzcZJfd7snYrqgNeD8yQnGbHnI7odsD4lvXJCFQOmvhqIEIIPBSSOrrR7I+Ov1VSwQKUF+rIMfMVtb+FN8hqlv52HqD3apF5AEK4GC4PXeZMF6XjBog6alXAe2gcIcSbomE22D+4JVpS+MdgA3M9a6IXq8t0F+8Meax7WAHRCIRR9leiQqyTJgKo/62qlwof2utP8E5+iEjmEPLrUKAMJ+mqrq+BUCOvauNkW8DCyejzDyJNQY9ICbc5gmNSxqjiOSdEDtc=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh43Vt0eUCIJbzE+u3IdLVMSrlYiHOs6wQ2Og+eUpQdZWk66hvC+RGHBGdhlAM62cNODRnab3CDU8ZUaQOvVkwnnzkugGGWPTCkgZi7wk/6J3iDT4sSRmJd8wF7ekluDNpO0eKSvOen2Y4rnQooOOXZ58/iW30vRrWSCCI173ZdvZ+7/Ze3yfyL64hgWMpZhsKOKjDDZu8SmdvazY3ZiDSMBZFhw+3rWqX8QsH2BRs9fd6CKBfF4/MK6+GzcOEdnGabuLoiq8le6jniFHW5k8xmTJClqqaKNokgUzMsB68vHu23UF5/pPP0btfjxQjr7CMtBS95hT06ny/ZxXo6SRZnNe7B90skxldZkjjnCozys4hXYWHLeiBKZCGXaxd4O5ZY1FULuc5vGNAdtyER9a511MBbRHORXOFZzIQGPHj9xfy5TSGiciHTl8FMpugxAGYTwg3lN8cwAfKon/nfvAzmpbga4YHIRurRMyLeSRa19rDXCyA+q29npVThGjKKBVZxqaKSjW+uxN9Zx5PxEJH5Xg==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4x5Ct4k3tpyMjG7QHJvKebaUQAHDp8TOyjqIIpSsD33yL35u3PhpqXJwYlm/gtRr3p+UDwFlZVT6mmtoV+lSQl2WXtlaNaHzNOoIYlm6q3HTRJsyBOaya+8wpKyKAzLB3xDejiAG1yvtaSl6dge6kpvUMstkFuoAG47PNRTlH2amyh+sWoEOdebT8+dXzXM430zFW9BT9LVovAgRO9kcHS7zeqb5kTu1ynXJhMke7CKPw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqq3At2L3WQjYS4dMfV4Eai86qNAYjqdOPWI0yJR4zUk4HXrbzIxrYHcZNus3/m+KtEY8Iw/oZn+OsNbJNfEMxXYTpx9itg5/h6qAXB8zb+9ahRxMkktnhjIp1pIvUGdKJyGWX+rHT5I5vakvDrEm7FqDIfRu0hQ8rFBiYRPzuxAD0evY1g/YwtYi4oryeno4u</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>