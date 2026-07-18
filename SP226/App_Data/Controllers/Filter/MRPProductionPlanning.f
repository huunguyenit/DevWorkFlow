<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vmctkhsx" code="ngay_ct, so_dh, so_lsx, ma_sp, ma_kho" order="ngay_ct, so_dh, so_lsx, ma_sp, ma_kho" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số đơn hàng từ" e="Order No. from"></header>
      <footer v="Số đơn hàng từ/đến" e="Order No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số đơn hàng đến" e="Order No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_lsx1" dataFormatString="@upperCaseFormat" align="right" maxLength="-109">
      <header v="Số lsx từ" e="MO No. from"></header>
      <footer v="Số lsx từ/đến" e="MO No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_lsx2" dataFormatString="@upperCaseFormat" align="right" maxLength="-109">
      <header v="Số lsx đến" e="MO No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Item" reference="ten_sp%l" key="status = '1' and loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site ID"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="maxLength_dh" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="maxLength_lsx" type="Int16" readOnly="true" hidden="true" maxLength="-109">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101-1: [so_dh1].Description, [so_dh1], [so_dh2], [maxLength_dh]"/>
      <item value="1101-1: [so_lsx1].Description, [so_lsx1], [so_lsx2], [maxLength_lsx]"/>
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTRGLvbfQXntVnH0u+XEg3gA8dVijuXgEfA9Cl9Xx0AVytQiTl4YKYYG8LAJHnBj/BesjbXxdHedW5XE7ZJmDMbk6+vSifeLqvm8hSkkWEqRZ60dOpe2G1OIyu9eo73oCrTsUwrcAB7weiXuYzkGiLnGnI7i7T71B5VPEeP2V67cM4MBVjEsgLkA+D1NPL16t+ea0RTtNScPINRA+xrbpa3uYHipgV+xpk88KHCK1wv64U6WkLGBsmRtqSwFf0nHukY6G0Wsz1yg6gFfnM+vgFJUH489P4y8kpQLmhrmSrIOJ72XmRp5Yc+6w0CjNtW5UMf6fT24bAmpUkeGcFix+KtA87NOkqgvpvFnZ6j7EwA8OQonnHj/us/9psZza922YMVgXqMJq9t8AIehTUR5hSP0riYh6hJVr5ypSc8YMy+16QeeQ3GtLBe8NEfz5gps1MC651L8qBgfnDj2+6E6CvAxOhmJaDFEPZK22JnjUX3f5Vo0W448+S43f6SCUlzkAi1R66JjiN8NIzIOmuxR13KjBbPkZXrlvhPwAW5/tWHHi</encrypted>]]>
    </text>
  </script>
</dir>