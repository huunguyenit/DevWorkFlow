<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'TSRequisitionFlowMultiGrid'">
  <!ENTITY Identity "hrTSRequisitionMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'hrTSRequisitionMultiGrid', 'Grid', 'hrTSIssue'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from hrccctyccp a, hrccyccp m, hrnv b, hrcc c
    return
">
]>

<grid order="ngay_ct, so_ct, stt_rec, line_nbr" type="Inquiry" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh phiếu yêu cầu cấp phát công cụ, dụng cụ" e="Tool &#38; Supply Requisition Form List"></title>
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
    <field name="ma_nv" external="true" defaultValue="''" width="100" allowFilter="&GridQueryAllowFilter;" allowNulls="false" aliasName="rtrim(b.ma_nv)" readOnly="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_nv" readOnly="true" external="true" inactivate="true" width="150" allowFilter="&GridQueryAllowFilter;" defaultValue="rtrim(ho_nv) + space(1) + rtrim(ten_nv)">
      <header v="Họ và tên" e="Employee Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_cc" width="100" allowFilter="&GridQueryAllowFilter;" allowNulls="false" aliasName="a" readOnly="true">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="hrTSList" reference="ten_cc%l" key="status = '1'" check="1 = 1"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_cc%l" readOnly="true" external="true" inactivate="true" width="300" allowFilter="&GridQueryAllowFilter;" defaultValue="''" aliasName="c">
      <header v="Tên công cụ" e="Tool &#38; Supply Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &FlowMultiGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJZXL6WAnUSm3i9F9d3JYyX8OJh+zFUcw6E2M9YbEQkjeAiYgxDkWbgW07LZrCv71lA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYvxNVOEvC/+nXdXVcZvcohmpoP4w8G0p12iKrhzYx/Vw</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong0" type="Decimal" dataFormatString="### ##0" external="true" defaultValue="0" allowContain="true" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzBoCO82ZQlfS0sGaIPo20bpASLmMQj5fY7mgIY9zSkaV</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="### ##0" readOnly="true" width="80" aliasName="a">
      <header v="Số lượng yêu cầu" e="Request Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_yc" type="Decimal" dataFormatString="### ##0" hidden="true" inactivate="true" width="0" readOnly="true" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowFilter="&GridQueryAllowFilter;" allowNulls="false" readOnly="true" aliasName="a">
      <header v="Ngày hết hạn" e="Expiry Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ghi_chu" width="300" allowFilter="&GridQueryAllowFilter;" readOnly="true" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nv" readOnly="true" width="0" hidden="true" aliasName="a">
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
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ma_cc"/>
      <field name="ten_cc%l"/>
      <field name="chon"/>
      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="sl_yc"/>
      <field name="ngay_hh"/>
      <field name="ghi_chu"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_nv"/>
      <field name="ma_ct"/>
    </view>
  </views>

  <commands>
    &FlowMultiGridCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPt7DIn93K6IukYGJG5XqBEbelCf+/FEj0XjARYZ6kiKw1/Ft20rMstertlW7AGCkl6+nuuDvarozc0heIkP4A3yRBQA6TrrmIFJCSA4Yzk2nAmRofickDKzkocgKKHobg4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBB3T6lrV5up1zAu9q0aBEX6AKrYGMGSeruJODuJP9z1tj28T/vd0DKFFLpFtQO5IvpuscCp/FNkR6XgVgRY5/JAKSe2ZQf7JxvDSu1/Qum7eQ6j7FajQu5WYqFXBiGNukCyfPvheYc7USQCgV4spDmKL3eLblXyCHv3O1kaQ1kRZcztt10YaxqdV5HxosecOw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBqIFWFGgqBcnGQaZCAV3xh7NkqtMU1OEC4Rd0w1wX+uFM4AkvLK7tAeMZiwVNtgD5eiM7IhRmzWojiF8E0MTjgrsM2gP00aTBfbUO76m35Y</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEjtdNfv+HDzQ1TtwDoN7BpZvQG9tR3re7QyAt63N9pw70e0MeHK8x94rG3OyjivW1</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO4ZUm2ulyOXaTqpFRlajwsN02bUxuxuE1EbrLyHXXZDB3ezwKLu9PfN7qulYzVjQM0gawEPOVdxu7rtJDP0Gabe0z1MfuNWdjQvsHWkdS5DtM+bseF5wlD4+UqH8i2pyIw6D9afkZ/Nlt7vGwacnx4bZp0z2yKvabmdatuWY0GxQgzS9MbFMR2CRi5wSxYB+h6virXNPUI8NfqqmUjegBiFlRsn+r4cjwZKCvVJEnG2YfrHLHbuhWaUi6Mz+HRJodV5Ek4N5EppBfpv1KMe8idrHkmgoSvLUl9DB1LZqTAUrYeOIPAvCGhrvTUOCjPWC7kgvO2b8R461935ONl6sRMsHvDwT3twdTGvxaNRlK0RrWK9k6zh/XgCF83EUCYnFRAmNs79w9kxbkgkxorQ9vnXn3ISJySxke2K+VubQzSEDvvnoiVSldmLF0xYuqCcw9b6oVc3pqxfaI5nRyGEmEh59uy8Y8D40EQ4CWG1g6zfyo41Z66A0k3NaIVed2ex87yffAInscLJRdkvprN7qoBg=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&8eTvStEZyh3S/FV1u5fZYth4J5BMxmd1LbkDShOsttVmMBOLFDMQSfyo+qqg/rV/bn3SdRbseBnpmCdl15bsyRP9s4hjKz/8QZzGu7k6hVO/1zGEubD8i6M/q3CpcsMLe8zMVtWHnd6CFOHFKnrkc8HKaeCIVTMn8FkkSpc6It0TE/chvOkzOsByJbqwy0TpxQMVllc/54eyx0094vB7lAOLQPHSUfJB2RaP1Bi6KTlwY5tEDq6N1XnMN0sA3Rn2KUKEnYSKBEBiWexCHCf6/zFVDQa42y8PlWQx4WPinFbMbJCHu3xJGowLPU78JFGoVeGYt6gBO7jCnbXpFbYVOo/zSpD40nWWMD5+GXnlrco=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzFuWR7mJyEy/Y3JL7yir6xPyMfmFroYDuWqw3J/uhh1ZgRw75uSdrQA/FdMZR5cSJC8BK+L0Ch/sIhFTNtjBftp52qEMtN00cTHDRTMYPYKyFxhK1Yu3tRWWKEtAFzYTTfNpxV5neKRONu9s3RxJDzrUViFhIWEazLeCSjW3LySqCQ9RuW8pozdMZWEf7zixP0WEChXKkkWKNWUITkbQI+U5G6SrWZwKygzmfr27wo6PsbpoN84er13EMLMt0IykOg==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVT+G6T5DD7emsCPqoovpTcif0j+FTib9CETlhnabxgWNCxsDnCVnhfA8WBNbS/rINCGQCHD4vdcMzBVMf1Wea6ED/G6aylWGkufiSKg+2O4Ms3pveIAzH0eSuq0Iq24DNYe3ppw6mc3NPjxRjdBRZCJN4uIVJpuNTYkd4uaacispKCtNBSCJA8K7DR+pqUF4KiSMQtXD58CMF86EgIz9tOk=</Encrypted>]]>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKYWqJQ3V+xpdFsixmC2ovuZANGZy9xifgbjD+YS7MWEnugvjEonwZP1wRKhtgrfTw54T24K9ROk2jWoMxW98IWGiKYkJ7GDIEF/0WB0630mOqEhmOUvw4Tt8E3er0xgzFrML6OgJqzCO3jf6A2mKta/BtTVBWUKQ9nJnO1ji15froGetu9M8rmDvoPAbJ8VHE/OZcimxC8itmsszaGq86uKiQ74hHtWeKzR94YMa3pz2dWZvC+sMxF6YPMNKOCb8cDN7dwIZWz3FWiGhfc07fnTfyXqq8OCU9kt2UByffA0tGhlQvdFK1kF6FxFbVNETQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  &FlowMultiGridToolbar;
</grid>