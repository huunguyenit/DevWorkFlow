<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'IRFlowMultiGrid'">
  <!ENTITY Identity "PVIRMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PVIRMultiGrid', 'Grid', 'PVTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d74$000000 a, m74$000000 m, dmvt b
    return
">
]>

<grid order="ngay_ct, so_ct, stt_rec, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách phiếu nhập kho" e="Receipt List"></title>
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
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8eQj3iUb736H+IhLk7LrowRMBZT7CQc/L8NV4Qnyw+0r</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl nhập" e="Receipt Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Đã nhận hóa đơn" e="Received Invoice"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Đvt" e="UOM"></header>
      <handle key="[nhieu_dvt]"/>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="50" allowFilter="&GridQueryAllowFilter;" aliasName="m" readOnly="true">
      <header v="Mã nt" e="Currency"></header>
      <query>&InsertCommandFilter;</query>
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
      <field name="sl_hd"/>

      <field name="gia_nt"/>
      <field name="dvt"/>

      <field name="ma_nt"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVT+G6T5DD7emsCPqoovpTcif0j+FTib9CETlhnabxgWNCxsDnCVnhfA8WBNbS/rINCGQCHD4vdcMzBVMf1Wea6ED/G6aylWGkufiSKg+2O4Ms3pveIAzH0eSuq0Iq24DNQJv8lYBL+V4tm6xxWSAwCDOgEUpJE8O6Zzsz6ZOfuUA9V/jRA2qFz4MwssgekRr4hkYCsGEEKtV2a0fc+7P/9Q=</Encrypted>]]>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU5UwV0ddLszAZnf3ds/ljOzGYQuvPHkmKkbz8JLTM9QZ+SQJZAXHkDZ29JdMDHrKtlw6IaA7y3NYMhaQfNtW7vOvnC9zVtSs27cwZi0+UHTv6ftzr2I8yweQm2ujGpu9zbo5JoSZfndnnPPmupKyx/XiXBoIfciENsFMT9uFftRzr3hm2Z1voSU5VMk0THFaFieI4UNUNKc9QpBLMEAmcFbw1NhbevTQQa83BomPFw8m8Qy0mwz8DWeJnZr5JmSjspmP3YDTO+1CuXgZRb1x0FTV9b7ehkeX0dQncPOKGjJVAZXbmPgBhS4nev+nDehGbfM92BaHDY1De+4zM4/lOQauHH23wbvo/LeA2XeA5yw1aEGn64K/k4PClEt4ndrrCg==</Encrypted>]]>&FilterInitialize;&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPv9h/4S8TqSIFwcMvgZHf663UT3S+LKwalpKmkusN61Ko30S+jywclTq0wyqw06jgbI4w3ojVPfER6NM8WnSlfsUgoPFg8iX1Cz375lgmDzoXsjo4jwr4qsW6dF4bysrJY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBB3T6lrV5up1zAu9q0aBEX6AKrYGMGSeruJODuJP9z1tj28T/vd0DKFFLpFtQO5IvpuscCp/FNkR6XgVgRY5/JAKSe2ZQf7JxvDSu1/Qum7eQ6j7FajQu5WYqFXBiGNukCyfPvheYc7USQCgV4spDmKL3eLblXyCHv3O1kaQ1kRZcztt10YaxqdV5HxosecOw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBqIFWFGgqBcnGQaZCAV3xh7NkqtMU1OEC4Rd0w1wX+uFM4AkvLK7tAeMZiwVNtgD5eiM7IhRmzWojiF8E0MTjgrsM2gP00aTBfbUO76m35Y</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEjtdNfv+HDzQ1TtwDoN7BpZvQG9tR3re7QyAt63N9pw70e0MeHK8x94rG3OyjivW1</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO4ZUm2ulyOXaTqpFRlajwsN02bUxuxuE1EbrLyHXXZDB3ezwKLu9PfN7qulYzVjQM0gawEPOVdxu7rtJDP0Gabe0z1MfuNWdjQvsHWkdS5DtM+bseF5wlD4+UqH8i2pyIw6D9afkZ/Nlt7vGwacnx4bZp0z2yKvabmdatuWY0GxQgzS9MbFMR2CRi5wSxYB+h6virXNPUI8NfqqmUjegBiFlRsn+r4cjwZKCvVJEnG2YfrHLHbuhWaUi6Mz+HRJodV5Ek4N5EppBfpv1KMe8idrHkmgoSvLUl9DB1LZqTAUrH9jkfkzXAeHsgRdEe17YSdyMhOgBZxrSpKghE1+rBxv8nqupJcjyvGfQHJmjP10cx41UC3ey2Lp4wZ+0QF3FVPaNl2qp9Q+Ckho2QNM3nngDbJLSNfjKJwZwOpZPU0o3amUem1CmJcqZJyvBC6z0O/tbOtj6vAZtEu6Ro05Qeqryunx7Z66wMSJxd8Q/UMRv1IESxdy0aHQP2gL2B0FE+48aoLrg7AzXS4TPGHVo3+A=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYth4J5BMxmd1LbkDShOsttVmMBOLFDMQSfyo+qqg/rV/bn3SdRbseBnpmCdl15bsyRP9s4hjKz/8QZzGu7k6hVO/1zGEubD8i6M/q3CpcsMLe8zMVtWHnd6CFOHFKnrkc8HKaeCIVTMn8FkkSpc6It0TE/chvOkzOsByJbqwy0TpxQMVllc/54eyx0094vB7lA3lsulAp3bxM9xdjezfFEgDU2Yl+mR5HS8SU8ZkOSgXQ36GeRQPwiJezoWS3qLFYpAm2d60IqfzPVOWEDY/+yDnHrnU83YClaozdQcKjcMgxj97oYPFAHoqPCJPJhWuuwLcuhKVKRn9o9mEBqfuyn4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8RX4QEKgYJD/ZRZMjGljL60PfH34UqUaKOZna5FvGe4q1OPkNj4CzwTt3wofOH3+QDCUtLZLsn+y6zqFTKPNz6gy5KSk0iyg6+rzJwwPtgxTvqD9h2j86PHRJovkIHdQvQEri6YzRfSwG3NOdtmc+VXn3xreh7qNusx+lSdCkzEnq4trDoYkad4MSDpgRdJww25XZVBP4uH+Pz15WeOf5J13jzbQjGwqQNZNRcY1Y3Ll7agAb2QMPchkFZyi8mkFCQ==</Encrypted>]]>
    </text>
  </script>

  &FlowMultiGridToolbar;
</grid>