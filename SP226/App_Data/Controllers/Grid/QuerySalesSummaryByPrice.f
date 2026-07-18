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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVTOieg/evw/3K6ThsSeWQtevgSB5nNzoG42DkNnQ/DfHa8XhTi2VhSvR6CWt4rqM8SooesqQx9NGY8dYVlBpjnIZlg23HdFKz/4DrZKB5drKHnC9/dlwbH7xzb7AcOffvGi9pGgEPZc5CK3cjuddNyyUzbO6tWETxhTGZ94yOm78mKoHdrG4sUda082x4wG44f1WbdCVxDamIOblitVjf1DJ5L3rZjty1ZR+btnKyUH9S0rOEtrpABstVQccqzbR/Pm5ywcwJN4AdHDbxtBzcnS0fmeKs+WYokK+8oW03rYihgaLizFfC6mB8Xdy2arfwzYtA/C+GREsaXuDFreoNx9ZrTNY2M1+Wf8I+NLXUV1MXiBOWNh8pVk41jwOrP6Y87jbtHnMDDUMovRCHfZhqxVzWSvgU73rxioC22Fz7Ko6JtRlCcJugsfZUHBsvQ0KTG7wPx1GKGt4PRBGBjD9pkw6jFV57jiJCc3WOgN60I2wW8DH3qE5NtkrtEU/dVl9X1XQA8mpNxWHm1DWAbdZAuqRgfl1EUMFjrh2hHF4VfmYwh9XVV1g4HnHWKP+CS/po+8BhHu3zF3KXhdV5p/h3cp5fKAoK4N7rBFh0hjwMg1YFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Đối tượng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Object: %c - %s, Date from %d1 to %d2..."></subTitle>
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

    <field name="ma_vt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã hàng" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên mặt hàng" e="Item Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá bán nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Doanh thu nt" e="FC Turnover"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu nt" e="FC Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)" allowFilter="&GridQueryAllowFilter;">
      <header v="Phải thu nt" e="FC Receivable"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn nt" e="FC Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="lai_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien_nt2 - a.ck_nt - a.tien_nt_x)" allowFilter="&GridQueryAllowFilter;">
      <header v="Lãi nt" e="FC Profit"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia2" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá bán" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Doanh thu" e="Turnover"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế" e="Tax"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu" e="Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien2 + a.thue - a.ck)" allowFilter="&GridQueryAllowFilter;">
      <header v="Phải thu" e="Receivable"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá vốn" e="Cogs"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="lai" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien2 - a.ck - a.tien_xuat)" allowFilter="&GridQueryAllowFilter;">
      <header v="Lãi" e="Profit"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
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

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="sl_xuat"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>
      <field name="lai_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat"/>
      <field name="lai"/>

      <field name="ma_nx"/>
      <field name="ma_kho"/>
      <field name="ma_vv"/>
      <field name="dien_giai"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwRUec8OJJp+G4UIrznd3VhGkBvvTP+raPQgzRmtq3aTIJZ0yR+JnlBrlX2Wfd6v2paOJdUoradLL1VPo/Z9XCkefokiX0wyqE9xohghGnr9CAa5xBrc+jib6ijWqVvv2AHSGH/67LyZ3IH1qdcyBXHrSse5+l+JBTaSGc8BHEOQUqTRbbyPtbVhmdYKK5Kb2VkUIkztPHS0ydf5h6pozJL8xXpxWhAId1StS5TQcH7QfyIL1+9gDM1OdLxiz0esGHijXCiu7DZnTKtmzK2Ld8JsF7us4/TpJBYzLl9T9Xqj6R/29F2Az0DEedi5gzUpM9nNAzAFndzhrPnU1Q0Fk7/6ZxbTbTTcOYmRtOmCFWhBERCjUEPhEbeZVhVgVWp57HC1gpy8m+S+ggsBzROIF2p7CNnin6fAj2oomUmuARXzylEsQdi+8cHY1JVRP+CvENYa9icAaQ43XNCx0RBVCUsQQqpysN8Wh4Vc7W+tlX/DFEXOVhNAmKAUNFptKuHTMODGupnE+ElhvYRHUtyPJMFpZWs+0bLAvOHcUIxQq6DV23WmfYWSvLQM3uDEJiMuekZ3d2jkyL5xw4XuBL+ixhjBqwMqV5mw3pWb+N+FS2Cmw=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSCXJTWrVmNT/nx/Zw28anCyToC1IZ/fNu5yMs4ioGo1eSH+QNeZO/cmKhBu4TQyBb4=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqVQKvZhAEDvcRaZMV4v3i0RXXDo04khf4cAJz6cIzr4Mz4ZyLgCZ1eC6FjiC3q+BKy7dcOJixLa2x42QIYngcGbOA9Md0ru/ClliqVcleEp4q4gmm3zzQPUu0DlU5mOA8VxIqypXTxDvXfYqBoUBYCv6jt34dhTIDGkLaGY4FrmaVHYPyU318P2J/kW9m1rjd</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>