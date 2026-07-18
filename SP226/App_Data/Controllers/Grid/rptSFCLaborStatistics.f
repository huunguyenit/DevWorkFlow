<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thống kê nhân công" e="Labor Statistics"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_px" width="100" allowSorting="true" allowFilter="true">
      <header v="Phân xưởng" e="Shop"></header>
    </field>
    <field name="ma_lsx" width="100" allowSorting="true" allowFilter="true">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ma_cd" width="100" allowSorting="true" allowFilter="true">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ten_gd" width="100" allowSorting="true" allowFilter="true">
      <header v="Giao dịch" e="Transaction"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ma_ca" width="100" allowSorting="true" allowFilter="true">
      <header v="Ca" e="Working Shift"></header>
    </field>
    <field name="xcode" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="xname" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Sản phẩm" e="Product"/>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>

    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_px"/>
      <field name="ma_lsx"/>
      <field name="ma_cd"/>
      <field name="ten_gd"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_ca"/>
      <field name="xcode"/>
      <field name="xname"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
      <field name="so_luong"/>

      <field name="systotal"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idjIfMpga2qNVb26O5Sr9YXz5H6ihMQsSIW7Hdn11Yi76jX+wB8FX6hcThuMS0Tx5peYXUz5A6mhr/GDka4PMPyRPC7mbYCcR8Sz1ufluVpmc5ihEcWGw/OSSf3YV9SK8293IgZQL7KQ0ezbqkIgTeVzblHdb1z+77HTJHqx1Y/ZgHxF63BBOXD4g5/5bilAmRwPps5U70CAU3Gmo7fbowM7k2SmoFQ7gzrnLv5oyz5Fh25LjviyH4DJelj4ini2+QkHLSEIHzViWty+FcWpCmzuUcWW1cZQpMYFc8Bt8n8Zt9PGTX7JrOjHj/FO7DDe/N0VDvw060T3LNicnRfIppe2+KhbxMOPMgsy0qM5b8syhmNhu+6fd3sH+EWAGVJopdYOGqDxwjAM2otUH2tfF0lnsIRvn59UGUABZtQnWQMYuPUSZUDty3gx840b8j3C1fZXZQJqHJD01zQ9mR81gtmH</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>