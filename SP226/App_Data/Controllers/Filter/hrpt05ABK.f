<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0592\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e ="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ns" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_ns%l" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_ns%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
    &ReportCircularTypeField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_ns].Label, [ma_ns], [ten_ns%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKBqqJeBFhuOpLkf5Z3TI1Hz7Dk2lSmEF1aYHdkgoZaKvABoN2dWcWYorpcnzax8PpDyUxDFU74/I0sJ67HFWitSobjBzx8TR6wbeRVXOeLJTuCWGM+zx9nBydTcyvLEp+wMjJy2DHjHMJ9rO0D0mWk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R7GYbFT8gV//NRBlfK/VHvK3u61G9X2E5UhpO0CV5jS9UARBL7f6GaFA5p9IL6CTjSigJQUu0HBtt1/92AubUshUqfLQOhu2OeHFhrvVNnaxGrYDarF9+zybhaIqrwIMEGeaAmIkSIxAeu6oJNtE7AIZafxFg4n1NqXUCbxuNKYPhLGPWUygRovzWl4q9OSeWtGfNlmIcSq+TphxT+4HAfRpCMA3MvMZcjMt5Ktzn/J5j+Ev1dNSFao1baBzYo+dIVwEzzEay1OqV1ivrshfPzcdCXWOeGKUUOCYxJRGy/h6KFDfzguzrkIFL0gYrYbcHvptWhohZJthO+7Ee8O964HXDGFcYnmBBL7bdm5Ns0jR9QQNjwTGa1mjcoRHWGLHmTFjgAGr0fQzGTC0lpwR6iQkdTuTvb/oh6NX5oG3VLlhmbr7HWMNqjDYzqLFzfFdZVdhoIEPTUfs/1SslX898HzJghHZBiElYUAnFHYgIZAthxRobn1dN1/ss3IDaJweKFygIPCmBbLDW6pgXtkb90QeHJgDoU2GYjkN52ulXh/YLlMr8DW9TFGxg4p4SdJnHZ7uRtUBF7APFoefe30EVAjh4uKQRI9IWH9lUtN29esp56SusGyoFgQ/PWFLu2LoNSAwj+ByR+ssrvZSgjeq2P9</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>