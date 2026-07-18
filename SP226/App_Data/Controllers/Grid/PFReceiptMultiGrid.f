<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">

  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'PFReceiptMultiGrid'">
  <!ENTITY Identity "PFReceiptMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PFReceiptMultiGrid', 'Grid', 'PFTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d73$000000 a, m73$000000 m, dmvt b, d74$000000 c
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

    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &FlowMultiGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJZXL6WAnUSm3i9F9d3JYyX8OJh+zFUcw6E2M9YbEQkjeAiYgxDkWbgW07LZrCv71lA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYvxNVOEvC/+nXdXVcZvcohmpoP4w8G0p12iKrhzYx/Vw</Encrypted>]]></clientScript>
    </field>

    <field name="ma_vt" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="&FlowMultiGridWidthOfNameField;" aliasName ="b" allowFilter="&GridQueryAllowFilter;" readOnly="true">
      <header v="Tên mặt hàng" e="Item Description"></header>
      <query>&InsertCommandFilter;</query>
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

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl hóa đơn" e="Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" allowNulls="false" aliasName="case when m.ma_ct &lt;&gt; 'PNG' then isnull(rtrim(c.tk_vt), rtrim(a.tk_vt)) else rtrim(a.tk_vt) end" readOnly="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk nợ" e="Debit Account"></header>
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

      <field name="chon"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="so_luong"/>

      <field name="tk_vt"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="ma_ct"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4aq1OdMI4KjJO28hGbp00rfqN74fgmGtWkIbyQS2t1NmwQ0/RwQ75PKDQbHMsyigvJzAjRHik1a9GhNYldfet+g=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLbV4u6YvLnka8xYVMCkXFZlxc9Sbr0ycKa/TVoTeftTFbrYmPskKnLMDeF3m5JtQQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQulWjQHXAKI0i20MxyrQnTEn+R0tvhhoSiaRBHniuLgxbnp+MDO0pdW7jWftOxHoHbA==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDENUukDnbLmuenxj6SzjlM9NkUbgBHFcxfb39QxRbAZBBvtfkj1NgYZU/X4BthNgA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAt4Litxe/7Cd6kPazumf6dN5dnr/23k+AKurt09LXWj6ch2YFMawqgINfN8ekWiGw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN7sb7mZsvSzs5rw7AWjh2S9nYSoy7HCJ1hYK/tARoDlXBvQOEyce296MiB7Iz34Lg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQunGf0PE+0tJZaP5SG9iRZnaBx5CyYa7ZOgSAN6LaJ5F7OQoFZrMLmbJq3vsHrEHCMA==</Encrypted>]]>
      </text>
    </command>

    &FlowMultiGridCommand;
  </commands>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTCAYBOkChj+N5KHrh2dmRCjrfalrZWc3OXysxnVZyy0xTQjfFhsPT8R1bQj3hLuEfay9/gm5tNXZJM9234RNIegGIXCaNBs9Qb5K5sFpOKyY+vD+iVBR1qGJqLETJmPsOLGTeQ3QOwkN8+Th5c6NwciFjVc6jQcOMJIzixFgsUgpjSuuJMj9vP6wkYT2d9yLdkdhdke395zj39q1NuCUo3WbKRNxAEj+etKipA8uWWIvjvtPVlnlMCZUREP1fhiOXdpftkFZIRUIZQOYDrbOCggeBShdq3v7OUM8UJrLTxdXU5BbJGxm0kSwh8+jUjxJHf3wO2jHnAA42OiyGJFLkCJ8DGs9SYixdJPIKpVnsNjY3EqXSwmqVxyaiqv++vHmDwOSRfvDxBwtmIMQNpXAvGbpoQ4KFfGqN32Dh1yzVPpkw==</Encrypted>]]>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAuaBUY0zSqvKc5aL29wUuJnnflj0bTKXwFt8nGzS7Ze4S3PIJdViR/IkPndxb4Y3CyZ4w0OdUwnSz4yRpPaCtI1ty7Q3LdUUgxPvQCmuBIpO7OqZkWEkQczV/bO2DOgX9lBHBKNSZQQF9ncZpEj9xaw5zYTBTYgW2BwKAt1ggPurLBUPhfqmBFscIIoBtTMNvfrSB+DPn0M0lMRA3GDQ8ZBchBkoCm3M7t3vgM024BDqk5cghwG1bsj9kssACdb8ZzA8ZBbV0cYXVVN/CxQuF5WnrjuJiVrWK8AMr3sWP4H/CaHLVvcyDYV7EYuB95PS7qtgsB/rKSL7Ia0XpxXqohOi3aqgrt2TZ6wh4AP5mfe6d0SWj3slrraszhtY/jabWXTH/uXTg9keLmzjQSxrhEXNW9zd/NO/UgBO2pAUTtoTU+tubuW7QZ6Jrr/cKufcWK1znn3UBPrSbDGI/k8n4nACxPRonUfLeIPyR2dpn8XRw8+xh/BnML/WSSRnKS36HAydLWDJVLwHcO5Cx60POq6dfCljHZ2x6IqxdhxV15Wr7JaqeyAUOoLNl4YL9+T+orqB4QBIY8Mx1BHu6ABp0Rtp85SrblZC/PjRZd9BhDbQa1/W5yFzN5ilQN/OpVj3zTNoh11r8YeysOb81xDt5q2DGplL809WIJ/VE7+ZAmE1zXtdYLzwuvqdeng+ej5J2x72itrP/UG+qfZMOGmq60g27e50jHYPsYcCxmYLfyRRyFiQ/uknXN6LfBgIgZIdN7byOdLE2lnuBFN1AWxIv+jSmB2ze8mp2bYikWKgyGehPs3ZV4pXITnbYQNabXiz05ozJU5C1Vk2yPDirQ/MsjewR18oYtfFuf/2IjtxgvvYz/uXHy/UEdk02TcF3y6FBTgnhfnYxPD1Fq4nyt78fxfzPUxPFK4eAOQnkmVggRzfH0bCFpOwDBDoT3HjsCVgvzWujCT4TnFg7ENcFkJsDm4c5EndktUf31QmMaVXDiwImLq9hCgPV+HjYaADdFrpBPQvK9poS9u18NxuKZxumLg==</Encrypted>]]>&FilterInitialize;&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPt7DIn93K6IukYGJG5XqBEbelCf+/FEj0XjARYZ6kiKw1/Ft20rMstertlW7AGCkl6+nuuDvarozc0heIkP4A3yRBQA6TrrmIFJCSA4Yzk2nAmRofickDKzkocgKKHobg4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBB3T6lrV5up1zAu9q0aBEX6AKrYGMGSeruJODuJP9z1tj28T/vd0DKFFLpFtQO5IvpuscCp/FNkR6XgVgRY5/JAKSe2ZQf7JxvDSu1/Qum7SL6HhbASSx4QJV0Uk7h/r8hM+TbYz9xdKJQRd6Py6vDcp6x1TB17ggva0cKVrzeZwMAI3wPAP5nLGI9ZBIemgQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBqIFWFGgqBcnGQaZCAV3xh7NkqtMU1OEC4Rd0w1wX+uFM4AkvLK7tAeMZiwVNtgD5eiM7IhRmzWojiF8E0MTjgrsM2gP00aTBfbUO76m35Y</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEjtdNfv+HDzQ1TtwDoN7BpZvQG9tR3re7QyAt63N9pw70e0MeHK8x94rG3OyjivW1</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO4ZUm2ulyOXaTqpFRlajwsN02bUxuxuE1EbrLyHXXZDB3ezwKLu9PfN7qulYzVjQM0gawEPOVdxu7rtJDP0Gabe0z1MfuNWdjQvsHWkdS5DtM+bseF5wlD4+UqH8i2pyIw6D9afkZ/Nlt7vGwacnx4bZp0z2yKvabmdatuWY0GxQgzS9MbFMR2CRi5wSxYB+h6virXNPUI8NfqqmUjegBiFlRsn+r4cjwZKCvVJEnG2YfrHLHbuhWaUi6Mz+HRJodY1mwCZz0y/GtSdc/8I7mOQTM+E0pOFHQMG78MQqeaiUX71I+5jp6Vw0Wzg8M9GttaMIV1De7eQ7FrLMSFvnUtPp3ogKYP/WzecSSzWXjgLZjELQPa819TWVo6wQXDOzXnKwJ3F+xo7ud7mTrp4C4w4gLSosOWtuAWBSDk+AMd2+qGW2RXENox42avUIJG+pKKc3E+Vm1q5Rd3SknMP1IA0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYth4J5BMxmd1LbkDShOsttVmMBOLFDMQSfyo+qqg/rV/bn3SdRbseBnpmCdl15bsyRP9s4hjKz/8QZzGu7k6hVO/1zGEubD8i6M/q3CpcsMLLDbwO2boSRD6DYWqi9ji5ni7qjUdlGOnN99eH7RnNS6nkO8K+JsSkgeJGCJQD3fxK0+vr1fCXt3KtUNVFjc0cvs8ixLdbGGIqT8k+rX7+/0=</Encrypted>]]>
    </text>
  </script>

  &FlowMultiGridToolbar;
</grid>