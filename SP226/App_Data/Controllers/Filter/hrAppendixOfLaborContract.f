<?xml version="1.0" encoding="utf-8" ?>

<dir table="vhrplhd" code="stt_rec, ngay_ky_hd" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ky_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày ký từ" e="Date Signed from"></header>
      <footer v="Ngày ký từ/đến" e="Date Signed from/to"></footer>
    </field>
    <field name="ngay_ky_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày ký đến" e="Date Signed to"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào từ" e="Join Date from"></header>
      <footer v="Ngày vào từ/đến" e="Join Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào đến" e="Join Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99JPtUy/MrOKOttzCUF+0cF6b9KEP1fSJtqIRQtKonZMEcYlZjRAMTfzx9NN5LVsxwRkVrvOPXG90CBJLBTxPhElQd8D69f0hhvgg84tnuVo6</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101---: [ngay_ky_tu].Description, [ngay_ky_tu], [ngay_ky_den]"/>
      <item value="1101--1: [ngay_tu].Description, [ngay_tu], [ngay_den], [bp_ref]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1101000: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAyVlditsP4HQpLnwwTwqINnOzYDa9oSgIPtjGlaZdk+LCoAaW27zWo6okX7TuT8Dll1ZQKMGblXvczF7IbnEEQWwpwHbTUvzWPib6pJrKk6</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHRzoyRBWAkchPmSs88aynH4FtYDqlKNa+2xoZ5ACs41rLJTlyv2UB8/Mffer+V45lgarY4szshf2VMTUS1vRM/WKRqj1tFz9fN40SEST2TB</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRjX8HNKYsCXddis1+aKzEpi3RUd7HD8cH9VC/ZIPjDE4+oCYOCb4NcHHYot76cCjr7IY9emBF6jsji//1a84DOZgmSd3NGQPQBpkfvcAyJsK544iAMHrRYjqtGSg/2f8aBKklysMuFBywxKBcDj1PBUCf6SwOHJ191wujv6ufBO9v/AmGARZmR22a7errgbNgqfsbD7PkJ2omHmzXMRqn3+QiHvY1fLxOKynOUASTO6LWgRsxFVwQ7IXi8/ll5SxjFuoIfyjsM3VgDkF0pS8MJv6qDWRYJuMBHQM9qOZo2SEnqu+Vf4FnvQyvxQjLpypyy5bumocE8FBYDL9VLVCbDISu42MmmgaSgPd9Jl43XtDT26yOdS5iVsZa2/tBcoxp5WqAA3PF32Y8HA3V/mAhsFlpsFBU0xcKo4LUxZCJZ4X7/pj3VR6GU3YWm5CQZjtvbAVrXfJWJT0vo3hOIC79YZWd782Bx70RhGc81dmJwHBrIZKmmKBXI7T4MydqkoF/hz9gzFEsabFnNwQmlt1imc3S840DDc5plb4Gi7VOY8icQXr9pVZhcS1aGz/fCLuDBIiotBUeLVTbGM2z5Ww1GL+M4cvTmKJQgKFU+rMdHjO0oN+P92nwdFoQPB9YM0WBo1zhOKGT9WPhP1CCMspO3Vze2AtZuQW1zbhiHEFEh1m4Ria3X2ocDCV8mT3eHqW0IbGmmpNtW4LGEUf5adZck=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/oKUmX0302sbDhc8SCfv6qyS+57AZX9OCiqrO8xBUUDDla/S+iis315fb8H1wy3bNUsmpPt7PJrYyq6X4mptNXjcFyGHn7ULyyUhvtzCseRpt3CjnWiqfqOjLJwVgVxv5ZSG2cbrDxt6xVHUNtAF9o=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>