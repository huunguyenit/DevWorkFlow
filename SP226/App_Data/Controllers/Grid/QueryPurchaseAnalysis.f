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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVTOieg/evw/3K6ThsSeWQtcZX0VZJDMBCp+Ok2xnX2ViN6jr+W89nWMeCkDWS1iIjThiS60UwN6ijkvYiouArgEm1ve7gYg+0l8ARuvz+BsXEGGVpj5RRVQOGlIApyhkDpVylSu3MB0m1RTp/KofNoQLHADjURMQhG0S4cTlOx2vSKnZ5D+eo6y3CVs5UxqICM+n5GPdE/zftWMBCGJxvo0PV66P9C/DCi0VNXyXjbdX0fajIrNs7D1XLrtLcfi0jB54rz4eocTYHKqjQ13gWJU1Ln8KPEliw3+GoO5CkR8hTYC+WCsHsWuP1ZBGioA7SzpO2WTe0yLVaulUKTTY+lqe/cPysAV98+mQkx+UWvQ+z8Hlo+nqgm1eUil8140pAfUPCHPTIysW5F/gGlNkJO5E9WfYjKg/9qhdqmdXULn2fH39n7A9NxITkpwPnFiY3svBbPL02DGlaxodTDMumaHeYun83d9OhnHEY45ciRrSFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
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

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhà cung cấp" e="Supplier ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá trị nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá trị" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập xuất" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
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
      <field name="tien_nt_n"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="tien_nhap"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_bp"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5VohnIgqoCFn6KX8VZPCU699dj8eRHkU2xxNSpqGY9/JU7EfFmREr8KVpX/xKakoQvNKqPeLhI7jZwoxBljoYygyVPgSBez76oQRme7jLYLSCwhcCz1jk7LGKcTrIm7v8zPeU/eq+ISRT7H1ZWsFm/NeJYsh5pfW60YzOscHgOvTjRz+y2LWoxzacfWb5jJ+NBHw7iS8a/hxgr6LBZbNW4vPhlCbLjx+KVvP9XNL6oUY0dhypod6Fg4lranETaf/OUDFSQqwpP3Gg2eZ2pqqmTDbKA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4oHJASoJTGTydDRZBbHt0z8RuTuslzLIwSHIlJSeR9jrO66ImUaNf9a4fd9d9k60dAfDKn18zXQqRkQkBo74Sij01jOua/5fx6fxjnmvsvCXTfPdF2IJr9K2VXfxZNSFqjowuuyfHq6WLRShtosu8JOa9rrHSPFvPKEZ14Ld8HcG/ABfyNSBMEGb3WCv/0dYnJeN0fxEjUB4O5SH3+GKSUIBF/PO9lBi0L+qDXs63XhA2I6P6yTtJLQu7bmPj8+MbOaufEOsti0dgIJ5KDo+xsp+R/Vt+za4DE9SB72Vj+5OkgQrhyKIyPh2qT8vk4NPZWZlBzVHdKyyxWUEtHvw+RZ/B8/9KnC6smqC8qLWTTpc6Ji9w1uhrCEomNAACfEc6XTg4BA9oB5FQ/uL4F23ClWvnvKLqPIdjgv68sELclC0h7RVXnUyXds3cUgJ/2C+pRFFfxC2sDaOgZuiddeaGpEsMVhhuX0+/jp5sRXoNcuc=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSB63gkOjMjWZSnVT19ZISkBz9U6qyiy3UwFktDi0NHMtrzmTPw1vOpxJqPktjJ6bH3c/dCVnPA2JhxrRWlyuFgcHjdE0VZZzla5NUJQGRDDvA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoCdZtSn93eVyLdOG6kJc+zcLMzpUB4dTEToCM6qLZ/AafJFwm1q20RdzcrZQWB67EctH8MTc488kpe4B7Wz56KZGiPdHeYwFSpqGZ2dXPJl6bCyQrB4d/igydiu2odN99exUYNylAZ1fYgXaF3JEWQ8=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>