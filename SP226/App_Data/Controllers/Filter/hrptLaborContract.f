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
    <field name="hd_tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="newDate()">
      <header v="Ngày ký hđ từ" e="Contract Date from"></header>
      <footer v="Ngày ký hđ từ/đến" e="Contract Date from/to"></footer>
    </field>
    <field name="hd_den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left"  aliasName="toDate" defaultValue="newDate()">
      <header v="Ngày ký hđ đến" e="Contract Date to"></header>
    </field>
    <field name="ngay_vao_tu" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty từ" e="Join Date from"></header>
      <footer v="Ngày vào cty từ/đến" e="Join Date from/to"></footer>
    </field>
    <field name="ngay_vao_den" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty đến" e="Join Date to"></header>
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
    <field name="ma_vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vi_tri%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_hd">
      <header v="Loại hợp đồng" e="Contract Type"></header>
      <items style="Lookup" controller="hrContractType" key="status = '1'">
      </items>
    </field>
    <field name="in_kem" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="In kèm bảng mô tả cv" e="Enclosed with Job Desc."></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc" clientDefault="10" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
    </field>
    <field name="key1" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="key2" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001---: [hd_tu_ngay].Description, [hd_tu_ngay], [hd_den_ngay]"/>
      <item value="11001---: [ngay_vao_tu].Description, [ngay_vao_tu], [ngay_vao_den]"/>
      <item value="11001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="11001000: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="11001000: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="110000--: [loai_hd].Label, [loai_hd]"/>
      <item value="11100001: [in_kem].Label, [in_kem], [in_kem].Description, [key1]"/>
      <item value="110000-1: [mau_bc].Label, [mau_bc], [key2]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxOptctm4OgxlOnUJx5Mydjuk3kcZ14xgFEz1BCsFkKBL6TSIJjrbVGaJbu0lylk+hDJ50+zVbTKHQICTpuFQz8vtNUqjhu9L9C5uwjKd0q7SN3zDxTox1PncmJh8+inVaxik91kP6MSbWkJiCXBhhK8aQDrHA2g8Uml3PXFychmMSeP+af9NF8Ak7rNqSgXlij2gmlPft+tgT5KQNra8gp3hn9d6Ph460TQKa6fqBx2</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsAJfcvvpWWomntVArYK2lZ4hacT2rAuefhKpS0Hcm+4xIWRLm0rUeTJNWe86iTBzEt1Qm4TOMbZqHp62CFZs6BYbqGP1rQ+ze5BMBi/4MNaM1rfb+xV9oNvNPtoVgw9B07GHzVv+GTEYNd2/Em8uI1sVVLXeYebRsXcL6Psmsy9gBXh9KfXvhlQgn1rMBqeTrAR2cUYKbl66Rf8fhNLcXe7C1YS+bWUdnMspICxQZys3UoZv1w4wb4YY01Ypb2X2WGpVX3ujTTeJzvZDXCem8JYABHjNk7Vq+ZrxtsoZCAbBT/wlA0ds+fNbppkxOPceHDQvcJ/+sPjIPlkeDSMFqi9zDQRgrP2SGe13c5/4N0+OoFFhSqJJNUxIiEwMtGhxZ6qi7HgY+m8nC6LIsHiFXW0TkQ7b9MgaRPCPKWo1Hik63mD/WU+7+W1jGi/fxbg61s69QmXTjPvnPjIz4xrqw2cw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>