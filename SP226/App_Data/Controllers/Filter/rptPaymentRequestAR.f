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
    <field name="tu_ngay_dn" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đề nghị từ" e="Date Required from"></header>
      <footer v="Ngày đề nghị từ/đến" e="Date Required from/to"></footer>
    </field>
    <field name="den_ngay_dn" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đề nghị đến" e="Date Required to"></header>
    </field>
    <field name="tu_ngay_tt" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày thanh toán từ" e="Payment Date from"></header>
      <footer v="Ngày thanh toán từ/đến" e="Payment Date from/to"></footer>
    </field>
    <field name="den_ngay_tt" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày thanh toán đến" e="Payment Date to"></header>
    </field>
    <field name="loai_tt"  dataFormatString="1, 2, *" clientDefault="*" align="right">
      <header v="Loại thanh toán" e="Payment Type"></header>
      <footer v="1 - Chuyển khoản, 2 - Tiền mặt, * - Tất cả" e="1 - Transfer, 2 - Cash on Hand, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" dataFormatString="@upperCaseFormat">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="status">
      <header v="Danh sách trạng thái" e="Status List"></header>
      <items style="Lookup" controller="Lookup" key="type = '002'" check="1 = 1"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="140, 25, 75, 20, 25, 55, 35, 25, 25, 125"/>
      <item value="110100----: [tu_ngay_dn].Description, [tu_ngay_dn], [den_ngay_dn]"/>
      <item value="110100----: [tu_ngay_tt].Description, [tu_ngay_tt], [den_ngay_tt]"/>
      <item value="1110000000: [loai_tt].Label, [loai_tt], [loai_tt].Description"/>
      <item value="1101000000: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110000000-: [status].Label, [status]"/>
      <item value="110000000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLWPBhoPNNoXSMxSSs6QqjC6sY0FGOgqWWrGneQR+nLu+/lYiBE/9dBgxmHH2pTq0ih3iQAy+N+uw+MdbdHVHJQa11fk73UpqwPBAxz6eVCTAnIHUKYR2Tl3MnI3sJxOW2P4u/VCqb3SYkvnj5VRxz7u9nN012A3klWEG4Z8IdVikkWfQC+6Kt6VCAJLFAaKog==</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xgjRNcVlicW/0GqjC+uzAs21DqZRSlebzU+dafAZigst0OP+WYT02TnuDO9+aLtKej7OZvguEJRCov8s23tVDB6SSBUB/N9uX9DI4Yz0S8tal83WzYPYk0lDlra8ZJ8H/YGwsp3d8rBCaKjqsHmHGB6y0Jcs7rFj6BgCMjrCVwe1dXwL+VKRoY54mCEfzcbioV7/fTyfd7e7j6Ox9s2bcXlUQ0myjgE+7v+DBds/BfNFdMokg/BiwMW0zE9bWqcyy/qKq73c2USO8OEQlGr2UsPY0pIjm0lscVOqokdCzMO6RP5zq+CjpxWULjQgCWcauSv9jFIGu2YEG3uH75N9FESkEWdao9PDmtSxYnxXVCFW7z4NGLeMMYa21YMKAUbos=</Encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>