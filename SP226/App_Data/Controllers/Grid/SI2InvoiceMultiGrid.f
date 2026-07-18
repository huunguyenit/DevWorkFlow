<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'SVFlowMultiGrid'">
  <!ENTITY Identity "SI2InvoiceMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SI2InvoiceMultiGrid', 'Grid', 'SI2Tran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d81$000000 a, m81$000000 m, dmvt b
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
      <header v="Sl xuất" e="Issue Q'ty"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8eQj3iUb736H+IhLk7LrowRMBZT7CQc/L8NV4Qnyw+0r</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl hóa đơn" e="Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl đã xuất" e="Issued Q'ty"></header>
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

    <field name="ma_nt" width="0" hidden="true" aliasName="m" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
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
      <field name="sl_xuat"/>

      <field name="dvt"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>

      <field name="ma_nt"/>
      <field name="gia_nt"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU89kDcVe7YZKVo/FnBo+z1GqamSWvx8Ao/C4ncWOPE0jjyhR65rPVj9UQsPTeOhoQsl5TtBneYjkr3cuKbU6W9o0KIQrct3Z5wwz/cR1o3hLnRrWdc1TT/aKPrZUGSqxEy3A39A/ANaqYok5ZJxlMNskoEVP4El2b3frP0IhorMOqdv+QzTLB9S25Cww82hVAFPp/72Rw4MZCFgZdH+W4oGwnhjBd7k6mDC8RrTME7PRLCZJAxdheSZldO/hvWR6BVYGf97oCSV/BQFE+R4PRyuyFzu4WB0jW78jWNoLZdTHxplcZIlUiF8UZ7Pbn6h4pLq6uDHioIpvzkumBssiK3aVFTi3s0mTqcF1+/UxZHksssnW9XjAV7mY2FjyrjUYnQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPv9h/4S8TqSIFwcMvgZHf663UT3S+LKwalpKmkusN61Ko30S+jywclTq0wyqw06jgbI4w3ojVPfER6NM8WnSlfsUgoPFg8iX1Cz375lgmDzoXsjo4jwr4qsW6dF4bysrJY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBB3T6lrV5up1zAu9q0aBEX6AKrYGMGSeruJODuJP9z1tj28T/vd0DKFFLpFtQO5IvpuscCp/FNkR6XgVgRY5/JAKSe2ZQf7JxvDSu1/Qum7eQ6j7FajQu5WYqFXBiGNukCyfPvheYc7USQCgV4spDmKL3eLblXyCHv3O1kaQ1kRZcztt10YaxqdV5HxosecOw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBqIFWFGgqBcnGQaZCAV3xh7NkqtMU1OEC4Rd0w1wX+uFM4AkvLK7tAeMZiwVNtgD5eiM7IhRmzWojiF8E0MTjgrsM2gP00aTBfbUO76m35Y</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEjtdNfv+HDzQ1TtwDoN7BpZvQG9tR3re7QyAt63N9pw70e0MeHK8x94rG3OyjivW1</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO4ZUm2ulyOXaTqpFRlajwsN02bUxuxuE1EbrLyHXXZDB3ezwKLu9PfN7qulYzVjQM0gawEPOVdxu7rtJDP0Gabe0z1MfuNWdjQvsHWkdS5DtM+bseF5wlD4+UqH8i2pyIw6D9afkZ/Nlt7vGwacnx4bZp0z2yKvabmdatuWY0GxQgzS9MbFMR2CRi5wSxYB+h6virXNPUI8NfqqmUjegBiFlRsn+r4cjwZKCvVJEnG2YfrHLHbuhWaUi6Mz+HRJodV5Ek4N5EppBfpv1KMe8idrHkmgoSvLUl9DB1LZqTAUrBTu70vWdn/iwuKXD7kmmCX8sbD12fIcfFZ18If4W8vcYM9KjF5xjIXaAl8GJSMiuX7d3muFjdccJRnmrQ2tKLvbSCe3WRAWJnGVJ8kh3UrgikPXZl5ivWG5Ib694ZJgfZ5G5IfAeQlXXAu5EJzJGsPFQquOsl2owfiEYvC3SUFZEBFb5AP4v8TH6/6qhhFXd0ReIWCAe+prB8hv65WgxOrk7MKOFL5jshiXJXVCE5HU=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYth4J5BMxmd1LbkDShOsttVmMBOLFDMQSfyo+qqg/rV/bn3SdRbseBnpmCdl15bsyRP9s4hjKz/8QZzGu7k6hVO/1zGEubD8i6M/q3CpcsMLe8zMVtWHnd6CFOHFKnrkc8HKaeCIVTMn8FkkSpc6It0TE/chvOkzOsByJbqwy0TpxQMVllc/54eyx0094vB7lAOLQPHSUfJB2RaP1Bi6KTkflyBF5UQkpaDEabJUiOaXYISGtAOk8GYc0vCOMZgtYt+XpokfvyKl7Y+jnakE7769IiXi6Cz6sPiqsZSXnHJqg0eRWeCal6CkUs01fhqgaSt6MrxI2FxbGghx91BufA8=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8RX4QEKgYJD/ZRZMjGljL60PfH34UqUaKOZna5FvGe4q1OPkNj4CzwTt3wofOH3+QDCUtLZLsn+y6zqFTKPNz6gy5KSk0iyg6+rzJwwPtgxTvqD9h2j86PHRJovkIHdQvQEri6YzRfSwG3NOdtmc+VXn3xreh7qNusx+lSdCkzEnq4trDoYkad4MSDpgRdJww25XZVBP4uH+Pz15WeOf5J13jzbQjGwqQNZNRcY1Y3Ll7agAb2QMPchkFZyi8mkFCQ==</Encrypted>]]>
    </text>
  </script>

  &FlowMultiGridToolbar;
</grid>