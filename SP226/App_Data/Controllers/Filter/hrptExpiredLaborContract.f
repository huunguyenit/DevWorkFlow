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
    <field name="so_ngay" type="Decimal" dataFormatString="##0" clientDefault="7" allowNulls="false">
      <header v="Số ngày cảnh báo" e="No. of Days"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l"  key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
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
    <field name="loai_hd">
      <header v="Loại hợp đồng" e="Contract Type"></header>
      <items style="Lookup" controller="hrContractType" key="status = '1'" check="1 = 1">
      </items>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="11: [so_ngay].Label, [so_ngay]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="110100: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11000: [loai_hd].Label, [loai_hd]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4oK4vNsIHGGSlKfsdiNxhd4QrPA2I1pRM8aHmBXWynGqXE0ICUO2/NLtneWRC5OUdAp7hBVLPy3Zc3YgUfWYO5C0wpqBDwODFmJo6E+swRJXbAfp1PywWBGMXnhJO03H8ICNF2AVOwxQGsAwsYQl7ZqCxA16rLtABblCAl5FPSPCCTfRcmtTRdxegru9RlrcpO9TqDTyiq8hnvaTAbjWJE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsAXrdWrswZuJEqLNbe9UrgfxCbD90ox7yjQ5XlP8mSQVTXMjMzLdArrTR9CfT2/tLtJnZ10y83r4RRNX0CC8haIYrTtHzsjF/kBo9/QYeKI5ddwq687zvDv9uY+wa8CiblfFRfy1BngfKLvDbsk/G7I5+iu/02TgBrepeqgEgtNfhggOTdW11frSDTi2Glyc4x/iGdVcuN8adSSrucba12bDQkG/HvoboTm1DK1nlWlvShGmLCcIL76Or9TrrbCo85yBTDT6kPTdlrW/9Lf+8rQi+qqfSSNym1xUeWuWBMBH0L41Xh9vATNpQX2qnsy3QufBwP/jd+JLEg0fxS17NuUosZ3Pe+fj3KLrFj22kG2i07SBltJ6BGqRDaUiN9D8NHQ1iQMu7mRXOB0EgGLR81c9V1fIW0KDFc9oToRojYIRI=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>