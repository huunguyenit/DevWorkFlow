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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=FastBusiness.Encryption.End&DynamicFieldGridQueryString;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTUg0H3Cr87JYfclGWTbzUR0TXXnJ7RD/OUC+JC/HY1FsASDvme8ciNwXz8iv/0dBc04WuYTD30yvUZ24IyQr3Kb581z1QBCWeG9K4YIOxV7Qa+OhsYObu/OBm0Si3tor2X7sV6HosDLlJsxAgmA3wcT8h/kuDiT7h+9CkzX3GyXJWYKiufkVSnnJ4mEuX7Q3AsUix1aOIvtUdDsIyZBBfuTsDIFpQQtfluc1zlyt55abmhAaqOWNGaXt3xNfTcn805qIfVdikPRPj9tFvlLaNV23MFJM1hKeZulZRuYKxD5JL5Gd+WenR71JIB+n0S9cmxRkBrH9ILeWBS1bGkThvdu8djs5l98f+e6Jq0aDv0vLhBCtouAm/4umsw3Ci9YSO6sNtiN0Vzun6hxWkuGXg5N31XHa3P0vTYFkx8zXm/p38+mMPizhZY+2xvrFSFgWPnxp+ba0ANwuRCJaTozpmGrMPYAohNBZKNDEwQAUl0C59QPIXpDOzGr0u8kI449erfAf/rlVAm09+9FplyjyyCwGt19uvNO946pYx0WNVNyDOILk6iffzraFp6m3ovzReDhLl+7NMrGYaL+HiRYN1E13+ZTkvsF0iydp9FV/GTovNw3Nv2MvnzX88EOaAoT3kmizCrUr5vXlUXzHDpV6iPiQiwqAlop2ozEx2CM3W8MWDjlrV4gLPUeVjlQDDTgMexExoXcOtE6CGcSnRsSocIHQ==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo đối tượng" e="Detail by Object"></title>
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
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
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

    <field name="ma_nt" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
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
      <header v="Thuế" e="Tax Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chiết khấu" e="Discount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" aliasName="(a.tien2 + a.thue - a.ck)" allowFilter="&GridQueryAllowFilter;">
      <header v="Phải thu" e="Receivable Amount"></header>
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

    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập xuất" e="Reason"></header>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN134aOsWdvvbHhmI+OiPR2/miifPN1t3isf6nOwX5emSYE65V7qfgYl4hfYHsfR1Uk9wkwjAW6Ba7Dy7Ay+EX7Gy4jZAH0OU9U338g5FzvCNuIpxrt0s9WaVNN9u9mASOBDMGqKlJaXPNC6IQ3m9koQV8o7OVeRbm9bVnt9PqORaPdcgXLKlGnIE07AbGkW8rJgxTWCt87wsD0AS53n0iGGNxQqoeMtW2Emo9k7vPmxRaMspqGCYtHTEZgxHCAPo46xtYtPZP0yDbC3+nGxS76oF4w7xFQ1fGBu9HSCnYvNXjJB20WDrEMgTLFbPR49WtZGj6QHu9nQot2wvN0rr6wIPRdgJFqeD3UvLZh1r60vPrsDTb5OruE0mLb74Ovk70d2HZAqCzn/Ihm9hG1EAHrLZvwuDrJNbPTy3HXNyoosP48VdBM4oHQj0UWDma4cQwIyhagIMafhQOPqTMErqJkS</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwDpNObffJxXQHAmmb62stIdLH7jC963rKgetoptr/Vw8yZMkvd2l+7vybSbuCQq+WgIEeRTcGz8/2cQTQfoxhR3lOxS05/f0MOSqHSpn40baF/ktGILWoyfLY+txXEUkrS14zLYU3X15dMXwkD59hbbCc36mhnaxJA+tHcqdpepwydb2iAs4fwDRvlyYS62FreSc8+3m7H6+FXVmdKGguPwdFJFPG0kv6xzoGdKNvy8DxkNe4ekOrrd5qTp27Db8+3q6tBsUc2P9oFldz2zoONMgPxxB4cS6Un4gQbChM7OaeOWnitFxLugYcoOuoSFNj4DrbBJAbv3u7eEJbt0IHogDf3gGSr6q0QKFK/xD1E3mphqflybIQX9zW2VDdOpTT32O+W7EQ0IcsNnlSwO4UEweqE+xVBIGlBABz08CZrX3gEiqYqxwcoURuH31U89xWj+3RdF5ASq8mmmHJ0RwewwNRnoA9ojI/kLU5WOpEGf5dODATncCVHJjmbw8o3Pcie7f/dxClqjVTfnBJKV1aUVy0vHcbMn2OTOWeRx8FAYXpEW6QiSWIkd80EflHCchVNwyxlH9k5ZKiQ/lq+ZXcUazDH5oStCcSdj9V5Ek+Jm39PPyGUbpAu4duhzVS2NwlYno73hwI2b8FBGorokXaLk19QDN6PFI1NDsXsNqR9NGCxlrph7x/HhCS8NsfjxVhqS4v+tOu/VTDnNeNV2ES0aTJQSSwyaW2lz03uwr5UsOuSX2IK1OkTnQ5OBL6aAeKx+Oodmk78R+ITBVD+c3HhI7GiaaQ6hda6I30jHQ5qu4EJ0pWs2RhkjhYHhlbU9RI</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSBrawS1bAVeJszOz8DH3FeIC5AWd7V5QStvggo6jix5IwB7cCl0Stp1+3S0g2RjHLSqh9qdixmQ4XLXLVuLH17kXLC6jLLD74Pcs69gyyq2kg==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoCdZtSn93eVyLdOG6kJc+zep3S/CiDCGmbSQJgm+LO+YFhYrEaWve0g0YnCJk5SocN9FSYiMKx8UoJANG3U8OdRCKmXbaZtZN8gVw6R0K3wwm/kxwRuT395IlqTkYlaRnw/AS/aLXWiKEBvJIXV5k4b2rKdlvjtB8O16Baygu4oIY90JENw7A7BULw5kGnfhCyd9ZqkEQV/kQhzh/caVU3U=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>