<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrkcccong" code="stt_rec, ngay_tu" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+qBtTtKcMGUXHMVvGKiGf9CaJUUyCbRT+RNQ+j8tdwmavq6iaDAauTzND9CsigQIQzuvHmpycev9qt6SISHW0jfpuWBpeDZtZRwEvitw5m</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="1101-11: [ngay1].Description, [ngay1], [ngay2], [stt_rec], [bp_ref]"/>
      <item value="1101000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1101000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1101000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPjhEzai8T7X2+pXUtYHCLtbwJGmRZ0TGeOTUrmeko+v8nTnbqlpEem8RFI8PhGmT3hZz4xMg1H06BuXtC8+Hc5gBYWzdreyNHlqlAvuVdWNulPN6yntigzEZMo6iDrycgUW+uFM+4QZ2FnTQqr7NnoT5G0v3zSVDoSyrS84Wu/Y4l00gFLuUx9uF/cpbP83uIXEtUarYDKbjIs1pNylPMx8RaMDnlsbsskusNVnqlmpYNwMbYhf/mGbI72q5jvse+8MNWSyxU1fD9ZeGEXeo6SYpG0n2BTcvAMMrvlqsw2RW5IuR7tY9hCJulhMRpfaLmnZ9IA8gRhESG5j4ZwWrth6B5suAFLvW0cHYbWpR5XmDL75VtsTpoitybppX80rOVdIBQWvaX7opHLi6eVNWHeNKNUUe47cA9pzvdm2LuaCLiwe1XiVXFxIusv560rYAArR7lc9L+B0u0HhavBe0kx15b4Mf00ZMAZK3S8//EDopHIQepqsWmbC8HR7k0LSGQhfMsvx3uGqlhVwqkU1eALIVBvDwprJ+kDPpCSDgwk2c+u+Auq9QMf96dOHIz6MtxxPMrubcIhqvL+WIGBSFL5k/9BmCCQrX84MlwX0LdK/B6kMDwrnwROtlysU8Q9GEqFWSvwxV8A0P9kFMDmLz+6RbHrFHRraVAHCzmwnL5hsQ=</Encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4OhCFRfCy1GRSSaAdSJi+ceXeiUtDOkHC7oLGMa2dG0S4RhzgwKSz9LO3C0VSw69qdy1m82VaIbEgg4TC219LIfetYUFVdTP/RI6CyVnDZ7A==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>