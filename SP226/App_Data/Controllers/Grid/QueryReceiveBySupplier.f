<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DynamicFieldGridQueryString SYSTEM "..\Include\Command\DynamicFieldGridQueryString.txt">
  <!ENTITY DynamicFieldGridQueryWhereClause SYSTEM "..\Include\Command\DynamicFieldGridQueryWhereClause.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'StockDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=FastBusiness.Encryption.End&DynamicFieldGridQueryString;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTUg0H3Cr87JYfclGWTbzUR0R1teFC+mSxJeellLEPzFH1xbJutPhJm6djZqmNYckcNebro0cqcj8Sqdiygm5xMk2lnZBwAXeUbhX6ZJEu/aMI82R/KA7IW8q63yMH4F8Hvhe1Ww7EYzqhE6+6FjoecjE44n6T1cUB1Lpe10KMRsLDrrRKE86vQYv8+DXLPtAlwufvvvzq8vWJgG1qvy3wHGnH9pcnEKJGp/dKRDTAwTU+MzgR1oVGiC/7liPAT+zbAsSHahb39nyU2CqwF/QCBHMX9PrpJR+hO7yZGnCA8u7x0WBqMEWkP+4q/0wJMBEa0r36i2CIm5KAmQ8v9xq7QEGhHk3O8xACQQbUp0dW7Eau1v0KL8sdckgpb668KyaF0PbgMSVt6nZ/zG6c2hzD6jah4ieogsIxP7Lg9nb5/N+mmEaPMS9pmUbK7GOeINFTGAdze/SjxReg+q9cENB1UKkSuuOl/S7M37sGbkjdMcYnXRLe/hS6kxEQQJ0jkO6OMIhgBY1dXVHm+ut7wdagqsQ==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết phiếu nhập theo nhà cung cấp" e="Detail Receipt Report by Supplier"></title>
  <subTitle v="Nhà cung cấp: %s, từ ngày %d1 đến ngày %d2..." e="Supplier: %s, Date from %d1 to %d2..."></subTitle>
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
      <header v="Số ct" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã vật tư" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên vật tư" e="Item Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Unit Cost"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="60" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" width="100" type="Decimal" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site ID"></header>
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

      <field name="sl_nhap"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="gia"/>
      <field name="tien_nhap"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN0qkidWSgGbGi905PETwIY1tHNfGgemFBxcLyIlKfyg1K1e01glFO56px7M2j7S96FHDwr+A47cEJ6aIVU+0fHddg5zLPlfFz/MdK9/PA2WmZa2WtQ2C8yBSprbXKGdSuP70Bc14alo1R9I0zU0EgjTDIpuNFJGHEcv4Gae3Gz/mUpIvlhHGsOjV826+WqtutwK3aycFbNt0yUuLuA9kqHBVsa4NEulQ8P8RCHiUkURUlbOgWc8Mo5+VPkd0iUT1inFfXlwFAVZ8d4Nf/XTn2pW4JdCtLnj7qYG5D1LQP6fG9hXfArQ+WGcUXviJ0xCpfWrIVMs+5N7UPmXQkp+C4Xs</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwPw8qfnMXyYOyNlTv9S0P5Bj3Dfsl0DGWqyvhPo/k9kfHYBn2LMbxAshgOv5577D9WRTsGz1RmTEyo+/Rrp9TUHI147LKN+rg2BXYth8qthLJgGG1yD9NVhfoCUywA6Ei5orttnQm+VhX35ltnF3NxGkEwVNhPxP80Uq2jSPvAs1CyWdFJ8yXcjYfoXGkT1z+BUIKSAfXd8FuRsswooLYgMUzRtxZxMoyMd+fV1sEmNF88Nc1KV2x6X18OJ3lEgFJIEt2LIZDxmikNRjxTrOP9TAXvfFFe9JIRO6GVvFNoHuFoxKvImLJN2vxdXkk1ZxeJF1PFlFmIUkJYb/upu82PWPXw333oYk07RdlkQXQjR8KWk9q7RT3aqXyvA+N5260a+kT3etdCeS4n9MIH/BkBEMJ1YOq6Y8yM5ENO5TYnvrwb1L+7Lcn+cdbQK27aTwV3p9BGeaLPHawf78rAM6oVOBJiv33VSoRIZBV2unirY6c2wZvn/RdoWt57c7JrDFgvWC7oN2IZDc62MkQR46v5wwVZakMMeLLQZkrP3Evpk0BMPa4Cag4WCKcO8BmVEwg</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5ZGRVkqQd8K2CNKKZLe70qrAFqtCFr5ILo8DvTc1aruWWgBZTtQu4zy3Qei4LFyH/0A1GXZXBpFgxyk9wjHm1hBQcGLtLvm5aLu9tWHuq8deRN5BHO96kaOOR+g2NqnkH</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoCdZtSn93eVyLdOG6kJc+zflWOnCATC7Q9v96OBMxk398+9oFdviiz4+6ViE4txjTb/PUQWfdj7oCckQ+ZkHLUuscrvfSJzxWqpSdlY//Ij0feFlt2gMk4KI2txPXuPKVg==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>