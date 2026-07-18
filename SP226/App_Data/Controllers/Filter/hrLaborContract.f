<?xml version="1.0" encoding="utf-8" ?>

<dir table="vhrcthd" code="stt_rec, ngay_ky_hd" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ky_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày ký hđ từ" e="Contract Date from"></header>
      <footer v="Ngày ký hđ từ/đến" e="Contract Date from/to"></footer>
    </field>
    <field name="ngay_ky_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày ký hđ đến" e="Contract Date to"></header>
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
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99JPtUy/MrOKOttzCUF+0cF6e/zG8nbF5pG3TXDUMALyTFKDp3lgtdZ95vXWBayTdea0iZpKUpYyXmWqmJ4DnI5g=</Encrypted>]]></clientScript>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAyVlditsP4HQpLnwwTwqIPd4vHrFz6D6xS0czVqTkrbbdqfqJoV30g8xoQIAjlMbHPYIZHw7pefBEO8poAJc5+UTuX4nIQzjH45Wlwx4zeW</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHRzoyRBWAkchPmSs88aynEUS/Yc1uYc59GJSDsMTXMNPBUhfVZu1PfkGsPMESDWSxaBR3CxuqCk8FJ8YgIdEPvi/QdwB5akdpyVXC2oRJL0</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRjX8HNKYsCXddis1+aKzErQVJw7gUT+/tSCHI69dYQjku2Zd5Zj7P5pZa1GnGb4Mw4ffM6iLlER5246xcO87WRb18dlNJYHsCAl07L7xX7efx/WOEnrF/x+F3lFtSeLK2CsTVJQ7JoXbxfowiGkxQdLhaT3Gz1touQiozCkiF/e8ZPkiLEcNiDji8uD65F5JzzOGTNwbc9TJjvQ0xPek1D3hsvCE4jKyKySmOm3T5GbLcrueAkYszO+ZYxiPx9MOavKlUpzxezacBV8Rt1a4PO1M+OXZga6FYyS8wGij5sHPUAnR+DNOfaS+hhJOaOSHd4Cw2Z/yAhcgMr58+BJsvj0eADqjmCI6VRCOU9v3EmSPGT8a7FlMjFuWKWBCyLUU0FOAcMQceRrAOddreXejUzTqu5nLFIox1mJJ3MUeRKCvzAGwEzZ0h0IB5HvghSFKYNALgiBTALiu3mSsricftldxySnDQ3cQcWOz3rUTKle49TtpeiMCPirrCtIFOMaRKFBSj94QCf0aCxTr+sRyWcBCKW+UrQHc2ThIFjWE3u9VovKRp2GW3eT4e3ngjwFlzGnGo9Pnl79UpBoAM3uVtSZDCrCD1myWPysNuX82htF/AYNYFUx0xlUm6PiUtY9jxI53EIcXPbd2GZZzMPxP+lAZKkjMbWEci/QpSyx76uKTEKdTvG+PeEMzsyTnGXrCg==</Encrypted>]]>
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