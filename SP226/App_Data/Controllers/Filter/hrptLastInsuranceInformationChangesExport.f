<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="report_date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="loai_thay_doi">
      <header v="Loại thay đổi" e="SI Change Type"></header>
      <items style="Lookup" controller ="hrSIChangeType" key="status = 1" check="1 = 1"></items>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
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
    <field name="gan_nhat_yn" type="Boolean" inactivate="true">
      <header v="" e=""></header>
      <footer v="Chỉ lọc các bản ghi sau cùng" e="Only get the latest records"></footer>
      <items style="CheckBox"/>
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
      <item value="110-----: [report_date].Label, [report_date]"/>
      <item value="11000: [loai_thay_doi].Label, [loai_thay_doi]"/>
      <item value="11010000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="11010000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010000: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="11010000: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="-1100000: [gan_nhat_yn], [gan_nhat_yn].Description"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VcAUA137qmow4BuDaMIruNNfC5dpNUcDTTXjwyQoUsG/Ir5pjL2qOPXW9lOhh+aoqVVa5jLNIfkEg9Z5LYt0HGSc6OyaOYkQusw10G+bHhqjZpnlRuIpHe5VCf2cOhewzOMyNlVT7NzHkquAxt7+nixRAb+fTXqKuX3g/bpCoNnEnV52wwTvWAvbHbXL91skJLWfstDwoUwPtW/BKFM2zMu+chjXFm/+BLPAeAH762s</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9Gimapnlu/u2AVtDgSw+RL4/PEm5/fgFNwXPqrlUyerRX4lShBAuhdts0TmLc2WsDVWnLrWT8ueZls7WV6+bD4un/lNma0o+SvPhKMxn1KbjmkZo07jM18hSWbw/V5SGupizZwwJiPvKt4mLw2o1SxpxsUBGG11aerij65cp44upjmFdkPF9iwpKZWFlnM5sIywx+wXIK+HDigsi4mU/NC7X3fAAN6/prXpK681YCJeFcVuvRhJwFgoeGY3PW3XD2vecAg6Ns2rHT/eWEskdDCq44XjHyTkcOu4yCWAB20VzZvuJl1pWxAQaul/xBY3LWA39Y1JQYsImxe8Lz9GC2K6f7L</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>