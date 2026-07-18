<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Identity "ITPhysicalMultiGrid">
  <!ENTITY Controller "'&Identity;'">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'ITPhysicalMultiGrid', 'Grid', 'ITTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d65$000000 a, m65$000000 m, dmvt b
    return
">
]>

<grid order="ngay_ct, so_ct, stt_rec, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu xuất điều chuyển thực tế" e="Physical Stock Transfer"></title>
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

    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &FlowMultiGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJZXL6WAnUSm3i9F9d3JYyX8OJh+zFUcw6E2M9YbEQkjeAiYgxDkWbgW07LZrCv71lA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYvxNVOEvC/+nXdXVcZvcohmpoP4w8G0p12iKrhzYx/Vw</Encrypted>]]></clientScript>
    </field>

    <field name="sl_ss0" type="Decimal" dataFormatString="@quantityInputFormat" width="100" external="true" allowContain="true" defaultValue="0">
      <header v="Sl sổ sách" e="Book Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8eQj3iUb736H+IhLk7LrowRMBZT7CQc/L8NV4Qnyw+0r</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl nhập" e="Receipt Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_ss" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Đã chuyển sổ sách" e="Book Quantity"></header>
      <items style="Numeric"/>
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

      <field name="chon"/>
      <field name="sl_ss0"/>
      <field name="so_luong"/>
      <field name="sl_ss"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVT+G6T5DD7emsCPqoovpTchV9CuFQqn1zOolwz2DMno0Tpmm516sGzw+PBt6ruI3z9JyLfD8JoUhyvjNRx972MZU2zrqB0o+Vb7hSlg+KL0Q6pJPw4bjSXtcaS760sgSwzSIJFx2JyHP8uqsNaowmCBWWw9zoAWm5dlWz03riuht4aofALrW6+HXQdF2knYxOGb0L7cVt/bKe+lRaoPHX+FTVMAXt2WYIXbqFMEPLV19</Encrypted>]]>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU1/KV6e/Tf59zobH/UHTmkVs7K2xvubPTAT8KeRHDj3CKUCwl6poJpEaKhh1/tbGqFK+5Et/sg2ocu60i0Z5vVYz6zcRxbF2U5DT/N8cc2QmqAs9s69aQ32sLkPj1p4k7Jn9En6iaPRoXs4ZEPU5IfxjUJWNTKRDhHZT35z0igKHLyuvzAcPfoZmqrnQDuDtsSgWtUaGQPFTNI9oFKkipOq3CUCoExJksoG93zzT15rxRA2C60ESf8MCwb2dyYEGUw==</Encrypted>]]>&FilterInitialize;&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPtGqW6g3FPPv3BQ33bFcaJU2zzoV9pMt2aKGhWC5EkYkTzONkMAuGzBSqUTcraoDVmDwUoFzkOmw3niYI0hToQEFJ69XfzS35E8uRIJpKhkgRBG4iVFZMrihP3hx+HjTY0=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaOtLj9q0e0vQsYddq0deyM2qsLuGw5fzSkgqFd35oMjsHfRGPb5UMpkZenFLlvxzjKv0ZW3q/xA64i60JLOh7ggT7tyWqyvwBY9G0ZmdeXa19Yt2Ktoc5Fi9IXQMATNeSn6/KAYHvzQJ6ewHILer0SSNzcuhFybnR1K5tpPgYZ3f</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaKSlFBaRuu7AIfBeoXwXBlBVZbrrGNt4qbTMGBLPLAiK6neEmBBPB4j8nzYs4Sc2jrhr4K0rbi36ySd0pCqQifdotxT5CgySBeR3udt7uhhT</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEjtdNfv+HDzQ1TtwDoN7BpZvQG9tR3re7QyAt63N9pw70e0MeHK8x94rG3OyjivW1</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO4ZUm2ulyOXaTqpFRlajwsN02bUxuxuE1EbrLyHXXZDB3ezwKLu9PfN7qulYzVjQM0gawEPOVdxu7rtJDP0Gabe0z1MfuNWdjQvsHWkdS5DtM+bseF5wlD4+UqH8i2pyIw6D9afkZ/Nlt7vGwacnx4bZp0z2yKvabmdatuWY0GxQgzS9MbFMR2CRi5wSxYB+h6virXNPUI8NfqqmUjegBiFlRsn+r4cjwZKCvVJEnG2YfrHLHbuhWaUi6Mz+HRJodbk3REfbc7HTXmWvcWzwYfzHwR6kLPfK3JVWJ889m/sDHLpFArPNWYj+4qFAbg/4EcQ9ltO5sBOTKhMuFTj21d0jLI/VCU0OhVPBkc+W8MNXi7KwMM183D33FA4J+B9Uq9yAMhWnb9BIlJPQhFer0a7pLQpWdVM1rEtirHrmMzFbArgvT3+eFTG3EoCjRzMStEbzbh/HMkYUxSetEvI0jGqGC5tBVgeIubOrxmXpF0ubQK8YWTuVN66KAmXWXJ+N3/cgDORjXgz+sEEBmM9Sx0U=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYth4J5BMxmd1LbkDShOsttVmMBOLFDMQSfyo+qqg/rV/bn3SdRbseBnpmCdl15bsyRP9s4hjKz/8QZzGu7k6hVO/1zGEubD8i6M/q3CpcsMLe8zMVtWHnd6CFOHFKnrkc8HKaeCIVTMn8FkkSpc6It1TA1n/R4GX59bSWhOZDskaalZfqWsWZbJFPvajIoHpekYLReODGToO02Z5BXnm9tgx+5HD6hAYQLWDCa7bnkjzIy/tW+yjHXr1UtNYdfMTyPuTF2LALVjzcg9U6VU4hjo5Y0ztqp2LOOK0ckZ2jVv9P1qxuWUH5ScZXV1BZDjWpjZQgA4H7xYU+etCUZy9PBM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8RX4QEKgYJD/ZRZMjGljL60PfH34UqUaKOZna5FvGe4q1OPkNj4CzwTt3wofOH3+QDCUtLZLsn+y6zqFTKPNz6gy5KSk0iyg6+rzJwwPtgxTvqD9h2j86PHRJovkIHdQvQEri6YzRfSwG3NOdtmc+VXn3xreh7qNusx+lSdCkzEnq4trDoYkad4MSDpgRdJww25XZVBP4uH+Pz15WeOf5J1VZLmBjuyaQqe0zFysnBfO2H+IT27hw2YK3e3EDfAce/PPgoATX7dFI6mZtNMvNys=</Encrypted>]]>
    </text>
  </script>
  &FlowMultiGridToolbar;
</grid>