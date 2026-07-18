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

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết hàng nhập kho" e="Goods Received Detailed "></title>
  <subTitle v="Vật tư: %c - %s. Từ ngày %d1 đến ngày %d2..." e="Item: %c - %s. Date from %d1 to %d2..."></subTitle>
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

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Unit Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="60" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Unit Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
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
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_nx%l" width="300" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên nhập xuất" e="Reason Name"></header>
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

      <field name="sl_nhap"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="gia"/>
      <field name="tien_nhap"/>

      <field name="ma_kho"/>
      <field name="ma_vv"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN3ZTJqqFGHWqx4ABVXisoVLP6vLjzIMdeupAOB4QmiinxgUNrzawMjNdPVpXimeVgxfh51RRbsfUYmRLAHPSWjAICxsdYEabohLN34zG3le5Dy680DNR0vZ86dpyCZlaMjuNW/O/xO6qE2DGiv+EuUusYAxuyRgutgWY+f1JFCcz8AMWGF5IqVwt0czNzygEg9/AXecqkigPFNAVYkuuqx7vPIcPthkLAFuti6ALr9RtneLeO0pNBlSvi8HVaxB+TCXnM0VcdCNE50+dx2Qh3XlmZx7rAxLPju3sdi9Q3vze4ajRB+0C74GjyzcusWom8g=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh43Vt0eUCIJbzE+u3IdLVMSrlYiHOs6wQ2Og+eUpQdZWk66hvC+RGHBGdhlAM62cNODRnab3CDU8ZUaQOvVkwnnxEHHVuy0ER8MsR4CFiNqaHRpdhsFdNj9lw4SojyJSDrDI90RY/DVbqz2tIrXSnnwUdHmVeRSQm1C5OUMP5ckPaFzk5Qaewz3idukrN2u7VXaNhXIFhFTpseaYR+hoV9aEGJTdcTO0se9GP5B+cd4f7tPaPuUnQ9ewnAjKcJJeif3tu1lTNE2Mpo48xeFOZzqlCO1/X8rALNMsjTkEZTwXJxJdQDO8H2vt5+C+Hw0cQE4EZc538wLSzJZNY4aR+qBuhT9Lh+r01Q2tadSgMH/StWRdscMzGF0bTUPEsG1AtHcH0zXnS8ye//QBNiW1hncvskmVZpUBZr7vWYwWmvKTybs5UP/pL0/Ej0TRp0NAYLSrKo5YEE5FaNIFJ3p8XA+9xH7IpgI/rEJNcLs3+6A0Op2/Y8YH/hSS9AKCB8yW2j0up2MzVxTJ+gRyHZS1cMUQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4x5Ct4k3tpyMjG7QHJvKebaUQAHDp8TOyjqIIpSsD33yL35u3PhpqXJwYlm/gtRr3p+UDwFlZVT6mmtoV+lSQl2WXtlaNaHzNOoIYlm6q3HTRJsyBOaya+8wpKyKAzLB3z09AX2AOlaZQGE4KCc+0te6lMfXFE/j5ZqLszgXFQtMoc++Dsos0XfyXNjIFYYjLwzvkgqNz/r5Xq2ALrXOHqpHU/cjtA9tYHdP9Xoh0eFTA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOd2zD8j8lX0Ev3SnwsEYwqq3At2L3WQjYS4dMfV4Eai86qNAYjqdOPWI0yJR4zUk4HXrbzIxrYHcZNus3/m+KtMP524aZwbSjXf4MNF2N+GsUd9RDSXLa++Kf5mXss5oRdj4OoNFZGNy8eQuMnXvSUcq7BL8kxTH9z3LLfIpZ5/IJWsug/E2C3NGQ+ugK2URW632UXe+wnBhO9fueonx5w</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>