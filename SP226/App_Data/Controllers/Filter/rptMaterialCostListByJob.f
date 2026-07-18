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
    <field name="tk" allowNulls="false">
      <header v="Tài khoản chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="giam_tru" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Hiện giảm trừ" e="Show Deduction"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"/>
      <items style="Mask"></items>
    </field>
    <field name="vu_viec_me" onDemand="true">
      <header v="Vụ việc mẹ" e="Parent Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv_me%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vu_viec">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv1">
      <header v="Nhóm vụ việc 1" e="Job Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv2">
      <header v="Nhóm vụ việc 2" e="Job Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_vv3">
      <header v="Nhóm vụ việc 3" e="Job Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
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
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1110: [giam_tru].Label, [giam_tru], [giam_tru].Description"/>
      <item value="110100: [vu_viec_me].Label, [vu_viec_me], [ten_vv_me%l]"/>
      <item value="110100: [vu_viec].Label, [vu_viec], [ten_vv%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI5Jt6Ho5OA2AaNQZuURpAKRRJnPl+gUphPbMI1djNOqlqkyz6fTkvRGQ3d+CDZacCTF8EVhat5FvwtS0+PgjtKtH4YPYr7A9wz9S1gqM8tOhDti9zrr3jRonkF3CWiC5Hs1ecf4aVM2WKHt4aEiNE/5XNZVT4NCCUOYbCLOZhXNbQArxd0jtqyIcB7JFGt/23KPqlSID6JiFWdWMbODQmUKXxI5x5j0Mmfo1nRoDUdZ</Encrypted>]]>&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX7uLa74LvmOcrpSMcE/u9qtB8tG8K4D7gzK2Ro/zUOsWJk3e9uK00iy8q6jqPJdRuy2tMr38YHgOE0bKbsNg8i3SIt/1/4vRabdAObcW32UHT5Tjy4hBEkTPhotrtjVnUVOTdALx1TeotbpAX69IGGiybrYAGH0ziRNirkMRiOlUDO0q0O+ly3mSxJed5WGSE4zl6EHMNSjHs26COxBKrQk7shALs6/liCkPLm7vJm0EmPrYd9k/7DOWwejTQ16J25a5wtTzMx83KsnCoUE0RZiyhNtxrGf4rpqUA03jt37nAZN1IHkFqyDMGRkTScXQU+Tx4RfsJiqXePenquCV6jI</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>