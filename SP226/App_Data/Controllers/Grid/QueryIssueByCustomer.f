<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ControllerID "rptIssueByCustomer">
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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=FastBusiness.Encryption.End&DynamicFieldGridQueryString;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTUg0H3Cr87JYfclGWTbzUR0d2RLewLmusUvj6Ub7e797Zje3xdgaAuEjnvLW7lMWVVsPRYSfz6NIm51XlSwmfX6A2fagt3rNkMJ1X+v6S8fIQMCrLa/rZcGdXF8plmMt9rEuLAqIxGyeRgGrMX4PtS8HKv3LME7lsAVBzO15wS5DDvwL9bz1GBq1K4atxZ5V5eCyYQJYctUysSlcSF+JKF4ub3wqkLPbFE/w8xOxYS57uD5rqpx8tMOCX+Y0/zy/zxKaupx/cJ4rDMm71RoQ/3FTi+zE/ETRlIu71JXVnZ0j/bAK4cQZrcpj0o9fhWGhrdqcvsButacMUto/8Xcgxso+SXdFbNXkP7MK3cu8wI2DiXFBLl5eARkeAlnDFqSDlbmvKHCElJnC847gtcZxPSQob/LE4+XO6y2b2vp+MuR1fmmn7d+LtEo+6Q3Ve6E6LTD7S+ADkjx+/K+45D0xuO84eoTP5naPfA9Aa8Zjlo6ODWXxAhkYbTWZOS6fzsCYqahV2A2TY1ZxRiHZbqLj6fMUPIWkZap/zpJOljzasJS7M=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết giá trị hàng xuất theo khách hàng" e="Detail Issue Report by Customer"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2" e="Customer: %c - %s, Date from %d1 to %d2"></subTitle>
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
    <field name="ma_vt" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã vật tư" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên vật tư" e="Item Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Unit Cost"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
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
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
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
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="gia"/>
      <field name="tien_xuat"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwPw8qfnMXyYOyNlTv9S0P5Bj3Dfsl0DGWqyvhPo/k9kfHYBn2LMbxAshgOv5577D9EK1cd9gyJz3azLUEgxPZFpi6ybng0wD0kw/z8Sr0iGzWEhFXAaU1G+3RkmQv5zq5vZOiSWyhIU4BqTa0H2uRJBrdYAyDX+ccGdDE+sczg9zeTJec3nJqFrqn0BzuOz21iZtpKoJG67rt8kjHi13AVLnU4pG4dD3STKaS+SuXIS/EI50L0uGpEoNPLMy4Y/SAtaRQb48RYNcD2om4NnRemzGJ6l+QNxugyVGqaRaEKeGjZc9HKDRXqMpO7hNyOS2a9l6X9zTxZprV0SCM3V0Aw83lz+1tZ9XkfTPqNmRQoEQ1K+XU21cjuL67TNgowtDb2RzIqAaomWppG68a7BFzKn7e1SPz4demxVQjjtUX0SZ1fktxFbl67XGN9ZmrEOgl4X3/yZex/R/HPF1MWeIGAEIzLG99BOy0qzMzIhYinwrXH0LrFWiVW2SxIPub4SzlqeY6pUJWMGzR5NLrnI0V56yr3NfSF44wGuyVdgR78wZQ3bUQTMe4AyhcjExkIxYv</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22d2Yfo4+KApF/QNiuOloUdM=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5ZGRVkqQd8K2CNKKZLe70qtVYWmlwKHRpqJNE2d2CKv2UTl7nZsHhcp5yTwBZR8c2</Encrypted>]]>&ControllerID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kYHulgOnq6W1rmaK4tBjuW6u52xdvCRWhSZ1q056HI75ycJ6iFmWasYTzTDWWIVVaU=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqi2XY6ce6ay3jAIxVKAbBoCdZtSn93eVyLdOG6kJc+zflWOnCATC7Q9v96OBMxk39Pl8KEUe9uHPeWdsPCUPbuuGtEHKDs0rfDVzESkiAfr6vc9c3oe2W1YuOowTq4/gSdb3y1h9Femv0XasJSdc4dUXg71wWe8gsHbOxCZlBcCk=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>