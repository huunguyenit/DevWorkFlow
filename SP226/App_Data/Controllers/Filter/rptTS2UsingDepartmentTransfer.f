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
    <field name="ma_dc">
      <header v="Mã CCDC" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp1">
      <header v="Bộ phận chuyển" e="Source Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp1%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp2">
      <header v="Bộ phận nhận" e="Target Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp2%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp2%l" readOnly="true" external="true">
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
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
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
      <item value="110001000: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="110001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110001000: [ma_bp1].Label, [ma_bp1], [ten_bp1%l]"/>
      <item value="110001000: [ma_bp2].Label, [ma_bp2], [ten_bp2%l]"/>
      <item value="110001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="11000000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI5Jt6Ho5OA2AaNQZuURpAKRRJnPl+gUphPbMI1djNOqlqkyz6fTkvRGQ3d+CDZacEvAbFAtobd90bu18rRvU6ezio2iYVGbsaoAJk+zIbu0n6fWL+bAi4un2e2s8LxIkpEgtJtoTzEyldziZ7MI6aHp9o6/y7tXsoUNI4Wk9OtLjAct2f4EccDmhOkoqUfvQxugtVFLMPzIUFiqHz14gpdH5xwEivKRUYO04hl09s2K</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6vr/CJ7+SGZ/ownc9aCkOi9fWvAyWho1zqYJesHjjyjFC4SFxuI1Nicaqwn1qEjBVPs2sUAOQBqiNsq5HURibJs++9AE0cuXUjL0mmQ12ZbQ2NqXDqwRbbIFy314wAbTIGxfora5lhkOYr//jh11Wx8oePa/MM/dMgZ0C0QVMhsiESINm1wNwNA0Pk3O4I5EYgSb0dufb5+YUOF9SnUN2mXWYMFYBDWXdweTUO7JoukSk6pvSlHBfwFwgv5XxmcbX1TrfKrlKTjgIto8ttHr0fwgdbhtxIccAn1iZofMwHbQ4okcnIFqik7E6ui6nxwRpvHc2+BSppG4C/amlRPZHj6Tq/j2lKK7vVkqq6kOq0Vw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>