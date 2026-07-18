<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="PR Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="PR Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="PR Date to"></header>
    </field>
    <field name="so_nc1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="PR No. from"></header>
      <footer v="Số chứng từ từ/đến số" e="PR No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_nc2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="PR No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="status" clientDefault="*">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="*">
          <text v="Tất cả" e="All"/>
        </item>
        <item value="0">
          <text v="Lập chứng từ" e="No Action"/>
        </item>
        <item value="1">
          <text v="Chờ duyệt" e="Open"/>
        </item>
        <item value="2">
          <text v="Đã duyệt" e="Approved"/>
        </item>
        <item value="3">
          <text v="Đã đặt hàng" e="Ordered"/>
        </item>
        <item value="4">
          <text v="Hoàn thành" e="Completed"/>
        </item>
        <item value="5">
          <text v="Đóng" e="Closed"/>
        </item>
        <item value="9">
          <text v="Đang duyệt" e="Pending"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
    <field name="ma_gd">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="PR1">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_nc1].Description, [so_nc1], [so_nc2], [maxLength]"/>

      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11000: [status].Label, [status]"/>

      <item value="11000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHshbHRnWt9v6+SGKKk3bqsZIQkOv7dKvRzM6jqpFbN5gzrzLuxWkqeUFuS8ID11UCkdh//lqUe0xobDwL5s3HXgAZCtFFsZl3r/m+bWSR4dI4w2BaDwj8yIOVhRGmDg1wszB1r/J2LN+RpEPkudwViVxL4NeRs2Q/JC70zxxMxJs1Zjv8lc2gztNNNCdyKBFVfE7v9viMk8uQZpomcsIfJb1/Ycbzck5wUyrhxrdTu5asipRVgxsoeAvC6EXJJy8f+Tlif5YDWsqtkWwDcGmRxShPMSR8dcojUbfkD3mzH06BMyK/R/ZE2wzLpvHyiD3urYpRzICqskKS29YurElpVTqRuMmBHdv3x9BJExTjTyC9pY4UCMAKDcjNXRBCsQ10f5ums9BDjg2qr38LTNP5IE8KQ9/u+cQtBnstP+Q+aXTbi/X8LPN1DdaLuvrrC3rbDJNwLO7pfYPoK8+68d7HlKuIiDT/JRHPON8BRqKXONcC7fqfTn9vUrKWuPsFPxYmA6Zghxa00WAESV6aNQ7jHK76TM9AuvhXMY511d9qsS4k4em2HiTdARd5cEvaJS2bo=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v1XRkAvKFtXYzDayytSRCUOK9Bbng5Qb7HvljPsV0n9uqFXSP/B3KFIvlHs9M5borDCdqxZUQHUuhUzGLswFoYtxYy4bCc+/s72MRxT0u6FUQ66o2QOhGdInjTwOTSFP0nsDC7h5nv5alkCP9Z2LxJlG9044+/PkoEF/3M6uC7R76xkHMPjafn2Gr6sn3mkG4l8FB5+92vXf5pmky4IVrq4/b5zK2yC0Ei2+OWdkgnKSY5Yo7IZvhR3o3nvzMhUR71xrGF/ApOc68D08m20DVy/lHmmIjGAGQCR3LmnQ78uUaoHHlLkxvMSGWpSk1jm/HSVItZbEM7LCk2HJuSLVPWeUzjYcOlZuhUEDsCPNV4GBNc9ZOr1/Pnm48djoVKfCJ1iTzhDrEzdpKjU6ZTAFWG5KByE1fXKHe9s0huUQulJsPpOJIHPyGcms3N1meFQW/ohZiBA+PChvyHlHtvk9iUs4ZTEEHP691KWlFWHMTdufjL6dd4LrbGQq7zhy8HIyFcPxIOUaytnQHolyeE6N/sOQouelcnMNB5yf8TeamuB2g==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>