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
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Job Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1=1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tuy_chon" dataFormatString="1, 2, *" clientDefault="2" align="right">
      <header v="Tùy chọn" e="Option"></header>
      <footer v="1 - Chỉ hiện các môn chưa học, 2 - Đã học, * - Tất cả" e="1 - Show Uncompleted Subjects only, 2 - Completed, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110100: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="111000: [tuy_chon].Label, [tuy_chon], [tuy_chon].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4oK4vNsIHGGSlKfsdiNxhf7cakhpXnd40nDnRWl5Wq2cXMOao2GIYexTLup7y68/W5wTRASRgfpaS7S59iaOlj9sUCvlc50aSnab8+mA1xprrYcXPZtXQzge5lDA54uAydbxcvj9EOTYZMwEHZv9MS8Uu4kHDbdDXlt2ikGi8UD6jhTPdiBpRgG1LYIfJTXZoRdsijYgYbL51YiAdTMqjw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtcz3ul9SFOsGjkqayHsCE2vmHkqABQ34uK1dzPJedUfan2Y2O5HkOdrRmL+xRwLa/LgSg6Gt44ZJcnPnDJff0nbrACeC+85D8+xhADKyvMqHZTb35MDA8mFg5InVA8+OEYgkykqCNw3WfJyKGhzyhx0VB2D/caEOQrVk7kEUINoMQ8Jbv15HlniM7wEeESbPSqn5qi9xQyFdCXg51QrDs5H455K47+INI2ZUq2MVnKMU6srhjwgWpoiraQeapUManzsQcBLfi3xtpdyeRAUANsIkKfWYxTao2rwBSwdOkCz+3IovoRjldCSM2g0e27n9XVP3gYlBsOYa+1X+DKrtDLIa/uOn8UZQJKMHCYVjmlrHatWx5VLumT/dnLUDPD7XXRsxXwDXXvPiZXAlyfxO76X</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>