<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
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
    <field name="loai_hd">
      <header v="Loại hợp đồng" e="Contract Type"></header>
      <items style="Lookup" controller="hrContractType" key="status = '1'" check="1 = 1">
      </items>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11000: [loai_hd].Label, [loai_hd]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4oK4vNsIHGGSlKfsdiNxheL6/3HkMR0jNAJYkEl9SEeOukcZQMDtAssS/oJvZdk50gEyJFDBAnQ8Ge6PQKqd3ksV+xx4wAC/ei27LVRIJGDPeh/P6GC7S8ELUagMQRchp7OgCjkomeOLDpiw04tld2rOD8OCz+yBuPjSU9aGPwh3vkRcTWYJMO90HqMbst6Cg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsAXrdWrswZuJEqLNbe9UrgfxCbD90ox7yjQ5XlP8mSQVTXMjMzLdArrTR9CfT2/tLtJnZ10y83r4RRNX0CC8haIYrTtHzsjF/kBo9/QYeKI5ddwq687zvDv9uY+wa8CiblfFRfy1BngfKLvDbsk/G7I5+iu/02TgBrepeqgEgtNfhggOTdW11frSDTi2Glyc4x/iGdVcuN8adSSrucba12bDQkG/HvoboTm1DK1nlWlvShGmLCcIL76Or9TrrbCo85yBTDT6kPTdlrW/9Lf+8rQrNZKnlKEJvHF34ZqHTDQcUzlYIgykjnAjEvxxv94DLxBepGbo1JFTxIR3JNEdxLX3f+Li10p+rxOeak167Un6oBvxAwSi2d1AB6dRmdl6s6qyaF12cUUbZqWGxcYeqkfA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>