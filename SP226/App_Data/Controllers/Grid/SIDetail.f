<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SIGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">
  <!ENTITY XMLGridStockResponse SYSTEM "..\Include\XML\GridStockResponse.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptGridStockRequest SYSTEM "..\Include\Javascript\GridStockRequest.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY % SplitIssuingOrder SYSTEM "..\Include\SplitIssuingOrder.ent">
  %SplitIssuingOrder;
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Type "1">
  <!ENTITY Tag "2">
  <!ENTITY Ext "90">
]>

<grid table="d66$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="DX1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c66$000000" prime="d66$" inquiry="i66$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &SiteField;

    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQooA054J+wew50DMntVAonAbqYhTTcCO+LPvypIOqklUz5gWARmqH6KMad4CB8YD7Y=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpl1MgJeW5LDnfl3Uwo+zcYb/mbSpl+HKDk0RRwQNroW0RcBA3Reyy1JEJLQm4Dth8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="80" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="(e.ton13 - isnull(d.so_luong0, 0)) / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="dh_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Sales Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="hd_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="gia_ban_nt" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Giá chuẩn nt" e="FC Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_ban" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true" allowContain="false">
      <header v="Giá chuẩn" e="Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" allowContain="true" width="0" hidden="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" allowContain="true" width="0" hidden="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" allowContain="true" width="0" hidden="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl xuất" e="Issued Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_giao" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl giao" e="Delivery Quantity"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_lx" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0lx" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    &DetailTaxFollowFieldCode;
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="ton13"/>

      <field name="so_luong"/>
      <field name="dh_so"/>
      <field name="dh_ln"/>
      <field name="hd_so"/>
      <field name="hd_ln"/>

      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>

      <field name="sl_xuat"/>
      <field name="sl_hd"/>
      <field name="sl_giao"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_lx"/>
      <field name="stt_rec0lx"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>

      <field name="line_nbr"/>

      &DetailTaxFollowViewCode;
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+xQY4Ac7ybHaSG+Lx5+tnMA/v1zen1uTZXHUMiTbUD+4bVd8Fx4PPMYaEy6eF5WGFy/EnYvTpX27FhjjP6GH7eF+FUOTY6NfFWUY7SzlK9AbVk/XwuVU5eYjczhkpAX9WKb1gfbAUZQmHfU2gxWwufycfjVy1/87y1yyC18XP9PuTGsPoi87f6FTH9tkCGJ9cgoajxqoCESPQUCYRRWB252hGLjhjlTLQASdAgV9qpUdy1gNb2uilfy5mfq1XxR6Y8FpuXupADKJ2kbO3yLFRdw=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDAtXg6235cnl956bTCFYnZIFpUIH4wde7N1YZfXn+/NmQYJG1PXYPmIzrEuySJvAL1zfAibDK8wno8AN+JmF/TNUI56NvhdmEkg/GuCktg2JbZ/0V0C8tPArUsC1CzbqlAzlb+d5ZTtdYn5VVuwyWb/d51NZAVrg+f9U9J2SmUnr3sgbVH3CuKdNo3GvXZXzPfeXWeb96AJ5OHJnHuma7CAib3qe6NwIMxfd/+YNprteuHmh9yxwMmeTnkgUMx42Zhz02S0fKD0VXLBk3f8TR5nuXYFmsl/lRGRlQnRqekfJuVd4KcqM8zwG207XyY6InaMyKqv/4loj1c1n5lbOsnT0R7SsAkpFBFgygOFrX6SQDvYtRVSGcqVAdfxfZiFLldq7V8F5dJQh/IhehhoSqBjSYHr9eaM1PtVKwZ1STX8BCio4P1W2tGpOjn42Zhy8ruT0hp5ns4o3aZ3jrx6DMl3xv6Wfa3UFjzpRXRBYcuMGQ==</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGquFNDqn7QPyNVX4Cdd+5jnN8DWFIMbdx3k5Uo8sXidAOSskqITIR6UYSvt7mzYJRJt8Ndp+MD0DEkARQHvZtwfeXOF6Lbdx1cCccwzRstwjyqIopf5pvldKdUe2gasgm/lZ2/5H0FCz38TwtDmAut5ovUBogSkOLLNx0Yz/Qv5E/wzkhdX7jZE3HlNzyfwW3V8ZOwG6QDn0m2pPuf2a+MJheBNjqt3l0bEhj8SZ6weBnvK2oUJdKdtwh9ENiCYYSedjwxXuCZKxst7hP3/fit4jq7tF2rs9dOHIN2HOq25+60Cv5tGC4YFQ3z5RBsM4fKgmItWq6IneKAaT7cNS0qYBxSigyIpax4a9MkYCJIyobA9GJWxNkWy0YMfKNRRpuWld5mYt9XZmvOz9/tIpdEIIHPisNY8c0+bTYEvjSXGc3IE5N6VV6CzBh5+9xo8hAMcw13u2l9CY1ApWRDW/yYOmPpGLEduBzrol4iQpDI5SCGKaucLD2rKeQ2xPc6p+ZqbEhU1Sk9odoSFOc/40sNhxtIDQ0zj9gKMTZa6BIgPVOJx+JdpuGmNIIgNPTAagHExhlucKAbVht3pkfSarRDUyGtPA1cFtkzgKuzH344eUcui9GFfi0YUni41navt8OUouqA2kufsZk2ei+ICr5FS+vDGfe/MU0zP9Rm7ewlrevl8PKyGZSIPd3qH1PQuCBlbNtVFX4crnmEw+Ni49Zl7JNi1wP39YIVSLcR2938tyOBSuQplvU0usSA2DfnJxf8GHLD+WmAoM77d4rRYf43acvhEVG8ExL2/8kBBXWxPptNChWj9lBDAlH8TR8RREungbDKuJZ5xXBBkOCX6sSuCAPrRafx2ADFJ3lyfGosHIIi+M4Z5d090E/4X4pKitOVt3CrmW5cCoZf64KAV6E6FHlNUJ8qdrwtbtO+Lh5HkfYiG17l7kItORk5oqDk/cgdw04C14xO1y9XFGgaAwEqsf2DnzJODLRkH5e4NuDv3cAiWaR8/1A1t3m2OGrlbSykBK+zxhWHk8UegqZeW3eik/mjZt4VT4+wVtHFaz96Yjy1axRc1Wy8Pxhog5X/iME7cwxuMteW6AMzpZKVGA1M0z4/IhsRzkwn2a438dQUVShFZ+FtZhhQJ2eXanuySkNnTyX3LvUSBL8yfSzvclic3v1CTKjtwRUrYcRwcEkeWuEWMp73f3k9MLG8gObFIAYG/1Nls7lXmJNxbK3TttRycfv/OrqUtlDhtWPiPCzdXzz1dNcyBAbcAv3tBOZCA9eIveflXnP4Y2qscqpk2o+eUZX0Ch8jNTwOrujLmznJEcQ=</Encrypted>]]>
      &ScriptGridStockRequest;
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDoaH12GUsmy9u18Y5c2O/JD7et0clHdllpR2oMO3iZ4F+p9l+MYLXT+Kimcps0LLr8wHG9jwCpNOdn+sTWRWKQL9HJd0PIr1DsIY9C6LgOh/ayeymm9kNb0I7NDYCgh2Hw0TCFc7dzbzyQJ623pCjpx+cwL6ELFQ7FV8sHOTBPklkIlBDed/SyQH1TQVV3MQjv4pCwwrHcOcLpo2pd/b+qcFzbW4BHdNQpJQrjYLZUxbGHr/ItGKyaz+SgW6gwE39vkah6AQZepCTakzP2CuUR7HR2NbR7PvYgq+T2V3jDMqg==</Encrypted>]]>
      </text>
    </action>

    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeP8YubHGdsHL4F7ebTcT1gq7tOzEs71LfwWDo028OAlEObL/fNTdjgB+WFMget4gK/jV0igO78X3SJfa9eaFhUQ4DP8v83cgHw+OcO++FR14lomj7VTy9/spQQsPbBFN88fcW0ZKfpf/+nvb7QboEUKkoOf6fABjFWFMwxBUaKRUNq/xNH/AubbKNxRmBMBjj8pFF8v1UTNx21PJnyzugSkMIGCX1ypUimQIhIz1pibc9NUGpswIIOduEOCUVo79tfmFiEeg2LjC6sNWTPlk44pxKl8iqHGPd9hWpghittZsx572YNNbYsHyU7LRRWzC7dErUhnEn3ihmT14nj/+tgQEVgNwdWh4YrQ/GMIlJCI/zLQOQykGdWDDTwsY5kHfGU=</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUCHYmW5xFibYHzPKvwuOnUx0txOcAAifNVGAzA5BkEYyVyUZRRKO1XC5iOiN1T5AXM=</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e7PzRebm8TcXrldjKa34mlcc1OkOZChRy34A9X9uxMwAMFDuMP5Gcdrf8Oz4VJQ/T5i9vOEnQ14lBustyg4i74yQIdHlubfFAULxYI9c21hHietrrQ8eMhw8My4goLpkOwYeCh7ZU/IU/1BtjbUTPOiBuaiFE5LH8vlVajqqpz5r+UXzkZiMqXmfruHv7/C/Kg=</Encrypted>]]>
      </text>
    </action>

    &XMLGridStockResponse;
  </response>

  <queries>
    &XMLGridStockLoading;
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6HxhnS8rGXsILZQU7MG6tihTqkxU1cqCt+DhMnIAxvtiVx57BjcQDbAUJEh8YY8WcO1qpdWa9pVuBxk1RvOxgKd1KkZvc3+Vkj3M9TCsMXCvMZVtfPbag/RR1xwo7o4q9NSfvqQHeK3kjlrdq3qLZVswbwnk0PADJBkezvch854IjdrE0qAKwx/tqIaddZAcA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Generate">
      <title v="Phân bổ$$90" e="Generate$$120"></title>
    </button>
    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10">
          <header v="&SplitIssuingOrderRetrieve.v;" e="&SplitIssuingOrderRetrieve.e;"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30" urlImage="../images/Menu/SalesOrder.png">
          <header v="Lấy số liệu từ đơn hàng" e="Extract Data from Sales Order"/>
        </menuItem>
        <menuItem commandArgument="40" urlImage="../images/Menu/Invoice.png">
          <header v="Lấy số liệu từ hóa đơn" e="Extract Data from Sales Invoice"/>
        </menuItem>
      </menuItems>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>