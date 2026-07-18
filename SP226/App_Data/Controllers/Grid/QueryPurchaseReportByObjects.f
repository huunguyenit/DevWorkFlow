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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=FastBusiness.Encryption.End&DynamicFieldGridQueryString;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTUg0H3Cr87JYfclGWTbzUR0TXXnJ7RD/OUC+JC/HY1FsASDvme8ciNwXz8iv/0dBc04WuYTD30yvUZ24IyQr3Kb581z1QBCWeG9K4YIOxV7Qa+OhsYObu/OBm0Si3tor2X7sV6HosDLlJsxAgmA3wcT8h/kuDiT7h+9CkzX3GyXJWYKiufkVSnnJ4mEuX7Q3AsUix1aOIvtUdDsIyZBBfuTjv3ZZ5dEEeQUHU1cZvRAiTyJgBWkSF/tbAYLvuLmkKUpKe7V7gtxCqndZoJDyqvMT/wWnTSjeccWlL2QVM3YMVD8EyFG4dwBAyw3fkr++5oc4htmTxTjfeWBq0sET3g7OxC7Hj+B6jD7sLALWv+uzwoL0xyfzGnUnLNKuPbgT3o+zz2nB49snWrhHXoWcYEhjusP2KsKwHZ700//3Eg70c+yKV7nhTaTsoFGrPDqteTHXQkZfTNAdGEf8c3jnQObXIPatWWGWW4EXe9cYpoNAVGjhDr1r16+Otai0UAd8NV5jYdXe4u4lfV97kAdDa9zsQhCx+1Ohjwfb8GM2jqf41S9QkVwYmMpsBgbFgqfeVCAloUz1hNpIJENe9/sXBcHA7sh1o1moV3hzio0q5+OpRDvJGHUA0jMMDQwYyAwsKRN/5xoAdfecvCx4TuVmLDEwe/FOIQ/dWM12NKThXgTVzlfKkBDo3T77iyIANUFfs19SnWvzm5D1RZ9Reh72Twuw==FastBusiness.Encryption.End">
  
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

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt0" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá mua nt" e="FC Purchase Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền hàng nt" e="FC Purchase Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="cp_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chi phí nt" e="FC Charge"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập khẩu nt" e="FC Import Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế nt" e="FC Tax Amount"></header>
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

    <field name="gia0" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá mua" e="Purchase Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền hàng" e="Purchase Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="cp" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chi phí" e="Charge"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập khẩu" e="Import Amount"></header>
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
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế" e="Tax Amount"></header>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN134aOsWdvvbHhmI+OiPR2/miifPN1t3isf6nOwX5emSVcsqgNP+Aq1uiYUa9CNQzkGJAn1wH+QlYTrGdkgsRCK7nTJdrh4TlheBdEVu5FvYOF0m6jBN8e3m3nFoYr4IDSfbp9jteiijOkDt7C2Uvm8yFZsRYGC0R6CB4rNWDCMM19zOB4sco5bLCCOVCUUFxgH5Zm1uDw8XZvnu2tqN0saH+uLTkOy0iLgBMwfHqoZFO72V/v+asDzB3caR8GXHY1F9futtrvmGRmMJlxQC2Q4Lv/JJs1Y74hI/2GBiCi8MnKhw1byTWkItqSA0L1He9aGehLnPmQPu01vKyQGx8ySrs1rG2Ld4Yv3m2QoDRizWUJoBxRm/JQRMXP7rHpR4xJ2hrvFNYkjc3YS2rfhAwITid4QhZ63PTP/PECRKXj/JUC827U1APHLZipw16EV68cys7zFkfKJb+rzK1OdEu9J</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwDpNObffJxXQHAmmb62stIdLH7jC963rKgetoptr/Vw8yZMkvd2l+7vybSbuCQq+WgIEeRTcGz8/2cQTQfoxhR1szkkZ3mbI/3OYGuSX2OprjgKeCQKulvIHSJVMziAhajZ7OSfo3QioHdDKRL5BgdNFBjxXJuPpNJTO5k5McNeprQI50bwKhEIwDpFS1i/6urDheu0J6MtwuWPXtRNeFcRc0mr4dT0Jlh4PZt14v3c3rq64qO1yMMIu5hRFiSbXSToDajsG6zY32NCx+zPKiaOEd2HOiVmbOIUrxmzSH+iP2uY0WXfcLJ1SEdeWTmjn2qXFaU/vy+OjG/Fd8mNAS7rREQgdhdw7U5SnuvPYTAju5CDvLUWkq6Hefol/acNn3Sm0xkvTvv1wLrUpqux+hi/1Sg56dvHtiYipjNnaoFkcXkmo4WH1vS38PFsPbvvhQyJ4WgbM1fn5R4RHdD5XvoilbytRZnEifSkeavRkqvKn27MhC9+GztF5uxbzlg8iX/aNjytdKnJJkjCSGysr1mFLA/ygt4rCUcuvnJUN4zKfy3folzf5dZ4C9UldcYDSJxvFgLUqtpFhHAnT8ma832Z3y48eGOU1Ri+h8rfISYa6ShjgqdDqmNGi+lkzuEcKYdNSg5/JlSg19PFuAkqL7kgP4KxN2vYpvw7zBsVKVWtnZoXyBzP1iapA5Dro5vKbLCbtAA4wzUtPFv8+iAPHj243KppTnbQLZxG8CNwkJCQjY/Bl/cjDSiWmxzuEv8mVgt0Whst6hxRCWCcy5y0NpKuB1n/Mt9n4cP9PpoE+iQL8MlKJlugyZDOnKvH6Y2+Vk</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22d2Yfo4+KApF/QNiuOloUdM=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSCMhCabcgxA+YCILAa2Uq96PCci2z6AQo3PK5KKewXTJCOfkQ7oXk43BoiyHjzBTBxGIU03vaea7AxyApg52hY5UMIWUNWRZqo9phL6dObBFw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtvnBus/kg8ewstuZRlJDog2gXfzSddFb5luD6xQw+WpbAA0kBpcvrwxeMayHJFbO3bwih//UecxD+OlvGRm5nr8NLECsWxOkeVyIbPEn4H2JGi6wtTi/RlgxRzh4nxPIXzoa+i5P9wDU8Jux3CPfgEQNshRKUdx0ivM9BN6a7UW7f6hqz0qmN/tC7Rs0R6jWBW5ZLXhYwzgaEkQc8xELVtoXdPHjzQ1eEe34s0qJzvR0kRS0lmr/cj4MNrrn11R8/cT6BdQUEyvLVCxZhoHQJe6o14IrpFyIqXrYp3tIjd0/fTU+LS1YwZ7cbz8M5Hlz2PB27jUL38+hXJ9hgceAyZWUayzQNjCRIDIU4dmRw9WHVgM4zpd4RA+FIBJTZK22z5Du1CiIO3ckMIcS+qxpQI</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>