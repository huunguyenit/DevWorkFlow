<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="voucher_from" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="voucher_to" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="date_from2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày kiểm tra từ" e="Verification Date from"/>
      <footer v="Ngày kiểm tra từ/đến" e="Verification from/to"/>
    </field>
    <field name="date_to2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày kiểm tra đến" e="Verification Date to"/>
    </field>
    <field name="ma_kh">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101: [voucher_from].Description, [voucher_from], [voucher_to]"/>
      <item value="1101: [date_from2].Description, [date_from2], [date_to2]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Cr9P7DZviRVm8tZVROSLVcHdXfoW+RyynkxrX71SyGEEp9uxNKIqWgX0+L3aPlgoU1DqNyz4v840/WZJjyMpfqfctoV5Ftqb4peorLcp+EeqLuawTuLrKxz+6SgGnt9nSwsAQE9jIMEWFWugdsqJ+0ODRHTXNhg0g5SYcg0tGu2eU8XmToQvryNl/GTYc1Yw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg54XptFYhHiXQVmQSlv6GHTfWAD74/x1XdvZwCPCgZ6kTCQ7hfO1ziLUxwGjmCM/hoN3S+2zo3UGz6lZGHx96mGB+gf03m1dFAAvh7LE2bMIqCWYZ8WXSCf7SJI2tRVU0aQ5CBqISV3rWoKUNYfYRywZi05nNoeNFk0jjs0szJzexHi+Je/90DLQZqulHGKAqZ/gIenPxZe4hkc3wck2WXnSsmPkmA1CsznV/hZh6XTbHg0eDEHofEsBCtDTugPWyxR5Y8PBAHv/F0n9Y1WhFcy35eX/3daheTeHncnCDT45VYPVB8aJMYtLp6m+x/840bREkJVtq+4c2tTc+Da620iR3Ex6TFiIzNkpiprEde5dhDNKzSyBhBOcLjjMzS2gKdIKwJ6xd5L2ZWH7AMdo4waWDxpWCH0ASGHj1N6J6+ZB</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>