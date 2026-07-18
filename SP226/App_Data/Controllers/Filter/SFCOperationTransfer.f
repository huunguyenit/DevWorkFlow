<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "SFCOperationTransfer">
]>

<dir table="sfdccd$000000" code="stt_rec" order="ngay_ct, so_ct" cache="true" id="SF4" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="ma_px" filterSource="master" operation="10">
      <header v="Phân xưởng đi" e="Sending Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l" row="1"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" filterSource="master" operation="15">
      <header v="Ycsx chuyển đi" e="Sending Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status in ('2', '3', '4')" check="status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz1Iqcf8DCoHCYeanYdFHDueI2WVOC8KuHpTxmsFJNXtk</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd_tu" filterSource="master" operation="30">
      <header v="Công đoạn chuyển đi" e="Sending Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd_tu%l" key="ma_lsx = '{$%c[ma_lsx]}'" check="ma_lsx = '{$%c[ma_lsx]}'" information="ma_cd$vsfctwo.ten_cd%l" row="1"/>
    </field>
    <field name="ten_cd_tu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_pxn" filterSource="master" operation="50">
      <header v="Phân xưởng đến" e="Receiving Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_pxn%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l" row="1"/>
    </field>
    <field name="ten_pxn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsxn" filterSource="master" operation="25">
      <header v="Ycsx chuyển đến" e="Receiving Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsxn%l" key="status in ('2', '3', '4')" check="status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHZnx4mXQcP0q2pHCY0dSv+Yg4SHtFo68ryAljqBlLUMY9Vf0/+1nEBLO+rTJWbG00A==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsxn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd_den" filterSource="master" operation="35">
      <header v="Công đoạn chuyển đến" e="Receiving Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd_den%l" key="ma_lsx = '{$%c[ma_lsxn]}'" check="ma_lsx = '{$%c[ma_lsxn]}'" information="ma_cd$vsfctwo.ten_cd%l" row="1"/>
    </field>
    <field name="ten_cd_den%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt"  filterSource="master" operation="20">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and loai_vt in ('41', '51')" check="loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="40">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11010: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="11010: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="11010: [ma_cd_tu].Label, [ma_cd_tu], [ten_cd_tu%l]"/>
      <item value="11010: [ma_pxn].Label, [ma_pxn], [ten_pxn%l]"/>
      <item value="11010: [ma_lsxn].Label, [ma_lsxn], [ten_lsxn%l]"/>
      <item value="11010: [ma_cd_den].Label, [ma_cd_den], [ten_cd_den%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGC4wXbIV48PhkvsTtGPkVlij7kpDjHKz8xqvhz2dA3q</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdiiptXRl/4sFRB4FwiUr4SJIBwMt8qkFvmKKO3Afmn1RuIuTYletZhhPSbNELoTB0A==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdkWF4iAo1/cjEhK5pkbvWkOjkCq7M5Ymx5M937u2XsF5xn7BISHsKgX9NvMWYmkDSA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxduSdD26Q3YZW9YbjXoFX3YaqrVnn1mdEPssk80SL4YK/1W9qLemUaetoH7/jSHWdWC1G+mCggsZ6EfTpz6fj+vCY/evFqzOkY1pvZwv+sdEr/ZeofKWE5JZQOEgsLQcVw52rb8GugtVj9KXPAr53sl+qZ9exN+/L4pWpWS6dGu1fxuTpnyIilkwlNTXxt5I3MkApBc8Q/CbzeKrFYGD93Gw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdv+f8zHBUY3hGiy7SGpalxpeU78UCQuldj/GPZY3MgzkBHX3n5NiOtifSshtf8OV+kPnhRCSQUAILSiugOHs7aXU3zA+EzAWmLJqxyYmEtaDnvfPfMtMSLHdj4jQQSGkdg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz7IJPY1dw9ZbPG9OOD1WBSDeiEaTkx+S8treyepzULuBhPYkULYISZdattAn4SywFofepShs67/Dd5vvs4yK80wU+w7ngQeZ45o4eIGtoUH71HWtfv4sPdndkVajR1mubA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHZnx4mXQcP0q2pHCY0dSv+ZtA5be6+v2w7qKJwXDz3m1Gb9ccD6lbEQtXhvsK6EqdNkua6fWXn0dBdxKTvZkntTQ21a1M6I5A1I9b2os+mIB</Encrypted>]]>
    </text>
  </script>
</dir>