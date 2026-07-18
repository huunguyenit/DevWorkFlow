<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

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
    <field name="ma_nx">
      <header v="Mã nhập xuất" e="Dr. Account"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec_me" onDemand="true">
      <header v="Vụ việc mẹ" e="Parent Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv_me%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv1">
      <header v="Nhóm vụ việc 1" e="Job Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2">
      <header v="Nhóm vụ việc 2" e="Job Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3">
      <header v="Nhóm vụ việc 3" e="Job Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"/>
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
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      <item value="110100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="110100: [nhom_vv1].Label, [nhom_vv1], [ten_nh_1%l]"/>
      <item value="110100: [nhom_vv2].Label, [nhom_vv2], [ten_nh_2%l]"/>
      <item value="110100: [nhom_vv3].Label, [nhom_vv3], [ten_nh_3%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI5Jt6Ho5OA2AaNQZuURpAKRRJnPl+gUphPbMI1djNOqlqkyz6fTkvRGQ3d+CDZacCTF8EVhat5FvwtS0+PgjtKTQHpw7JefIiZ0nn3rQ2HDvixC5LTQpW+QnQ2yG5rMF2IdkRUEbidWIFjeU/39T88IY0NtorVZ0nJBcG2RPZmG1uCrIKtVRqUQ6OQSOkQJcAXH2iIyTyWlBIj60Gb73fYVamnsKxm8t506+s4ZaLfp</Encrypted>]]>&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX7uLa74LvmOcrpSMcE/u9qtB8tG8K4D7gzK2Ro/zUOsWJk3e9uK00iy8q6jqPJdRuy2tMr38YHgOE0bKbsNg8i3SIt/1/4vRabdAObcW32UHT5Tjy4hBEkTPhotrtjVnUXYwWEwOq4WdHsVoxLwQZhC0VTI8KXgK3dPFsU/5GX8OwSN+lAXdV8KKffxeWrq8U4orhbxBay8OR6E2PCw6q1lOZeUulzYp7dmAenPu6r9fw6WUQdf7KZ0+bIazfE4xgktZ+6bI7Of74D6QY6961X2NqSwJSqSIl8dIIYZUFIuo9Lf2fS44Wga7/rCFXQK9UYf0GkayyTq23DEq2KpPs+J</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>