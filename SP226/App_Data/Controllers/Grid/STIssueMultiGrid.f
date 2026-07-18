<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Identity "STIssueMultiGrid">
  <!ENTITY Controller "'&Identity;'">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'STIssueMultiGrid', 'Grid', 'STTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d66$000000 a, m66$000000 m, dmvt b
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
    <field name="ma_kho" allowFilter="&GridQueryAllowFilter;" allowNulls="false" width="80" aliasName="a" readOnly="true">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vi_tri" allowFilter="&GridQueryAllowFilter;" width="80" aliasName="a" readOnly="true">
      <header v="Mã vị trí" e="Location"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_lo" allowFilter="&GridQueryAllowFilter;" width="80" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_chuyen" type="Int16" dataFormatString="# ##0" external="true" clientDefault="0" defaultValue="0" width="100">
      <header v="Số chuyến" e="Counts of Shipments"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8eQj3iUb736H+IhLk7LrowRMBZT7CQc/L8NV4Qnyw+0r</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" width="100">
      <header v="Sl hóa đơn" e="Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="loai_vc" width="80" dataFormatString="@upperCaseFormat" external="true" allowContain="true" clientDefault="Default" defaultValue="''" aliasName="case when '.' = '.' then cast('' as varchar(2)) end">
      <header v="Loại vận chuyển" e="Transport Type"></header>
      <items style="AutoComplete" controller="TransportType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$dmloaivc.ten_loai%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OtyZxkkwgSmbn6cL606aEg6DyfE+huY5zTQDcCXGAQu+UMuZ4VmnbWRYSiL6IsMaQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ozxWs2AI+s1UhAJMJlaRgLROWW8W4RFABjjVRaRvempYV5WKmWNLeYgKJYh/2p6t</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''"  aliasName="case when '.' = '.' then cast('' as nvarchar(128)) end" inactivate="true" width="&FlowMultiGridWidthOfNameField;">
      <header v="Tên loại vận chuyển" e="Transport Type Name"></header>
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

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>

      <field name="so_chuyen"/>

      <field name="so_luong"/>
      <field name="loai_vc"/>
      <field name="ten_loai%l"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSUzSzlDoVa8mPfTTgLM5FkkIslq58fAB08eDfTEMIms29/34JF69el8C2BifxlGa2N0/4uBAKkK3E1AduYJwcG1uOZx9QxSINRkxr2hsuhKT2Nr5f27cSvvkLkS0h3TLFULO8mrPAZ/UTHxkQoLZztlcMEsIPPfDIO/nFYoMM7Y6grj/Oxj/Ck1EG2RApNbYzBMQyCn9bXVQTHf3VTkb5LvFd/Pjbp7GrACI9L2gwyGHER1yib5B9oPaSmfBW1rY1kk1mnPmHbGc7T9ro9P+qQnOo/xbl5upn7LwwpNxeu/BVYr2G7exF3SsXj+DLU4OyfqyCj6S5jvMb1rYbfDdjUHywnE+jshe3llhZmHjK+QwbmK5yxlgJ9hHmPijVcBKHGQ==</Encrypted>]]>&FilterInitialize;&FilterQuery;
        &FlowMultiGridFinding;
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22R0DaGwtoYYf1WLRyQA4S/XG9E9kc6PEIrah5EvLRhDVontOnzkFGN0KUKeClqhZiw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaITgIfOMgocBmsTRXrTfkd+87IqH7xiSGj1SCz645Jsd/Jdnnetf1LKT7n6S5l3gOLX+sXJbTmHJba+w2VbZmHp1rzLQ+cOCPf1JF3w7KQYbZ8TQQMTz4ilJg7Dd5/fenqY97Mip5aPsY0E4by8hHPv9h/4S8TqSIFwcMvgZHf663UT3S+LKwalpKmkusN61Ko30S+jywclTq0wyqw06jgbI4w3ojVPfER6NM8WnSlfsUgoPFg8iX1Cz375lgmDzoXsjo4jwr4qsW6dF4bysrJY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaOtLj9q0e0vQsYddq0deyM2qsLuGw5fzSkgqFd35oMjsHfRGPb5UMpkZenFLlvxzjKv0ZW3q/xA64i60JLOh7giU965dYGIWSDrzOHKuKv5ZgUaCmwab6DqBzmJ4WqOaStjpzzpalIpbjQh8DLlYMdpK9zBzywnXryoNjMChVWu6Ab7ndRyILYNr0vMEegKv4hpLmbdOApBMEbqbbzTGBRE=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hSLEUac2J/t+0uApsx6EXAmV40DoP8SD15fN5wxmC/6iCBV4KmZfguecospNGqRWShWOIZYaVgOrTmtpp+xEjO9VWg1VKPKlOQm9c9mR/ps=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaPyUNH4vVNI/7IUQwyLsvClf5+RZ1hGBYCTizDdF4DsvXYWaef+p4HYnA+KtHaSNRVU92SWLP5sgnfMeU1xd5VIZzilvUxcc922pSb8z5ho40Dq1G6DdQKwrKtBvNlsVxA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hSLEUac2J/t+0uApsx6EXIyN3WIBTN25VyvCuOTmkGYO/DxqBXS3KraZFlsuaxenQTfy2xZ9C2OPbxa5SsleexGdHfdeSIXgCpTGa8dQIKOyJetC+Qz+Uhwmi4VvMnvR</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaEhZ8JB63+toukhtCz8WBR093WcqRdigfdV/w/kW7tnEkYQvGilh2V3CO2KL1RGics3fWOQHH3RkaoNwAnoeNqK51PjGuQdwrg1iHej0/GJD</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&O9ZgSM77G5UKNHAPeFAd8RX4QEKgYJD/ZRZMjGljL60PfH34UqUaKOZna5FvGe4q1OPkNj4CzwTt3wofOH3+QDCUtLZLsn+y6zqFTKPNz6gy5KSk0iyg6+rzJwwPtgxTvqD9h2j86PHRJovkIHdQvXYCvZjeFiEPh8vZh1vbLf5QUY8PMZ8rIb4XvICXH0E0ciMV4VtJCV+hOMalz1KEY0A7lPbB5kSKxQ42XKqUlXMTjUpe5q7QUM9VIQSZ4vh1kLCzzbKeAOyC8dkH5zSemQ18flS7yjWtBZVfRABUti5OtQs1ZH2zh1fg4yl4C7Ss6yrSxxCBs6M4J2fXGebPoA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ozxWs2AI+s1UhAJMJlaRgIAQi6nu8vI92ZI4Qq0S2Vu7b/PsOrnYkSXJY7Y3hdgTeE7V9d1vLBl4gO0GrSxcwicpnJGPmDk/6sPBr9syonadTyJfYwQIX6NlGQ8KZ36Tlj60lCRe1qyy50cm8dVImo9ARAH/DQADtVXYVVJQbAjHZxeBSXlnhTZvnW6/Ff7SZkOQUdz3hwPWxQAjMvEJLhb5d7sfARxGazOeNnFoQuk3WUpyPcxyNZ+VXgMn/5v55syxFDT7uoZMGDJHLtwLtkQ5aweBt4hLlpEki54P72J4LgQTktdjbuXrJ5f2j4shJIaiyV6m+AsInPCXbyASCUuLyurLOUvrSgZ2YrHAx10dOPpPT2qNqGZ7lBZeJijVyzEti/Nv5WZ06djgOh2dCg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hSLEUac2J/t+0uApsx6EXE3hjh8ygl8nDvrYRKiXNbQjmCOKC+YEmHmdy+t3mo9e9M6oB0JXv8Wc3FVEiMijrifUl+FBriPmPn8+KuQCns7qepR7HQ7ZBg2hCVgr28Y+P+fTGVIk8frTLtm9UzOaVYALOES3SWF3+HMLTGUI2PKG1Xj8O1C3KtfgSkdnnB2U29qTeD6DK6AxJ7pgudOs9dyoCoYPCg8eMIpTuxleJOOUUHzMRvzctcdLf37rl5quuEmDUktc70q/zbsmW2ilNTx9yhJtRznhkiImlP1BY0SEvSUuW9skqF2ABW/fkWL3APGFOZuo0VYUHwpDNAaCxjIEECq5+BAIhVhp0eLIJpVHz0mLJT7jJp1BZCrOaQ4xymAivnJM+xsl+iClL/6BL0Is6uc3sq5NVG31eTenzD1GstYJSkm1jZ1STE+AVanFS/K+l45EPS/3xpidHpuHFvH8jt5RgV2waCSTFMNOth3HKwa+AXBxQrB2kubtIkV5</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="TransportType">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6rbWL2fWd7KT+JNaNEFu4JCNsAsXu7LhGzJLzX3aKxK4/iFjKgwlxt8GTTXGZzCoOHycDCTXuyWOLpTunSoTYmfAoIVaqD7LQslG2pzOQj/Zkaif8eLGb2ZWNQk/ZGpo8=</Encrypted>]]>
      </text>
    </action>
  </response>

  &FlowMultiGridToolbar;
</grid>