<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Identity "WKInvoiceMultiGrid">
  <!ENTITY Controller "'&Identity;'">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'WKInvoiceMultiGrid', 'Grid', 'WKTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d81$000000 a, m81$000000 m, dmvt b
    return
">
]>

<grid order="ngay_ct, so_ct, stt_rec, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
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
    <field name="dvt" allowFilter="&GridQueryAllowFilter;" allowNulls="false" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_tl" external="true" defaultValue="0" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" allowContain="true">
      <header v="Sl trả lại" e="Return Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8eQj3iUb736H+IhLk7LrowRMBZT7CQc/L8NV4Qnyw+0r</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" width="100">
      <header v="Sl hóa đơn" e="Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" allowFilter="&GridQueryAllowFilter;" readOnly="true" width="80" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" aliasName="m" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="line_nbr" type="Int32" width="0" align="right" aliasName="a" hidden="true">
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
      <field name="dvt"/>

      <field name="sl_tl"/>
      <field name="so_luong"/>
      <field name="ma_kho"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU89kDcVe7YZKVo/FnBo+z1GqamSWvx8Ao/C4ncWOPE0jjyhR65rPVj9UQsPTeOhoQsl5TtBneYjkr3cuKbU6W9o0KIQrct3Z5wwz/cR1o3hLnRrWdc1TT/aKPrZUGSqxEy3A39A/ANaqYok5ZJxlMNskoEVP4El2b3frP0IhorMOqdv+QzTLB9S25Cww82hVAFPp/72Rw4MZCFgZdH+W4oGztBX020BVmRd3b+9umfAA7CLH3v+6tFAuRGUR8f6TRo87iNnpDzBoJBFR4Nx4tIj4eIFUfF/1iOtfLWRmEee+tZ5qbBKMllxtXs7WQ+EfnFxe/lTFnN3T+WALEynx+JONuQImDtmi+ihBZRO0lXae</Encrypted>]]>&FilterInitialize;&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPv9h/4S8TqSIFwcMvgZHf663UT3S+LKwalpKmkusN61Ko30S+jywclTq0wyqw06jgbI4w3ojVPfER6NM8WnSlfsUgoPFg8iX1Cz375lgmDzoXsjo4jwr4qsW6dF4bysrJY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaOtLj9q0e0vQsYddq0deyM2qsLuGw5fzSkgqFd35oMjsHfRGPb5UMpkZenFLlvxzjKv0ZW3q/xA64i60JLOh7gjWXaR0KdtISwpN1z5n+wXe8w7GB7zG+fpyPaxvJAwuU0SjvDgKz82Ie3/ENykOw2dOf7H8dUaWKr1RuWOXaxMr</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaKSlFBaRuu7AIfBeoXwXBlBVZbrrGNt4qbTMGBLPLAiK6neEmBBPB4j8nzYs4Sc2jrhr4K0rbi36ySd0pCqQifdotxT5CgySBeR3udt7uhhT</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEkYQvGilh2V3CO2KL1RGics3fWOQHH3RkaoNwAnoeNqK51PjGuQdwrg1iHej0/GJD</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8RX4QEKgYJD/ZRZMjGljL60PfH34UqUaKOZna5FvGe4q1OPkNj4CzwTt3wofOH3+QDCUtLZLsn+y6zqFTKPNz6jLGyajW/6nQGqLDQlf4URfOO51Ce7K5QVMufZrNhkqtoXJrEhIuLGX4fD8mXo8KPmuzFHCRXgs/QirS8m+SUejRoHxMIiEmcG2rDOQ7z/Ii4HPXyIUD0Aoa5IU9Iklwdc=</Encrypted>]]>
    </text>
  </script>
  &FlowMultiGridToolbar;
</grid>