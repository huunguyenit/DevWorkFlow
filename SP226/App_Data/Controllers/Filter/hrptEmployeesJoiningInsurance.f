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
    <field name="dot" type="Decimal" dataFormatString="#0" clientDefault="Default" defaultValue="1" allowNulls="false">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
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
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_lap" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày lập báo cáo" e="Date Created"></header>
    </field>
    <field name="ma_tc" onDemand="true">
      <header v="Tham chiếu" e="Mapping Code"></header>
      <items style="AutoComplete" controller="hrStandardSICodeMapping" reference="ten_tc%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdCt0iqw0n0LzB/+sfitXUC0mlc2+mz5OtxMR6FlCUHV71UDXm4rY36q6Htu2UR92ShFVulGAJLZkLLJohWrTik=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_thay_doi">
      <header v="Loại thay đổi" e="SI Change Type"></header>
      <items style="Lookup" controller ="hrSIChangeType" key="status = 1" check="1 = 1"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="loai_tc" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="282">
      <item value="120, 40, 60, 100, 100, 130, 0"/>
      <item value="11-----: [dot].Label, [dot]"/>
      <item value="11-----: [ky].Label, [ky]"/>
      <item value="11-----: [nam].Label, [nam]"/>

      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1101000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1101000: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>

      <item value="110----: [ngay_lap].Label, [ngay_lap]"/>
      <item value="1101001: [ma_tc].Label, [ma_tc], [ten_tc%l], [loai_tc]"/>

      <item value="11000--: [loai_thay_doi].Label, [loai_thay_doi]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6d/uXX77+D04wYhbwZ1h1LtgEng+QYqbdGhy8H0krzrhiXcXB2tWMxRmjSffANbkLR6vn5z1ZShMelDGoIrWUZ/Ow6h5KTfxtPIJuwph6nb3cVeAw47J1XT+qFNMCzkEVPCecK3B858d49m2jTTbfz5LZGw0eV4vtSbM5z0sPbTjisgCVFje8US+URnjAJX5+X+IgUDZbhYy6MsdEa1yG4FJxrHVnAqry0F+UmncTMJTrGTRvN13N7xYEtRrdtWPrt9W1m2MuZ1qXl9wVaz7L54O09YAcRBrvrbqD0f/KtsO6fMm/NbNpp5fiM2264P7+6BqhR7EcfK/yABzCnYaLWCqH5f+QWPbqk0LJCVAkbSrioNFb48f2MJplTrCYa8BHg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsAVeGA41YEkuLanAurJXXNruSdBeN7EegesNWtKDihT5DFLuYSTVVLpwHgI6M1PzO1zs/2CxJEIqE20IK1WeDpvxQ9eAtO0DjCYt0e5hDgOEVTUIEo8frWu4zeGQZfXV0vrseu7c5CxZ5xMPZh3uPLcY1Ze5ufJKNiGderTwy0qM0qtDe/CJuy2C9Sk1BFTqNlbMKv9OPeITY8nYTHxDbmNGx1FNkPlhWPLqUehVw8qOnFGdQpFQ8fXBwa2ROTpO9OSNw21qRpT5+OYForVnqNwHOGzvmP37Zh2XD9/vfwYEgGTiuDfXSHceUb+vq5afYUGWhpQcdQ52ZKmLKtSCf6uDMMOR8YBc1F6YfqekGzNlTG5v8XJQ+/GAqB6wikFRbjzlPOYpS+8CayTcGp+tW+jmtejc9i3t4Cz4cCv7lOlQQEp9dkjXWRft/gzYuIiXxkBSL0AaCxJbb9g/e99PzpHl4R4qnoSnD/Ut9xk0CdP4fhKE3xhHnenzFV826alxDDCd3w9KBF1IRB4EP2RRgcQFDjns2OTDA/sEwGEWsHuVEz/+j4/t+B08ql+U0H0Y93rWsX0BNRQNOlfzYk6y4K/JSOhFLEgyX2H1H0R84LDrRLDg1iDxMjUkpHik/jDunZREE92P00XJJswn0I+JH5iZiklixH5I9WwhgpJVk7BKj8Ccb4Ccg9Mo5WXuw0jQM7f7JDxb0gi9nD5Pm2zsK8VYxUfsyB32xzVNi1KJ6IeME85HrSNMv9r7BlJ2DDT+2oXr+Ufq85fZNuzdyxgyRtlw==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="RefCode">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6G5vIRSRzL8nixk75Y4Z4ko/YQNEIt96ds8CE8jFzVXNZazAp5RbKd+LWHWQEzMDf7ABW5LJpswzmDXJu81wk1uDILG+XsBGcjiQvhjVJHZQ==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>