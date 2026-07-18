<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order"></header>
      <items style="Mask"></items>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="" e=""></header>
      <items style="Mask"></items>
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
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 25, 25, 25, 30, 70, 100, 130"/>
      <item value="1100010--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="1111-----: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="11000000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tnt8stUso5lOkQQJFx9RJgQXQbAIwCSQdpHAfimP97Nwk0G7EE+Q33t+9kyDEukCxvHvQJZN1J84DrdMUq/j558D3idQH6+K0UByn9w7NOKjDo35QiqLgZ3unjuCVuFGf5MXFf6dHqJYTJrCC0N1JHHN7R0JSM1hQR8es07psi9EEGjUHvaJEeqryp/wz2pGq1UmunuEUoLmPuyYFswB8ezID0UC6RlEuyaq1RRLHDFIBFVhf/bELONcHqvKRtnPShEdOoAlsAHJyQ5GfCKtxCxWIgGdwVOgT4JZLYSKm7ve7d0W+9pDsCoCbg/lC6hQD6XiIWReHYLIQOUU4X4YozERNrHQZxuOVr5J9nfQf5OcBmXqZW0NomJ6vKmpr2+WOg=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EX+nmf7EB/LI6C1+yjwx9mI0KiftxZsqI+iHAn1M3wrYF8p6x/72sBFtmGRYp8emKE0M0ZKo3OHxOHY+RF0o2ncOESE/n+g9on0teAUepb8WwsKcchfurjDkh/hlDN5bKP9PtNR2F6Yp7mMAqL6bCbX47wO5ALFYI0/ArN8lwIBmapnhIUO4OBod/OTOuLBdEPj0sE+LOD/xyf4WFf0TrAT2/6oNEN9kVFEJhm6lchdsH3tiifi+0yii521V7iqslBYQqCEBQXZmelxpIuClw2gG4lG8tBVU2fly0aVUjEYYzjeg+uXT43L9I+wTBceUa/S9GKTdBMEzPwwHMFQVdAw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6vr/CJ7+SGZ/ownc9aCkOi9fWvAyWho1zqYJesHjjyjFC4SFxuI1Nicaqwn1qEjBVPs2sUAOQBqiNsq5HURibJs++9AE0cuXUjL0mmQ12ZbQ2NqXDqwRbbIFy314wAbTIGxfora5lhkOYr//jh11WxXYCJV9pv2sesKOtzR3VPTHcorMkKTFdInzDjJ+bs678wuKo/bvn5mTFi+PCt0K6y2uKqyVdapYofZmMmrbPxT4ZkZTIFHDu4PpwFVb8VR+VSYjTQA82CBSDMlvzTmFqqIFRNC8ttGthdq+VjS9Mta031uw/URvDC28jjZW6vWgOk3+R9jPQrCNGqjwr1Syq5mk7XiCpKZrL3XnyapsJ5a8IiPl/vyB94ZZ6sGFdYw84=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>