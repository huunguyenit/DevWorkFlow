<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0728\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="hien_thi" clientDefault="1">
      <header v="Hiển thị" e="Display"/>
      <items style="DropDownList">
        <item value="1">
          <text v="I - Thông tin lao động đầu kỳ - cuối kỳ" e="I - Labor information at the beginning and ending dates of period"/>
        </item>
        <item value="2">
          <text v="II - Danh sách lao động giảm" e="II - List of labor decreased"/>
        </item>
        <item value="3">
          <text v="III - Danh sách lao động tăng" e="III - List of labor increased"/>
        </item>
        <item value="4">
          <text v="IV - Thay đổi thông tin người lao động" e="IV - Changing Labor’s information"/>
        </item>
        <item value="5">
          <text v="V - Tạm hoãn thực hiện hợp đồng lao động" e="V - Labor contract suspension"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportCircularTypeField;

    <field name="mau_bc" clientDefault="10" external="true">
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
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101---: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l]"/>
      <item value="11000-1: [hien_thi].Label, [hien_thi], [ten_nh_bp2%l]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000-1: [mau_bc].Label, [mau_bc], [ten_nh_bp3%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA6csiqmA6uWUbWt8Rlc5KesUzG0FSdaLT9N98y0s4qg59xJVhlQQsR/PZcTDWYL+dxQQh9nEijrk80c6zB8xW4Li6gGjDkJPiBQr7qSsAVuIRx+M3+7ZWCIa/TMA3yHXZgmXKax3Hw5bMrZ1Sq5bxriO4Y+mPSFTR5XsZAupMYcofw/ORHo5YYXnzntcRsl+3GASXpEvbErQ8W5vguPl33o1RbdN3r1giWqAZ31u5w4</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9Gima5X2h6XteOiU6fQ8aLxj0EX974zEI7Bp3ATxX5wyGngRhFosG/xE9p1ZLGOeqErwPRpMyEoHhRCeOxYjjlu+lsg4qLbOxvzhGsMioRwO3+VkSxf1+ENRDldUScwCYyIzVpL/lSQjH0aPX0zQaOOfJEMyuLqux9aH+THbzT9+DOscDkJXl4Ow3ewJj0Qf+GkEs7SnFLQTRdrM7S6XBEKuBr+G4wSxWYFqwNe71cl9tnWl/X46SSOOgOrJhM2LNZgl5Sg1u8Twki7JuAlj3iNqQPSB6DGoL8hGn2bu41rZySY2KjpOs0nLHtArQ/vRmNmQSsq8G93VYFXqX6/KT70uI1PB4c9Dbz3urhjAlYXY6U1o81QTeE5LphZkqSapEFe/5xJs2bD2Hohu7DSPBvJxyWOR5Epo+aLhUN8Ubd7T6vcI4OtUoHQeYJc1hEUS1J4LGpahuIFTR9q1y/AjkEd9aH3mnI1soFOVjL1mY/6KwCyzlBNgKp5MEKY18S46B1UBpZ3wnF3q0GhDGlUn89eZkD1ZDpWQ1UidYu/4Gw14EUBrs4OKHVdyJ15l2PEhNHDyHzkRLdXqWNbpPPGuo+SxXugh6hNuPQEsL0aeTuC9VDjmQ5R/Z7Ln1TWqjllZZ9l3phnCKjHHWG1tNH3yaJhx3fxB8aMeZ6ETxvIYS5zzJ4Pqq1hM0dfYTZgHzOPut3RYs3WUxvgrx6M5eSWwemlG1LIT3E8lfF542w6AgOWORFIvKNuJgg8miqtXsGPbi3pMDVzAm/pAiHZb6x7ofYLCSB2tYHpQM8gpm+pmZ5gVlEwDD709WntsEAhEzRqK8O3ojtXOOZM95uCYUVhOA98nzN28lrcyGq9kvLnc0vkXKBxnaR59wsMpnAD1HfcKgSTBT/nubKlb1CDqG5StHOBoZ2jkjjxhpB6OlNw3hL68jl+ZwKbcA32CU798fG/C2z9kq7hcxM7IaEvF9gtAm9xaMxI4xAbCdetgH+daRTGN1VJGWraGBdjMgxjNTwlImJ5kw2o88hVjwuAiyzZyRexnd1ZDBRNIebG4Cg4jtX1GQTpVNTJ8CoDl4eRoYyx2nRbBQeAI7kTnyV06wDAiKd6Wu558QbUTo4bNmfNNWTactwRA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>