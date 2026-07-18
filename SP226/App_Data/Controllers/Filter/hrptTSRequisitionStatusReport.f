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
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" allowNulls="false">
      <header v="Ngày yêu cầu từ" e="Req. Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Req. Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Req. Date to"></header>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="loai_cc">
      <header v="Loại công cụ" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="hrTSTypeList" reference="ten_loai%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_cc">
      <header v="Mã công cụ" e="Tool &amp; Supply Code"></header>
      <items style="AutoComplete" controller="hrTSList" reference="ten_cc%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_cc%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_nv" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="vtr_cv" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_cv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_cv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1, 2, 3, 4, 5, 9, *" clientDefault="*" align="right">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
      <items style="Mask"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 0, 0, 130"/>
      <item value="1101----: [date_from].Description, [date_from], [date_to]"/>
      <item value="11010000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010000: [loai_cc].Label, [loai_cc], [ten_loai%l]"/>
      <item value="11010000: [ma_cc].Label, [ma_cc], [ten_cc%l]"/>
      <item value="11010000: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11010000: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="11010000: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11100000: [status].Label, [status], [status].Description"/>
      <item value="11000---: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9BEvl81TGPf+5d+1fhBEq9K9stLUUpew1lgD7QTGlPLXSRoLD7kgnX6tgUehqu8Q+lCvRVflB80CK+ITebxO0vRqGUmzc45a1ADOh5SfGA/M2XOobyXNyebejn+rWZHP61Fk8GNGJXzv+tDZEig75wzmnS53EIePUBkc+YrkqmFBhVK1Y1yKIOWdpRX+gRTVxP</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iP+uVSrXMdAt4vLeVnhT5AbiFOmBruEzSJAFQyXZPhZN1RJc86gcFKD5yBMEPJCMJ0e/tQWwY6QPnNX0PeK9guBR7l2rYu50ES7zKqCFKf1BkqvuMQurgXapXVsdEVvFKnNalPujHgIxqpGccnC268LcTUxTNze71b3M9yMlKKt7jxneIGgxXS41YDY+P1dv11MwLw0gb5JiIDlP0BysHDJ9/sP6ayCmxQsMZ+XZho0lY=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>