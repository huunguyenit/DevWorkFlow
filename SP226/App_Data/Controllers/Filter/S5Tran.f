<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "S5Tran">
  <!ENTITY TableDetail "ds5">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
]>

<dir table="ms5$000000" code="stt_rec" order="ngay_ct" cache="true" id="SF5" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_nc" filterSource="master" operation="10">
      <header v="Người vận hành" e="Operator"></header>
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca" filterSource="master" operation="20">
      <header v="Mã ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_px" filterSource="detail" operation="10" categoryIndex="1">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" filterSource="detail" operation="20" categoryIndex="1">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status &lt;&gt; 0&VoucherLogStatusKeyLookup;" check="status &lt;&gt; 0&VoucherLogStatusKeyLookup;"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&efX/jr3v03Fk0SvHuaYvC/PXhfNtV8iKTlgH+Jwug3jre1u9Hh6JhHPrVwzAzPGw</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_cd" filterSource="detail" operation="30" categoryIndex="1">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="ma_lsx = '{$%c[ma_lsx]}'" check="ma_lsx = '{$%c[ma_lsx]}'"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqB1mDiEvSj0xrbuFRzSmUmbpo5FpNF7qWC5msB7+XxsK0</Encrypted>]]></clientScript>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" filterSource="detail" operation="40" categoryIndex="1">
      <header v="Bán thành phẩm" e="WIP"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and loai_vt in ('41', '51')" check="loai_vt in ('41', '51')" information="&TableDetail;"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1" information="&TableDetail;" >
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="*, 0, 1, 2&VoucherLogStatusFilter;" clientDefault="*" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái&VoucherLogStatusDescription.v;" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information&VoucherLogStatusDescription.e;"></footer>
      <items style="Mask"/>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="111">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="1101: [ma_nc].Label, [ma_nc], [ten_nc%l]"/>
      <item value="1101: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>

      <item value="1101: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="1101: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="1101: [ma_cd].Label, [ma_cd], [ten_cd%l]"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="11010-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 330">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
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

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdkWF4iAo1/cjEhK5pkbvWkOjkCq7M5Ymx5M937u2XsF5xn7BISHsKgX9NvMWYmkDSA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxduSdD26Q3YZW9YbjXoFX3YaqrVnn1mdEPssk80SL4YK/1W9qLemUaetoH7/jSHWdWC1G+mCggsZ6EfTpz6fj+vCY/evFqzOkY1pvZwv+sdEr/ZeofKWE5JZQOEgsLQcVw52rb8GugtVj9KXPAr53sl+qZ9exN+/L4pWpWS6dGu1fxuTpnyIilkwlNTXxt5I3MkApBc8Q/CbzeKrFYGD93Gw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdv+f8zHBUY3hGiy7SGpalxpeU78UCQuldj/GPZY3MgzkVa7upB+BKEU1+PAGa9OxCsYhc0harmy4iTDpjs1QY1T5XTexVSWRSlY2S76Ad8dr</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdmRyxpg7pj25IJ+E4upUz8XAPG+LQmVTJFzXGMm6FcPKqHBAczbZadTXoJfJ/mNbEQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&efX/jr3v03Fk0SvHuaYvC66o4ZQqusyZRdrqFQsSfP3DbBP3uVCjcSOS0rv/SRc3JwQIRvf5B640H7ovIL2vLZRIZIliZvWN5jyuX5JAbBgZX2wl/1vkcFPEWnGYuui2QE/12Nk479I8IcwOilrRww==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqBwHdnnCvnP43J1OCHx/Z0ztwXmDtAjJ1u6mlAZOik7GiUENoGeE2V/eFrS3rgpUq7XxoqXYkMGOmHYemC0p/t23oNi3diZ0ClmS+9ZA7jKqr</Encrypted>]]>
    </text>
  </script>
</dir>