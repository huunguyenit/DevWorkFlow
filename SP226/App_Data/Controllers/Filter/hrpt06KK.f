<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="bo_sung" type="Int16" dataFormatString="#0">
      <header v="Lần bổ sung" e="Additional Times"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    &ReportCircularTypeField;
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOguPIieDn3C2XlBaZKLpfVD5hCB1ijWNXpwJCYn0Tbrph/yPzEHeEQY06R7KyFZgaaxOREXtoQljra5loAA3ARyY8QCooL8NGAXJ7jxgNeZ+i49Xhy5Ak72lsN6K5UywuKwJoaqQ6HMhk6ecW9T3KiWmIztYQLjOkjCLzG5NvXc</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R7GYbFT8gV//NRBlfK/VHvK3u61G9X2E5UhpO0CV5jS9UARBL7f6GaFA5p9IL6CTjSigJQUu0HBtt1/92AubUshUqfLQOhu2OeHFhrvVNnaxCl8Fcbh1xMEObC7LGpWdl9OVnJ1AoIAe5vj1rijfJ50Jg9MkuAT3aI/wSCk7G95EjKnBfrwqDTgH+VatS20g6Iq6kuyQ5dsD/NMna0itfK4aNE27A0HDPOu5f1URJIolctqlDiJ1B830B9dyDlTgKSHHjewjnpMOt/+PmOEZAvaKUAbhnpcPNho8iLxYQSM1MtSlUIqVNeBh6/7ZlxHT8+cJRXHVhX6O2r+Qt5iUgEzEMtkPWtYlmDVjnLSeUlTwuDM3fXQ+6p0VRHHAJQ3lefTaAWdeUJHxnTXJ8+IB2de/rfnZ7Zdv2VRO1O2GKTVetTa/1R2XySkNEt2lUIUPajlZKhAeE9r+07pBmfsNOoGVqNb/qc9o7Zw/4vB9cY4tg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>