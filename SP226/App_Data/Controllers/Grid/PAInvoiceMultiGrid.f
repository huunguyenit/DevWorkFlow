<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'PVFlowMultiGrid'">
  <!ENTITY Identity "PAInvoiceMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PAInvoiceMultiGrid', 'Grid', 'PATran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d71$000000 a, m71$000000 m, dmvt b
    return
">
]>

<grid order="ngay_ct, so_ct, stt_rec, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách hóa đơn" e="Sales Invoice List"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;" aliasName="m" readOnly="true">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" aliasName="m" readOnly="true">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vt" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="&FlowMultiGridWidthOfNameField;" aliasName ="b" allowFilter="&GridQueryAllowFilter;" readOnly="true">
      <header v="Tên mặt hàng" e="Item Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &FlowMultiGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJZXL6WAnUSm3i9F9d3JYyX8OJh+zFUcw6E2M9YbEQkjeAiYgxDkWbgW07LZrCv71lA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYvxNVOEvC/+nXdXVcZvcohmpoP4w8G0p12iKrhzYx/Vw</Encrypted>]]></clientScript>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8eQj3iUb736H+IhLk7LrowRMBZT7CQc/L8NV4Qnyw+0r</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl hóa đơn" e="Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Đvt" e="UOM"></header>
      <handle key="[nhieu_dvt]"/>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kho" readOnly="true" width="80" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vi_tri" readOnly="true" width="80" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã vị trí" e="Location"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_lo" readOnly="true" width="80" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã lô" e="Lot"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="50" allowFilter="&GridQueryAllowFilter;" aliasName="m" readOnly="true">
      <header v="Mã nt" e="Currency"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="stt_rec" width="0" hidden="true" aliasName="m" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true" aliasName="a" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Decimal" width="0" hidden="true" aliasName="a" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" aliasName="m" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>

      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="dvt"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>

      <field name="ma_nt"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="ma_ct"/>
    </view>
  </views>

  <commands>
    &FlowMultiGridCommand;
  </commands>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVT+G6T5DD7emsCPqoovpTcif0j+FTib9CETlhnabxgWNCxsDnCVnhfA8WBNbS/rINCGQCHD4vdcMzBVMf1Wea6HfAFP58hJlEIPPyUtUO1PGlmMIka7HUhTJ128yIjEryhIHcPfB64MzxOhkzYUqsLFELVDd3ngsgqQ3+VEwHLhRnjLCHfgxYUZuJjZik9hKtjhv3k1/HtuzZQkE08mJ26TNTi19xYR+HAzVWca7G+0e</Encrypted>]]>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAuaBUY0zSqvKc5aL29wUuJjq+/yLIO2C1m58D29aJ2bWsYSpUajOvGjgSkLhOyMVfGXNzP9wFJxre4822rLYuka+GnJsxIljCxsdEMmp/nGaJJVZydXp8MJqq2ajy1jM97TigwWzkSt7E6h1zGeM2TczWDwYyHYmc4JnnCdyP/Oc31bsnHctYV3aLMYuNYIrZWDnlDhZvyDQbHa8jW3iTcGsIGwE96XBasoqQC9Dwn9mv+LXoCSeCOLtN9udZGAgOC3mUeUSIER1yJQkgMF6gRlDuDuwYGCODpDNWjiWUeFzjUBQGWXQZwifcIyE365S4+mAdYYKY+WcD0DsKiOB0qogLHCxJD3SRCykDxNdNN1TAeHawZ7SyEBgYcT1P46pt6uxI4HGJchzMUcaxFIL7Xwebe9kkE6pX3YGV/hOeu5Cuv6OPRgbcglru8xFJo+W133/OZfOrTX2iwPOcnRDTO+L8cNl494irbcrLVnJyuRzYOGIj4D8ff1So03Y8sgvmJQllJK/7VLzJM9eNBxg34f9nS1Gh4EVtIxCF5fUx1Hh3esbC5EPtgM5ODB7bIrt3dlIcnBX8dWOajNqFL9qQgUYWgyxuKKBp+agRQIDz9Gc50c/QdxIFQLxfW0XehczvAz/Uz8Zv8Hky/Cl0CvybyvR0hkO8uOjae/SlYDXPthegPI1o2aORQeXuqlFzWKgSYGCW4AougL3AWRFaesJu5GiQT8EhBE4dJOoydpAG9RsW4ie2eNx7V1sGGDzDN11FhzXBTjeL0IlJmJmE9Sg86EH4Q/+Ru5R3L+5KA5GI1TOEFIV9J0BSkieMCNtZ8F3XL4XeA4i0OE0WYpidK7KzYRQpeyXZm0fFYGwMqzegF6pHH/tb54ptvvF1YjZtfUgDk9KkmGoQjV0WM0OUBvQw6EQZpR8KeCGq8yUaaiDH/s9bAmhMRbJdYRdl/GkRY54kbpQjJUk94kin74wr9Wv5szXVfRy/VzRfOIv6zY4Q0oL/Sfias5l7lkXg0X+Ec1akKNGVg/Tu48N7ElabtRfk8f0bK00B2v7neoZdmfDqW0DuJrUEREdcLEQhrmb94DzL/5Kw97CXGnHpBokY53rdBCIRp80FF8QSgzLFn8MjLqmcZXZGDaxjcBDkc5btOIQkkMNz0vMU4Pj7fI36N9TNgh6FwYx89RLj0RYRsNuNHr7fnuPwCSaL8bkpNKVwJudentR/fAvioir/41Q0KzeuOZWPeCKMDLtDD/5sSGuoKKIujWZFgxRF3OYPqqt+2siO</Encrypted>]]>&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPv9h/4S8TqSIFwcMvgZHf663UT3S+LKwalpKmkusN61Ko30S+jywclTq0wyqw06jgbI4w3ojVPfER6NM8WnSlfsUgoPFg8iX1Cz375lgmDzoXsjo4jwr4qsW6dF4bysrJY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBB3T6lrV5up1zAu9q0aBEX6AKrYGMGSeruJODuJP9z1tj28T/vd0DKFFLpFtQO5IvpuscCp/FNkR6XgVgRY5/JAKSe2ZQf7JxvDSu1/Qum7eQ6j7FajQu5WYqFXBiGNukCyfPvheYc7USQCgV4spDmKL3eLblXyCHv3O1kaQ1kRZcztt10YaxqdV5HxosecOw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBqIFWFGgqBcnGQaZCAV3xh7NkqtMU1OEC4Rd0w1wX+uFM4AkvLK7tAeMZiwVNtgD5eiM7IhRmzWojiF8E0MTjgrsM2gP00aTBfbUO76m35Y</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEjtdNfv+HDzQ1TtwDoN7BpZvQG9tR3re7QyAt63N9pw70e0MeHK8x94rG3OyjivW1</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO4ZUm2ulyOXaTqpFRlajwsN02bUxuxuE1EbrLyHXXZDB3ezwKLu9PfN7qulYzVjQM0gawEPOVdxu7rtJDP0Gabe0z1MfuNWdjQvsHWkdS5DtM+bseF5wlD4+UqH8i2pyIw6D9afkZ/Nlt7vGwacnx4bZp0z2yKvabmdatuWY0GxQgzS9MbFMR2CRi5wSxYB+h6virXNPUI8NfqqmUjegBiFlRsn+r4cjwZKCvVJEnG2YfrHLHbuhWaUi6Mz+HRJodV5Ek4N5EppBfpv1KMe8idrHkmgoSvLUl9DB1LZqTAUrlDXGsewjGioF5LrY0h6Kjoh3ZTmGlmjfGH7rdikHxmSFexTpMZaFEgfzk36zlUYWes59JDCKnLxy0CsuEZ4iZXTCC2rwmXNey2WCR7eEdE4O3aQrMnUXy3qWAOAGCi2XTKHgZY/aU0nTiPjKQm1K2TgVaayN+Gg7qSXQQ6OjGNwH3nxfxwa7JWnEMMTpJrGbJ9Fg42mv0eAMbMNJRSQ2wg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYth4J5BMxmd1LbkDShOsttVmMBOLFDMQSfyo+qqg/rV/bn3SdRbseBnpmCdl15bsyRP9s4hjKz/8QZzGu7k6hVO/1zGEubD8i6M/q3CpcsMLe8zMVtWHnd6CFOHFKnrkc8HKaeCIVTMn8FkkSpc6It0TE/chvOkzOsByJbqwy0TpxQMVllc/54eyx0094vB7lArnSEenqQylp6Ri6CdQfRl/paJtNNDJAWAuaIo2BNAm2CrLrM5aC33ycCVfDRn4AkppK2xm0w1IRQtF+Imi3wwxs8suzvMfmHgeFLJ8XPhV9Tg18f+WrvBeccHa4SarTFhXhssGSn9indhruMHCjHU=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8RX4QEKgYJD/ZRZMjGljL60PfH34UqUaKOZna5FvGe4q1OPkNj4CzwTt3wofOH3+QDCUtLZLsn+y6zqFTKPNz6gy5KSk0iyg6+rzJwwPtgxTvqD9h2j86PHRJovkIHdQvQEri6YzRfSwG3NOdtmc+VXn3xreh7qNusx+lSdCkzEnq4trDoYkad4MSDpgRdJww25XZVBP4uH+Pz15WeOf5J13jzbQjGwqQNZNRcY1Y3Ll7agAb2QMPchkFZyi8mkFCQ==</Encrypted>]]>
    </text>
  </script>

  &FlowMultiGridToolbar;
</grid>