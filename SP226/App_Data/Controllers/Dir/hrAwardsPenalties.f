<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "ngay">
  <!ENTITY LockedDateKey "ngay_ks >= @ngay">
  <!ENTITY CheckLockedBeforeEdit SYSTEM "..\Include\Command\HRMCheckLockedBeforeEdit.txt">
  <!ENTITY CheckLockedBeforeInsert SYSTEM "..\Include\Command\HRMCheckLockedBeforeInsert.txt">
  <!ENTITY CheckLockedBeforeUpdate SYSTEM "..\Include\Command\HRMCheckLockedBeforeUpdate.txt">
  <!ENTITY CheckLockedBeforeDelete SYSTEM "..\Include\Command\HRMCheckLockedBeforeDelete.txt">
]>

<dir table="hrcttp" code="stt_rec, ngay, loai" order="stt_rec, ngay, loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin thưởng, phạt" e="Award, Penalties"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99IoiAwTmAPQUo4iv9XighvARFLoAGiFB8IwuD41bH/bPNqkMCNkyD9f1ewEIPUoKyGUAfhX2wBaYlXmXxcINIe8=</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="loai" isPrimaryKey="true" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="hrAwardPenaltyReasonList" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$hrdmloaitp.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ly_do">
      <header v="Lý do" e="Reason"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="110101-: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110----: [ngay].Label, [ngay]"/>
      <item value="1101000: [loai].Label, [loai], [ten_loai%l]"/>
      <item value="110----: [tien].Label, [tien]"/>
      <item value="1100000: [ly_do].Label, [ly_do]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CheckLockedBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM8syB8ivcUbDdD5ilW43q3R7giTYRfgEegkGV3r0nTs5t4pB0iR2AN93fy7iknBVSn6DCs6lTvbLoayCaluFsw=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckLockedBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBaFdMoo3x331HWZmphTcrjE1fXQF4vLu0yrkuUyM7jyYqSKbtK+xUx/CmIVu8BKOawKY4d2faxQ2y5nOuZ+zyo=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcD1FBiPH8CjlOjHbdfIvJJUNhzy7LCrUzPeoMhO4Mgg6wXAZN43Hz1HvdDRYQg/AmSGG9YzNa6IUuQigogHzhN8=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VGdCNpd4KFOwYQ3UljlWMVXlKFtOLx4LCbu2rM2T3SERfAKf8MLpn4h6Pf1aSmLg7xPQuXZpWsRZ2Yhr6juAgXEPJ8lKuVfg3TcbDGp+IMVvs3Fwxztkm+CcUxgDUGo2uNgDAcrd5KCJCfZIhWPV60ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGrXFpEW6PXKRgYUXNkrEt6reIViF1niqF90Vk+xjkE53cgIEAS5Ledfgn0kzsN+0whoG/CTTWHeiVbb6E8kDynF8PNg/3XOvg06CwMNKT8QiOHNE0uhHSKvzGRmLpdnDm8f6EkBXRpuXu2skgmFcQgJq2Cp8tmb4p9C1pMOzluIXKwCGg0iOI2xTUQVDsOrWMOTPaGCockp1D5aAXtC7FT9fToZjnroW4HyBcaXDIDg1wbtFYBXe87zXocnXz1GPDBxaxI4DlwWUlukZoi+S3yTXWPb1CYygsofb0CobW/zFGhPjR2zckZ5uC9pyhzPkvGjn6+p0DB8uAGYE4yBqWdA</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckLockedBeforeInsert;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU79VyRyBChN7cVg/V7eyUldLSRcXpOC2ch7jJsXVmvJhwIacolF8ZQY34M7BKYBVPqFJkESTUd8j7OXa44iC8qNotbFS3swHupaswP+RNhNUmbS9/Qg8lXL4SUUrki9qTppwubqUUqJHNdWaOM862J7/v9REttxxf2uv4rLTNLxN5AP0JD1lvQYTSc5O5ck10</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckLockedBeforeUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLzHVitzF8ntYb6OKtVQ4Rk4wTJlIx7PVezvg3C91beL7xl979UhsJJdh/P3SHI5ADbZYoO/EfnOP85XXntAB1xxTdtYnVJcqOMl/MPIEGXBNNY8g3wbdykUrAmbnEJt/QyAUM014TsG4klzeBi6hm2fsXaAbi2/VOIkGwkxIaqGl6Rw8cBydpIE2o4KGNtJ3KBDtLYEqo9iWBd+SLkdGyciScrk5dW9WGPs14/K3q8E74RHhk032sehlxlLv9A0VF8iLmuJIhzS7s4eHBLOsn1Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV1kKnbVoNF2njbwUgFKK4xsB8DFcUR7cKU9VeVsWIee+c5hkCkqM5NHNfxxcFSOjlw==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CheckLockedBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJte5bCHlVf6pKrTXHMpRjodfdnlqfQM/GZ1FISoFcIxtEMh0qu6BgMt7dx6kqX4G5XZglOx5JEKY/Wzpl50m2SG2mCCCbhitgGjm2zbDwaY/52CVqbKV8I28SpOLAUiTi9qGns+LFjumZsJV1Sz0zBJNsUznQbY7SYrBlAVGc8NTSZxLNeUZhYswadZfd7U4pk8m/C/ubz/AaJ+awJOdirZsN0m6CntF8WdlWNxFA+W14qm6nZIq/1q5Nqaz5UvgcJmFDlJ+6grMkD+DqSdWCPdul1Th4z43jyL1qyYCav4txL/dpclh1Tn+LNs8KbEDQIKulEFqCgVo+dfE+0ouGTwp2NKbHkANt5suHx0Zt/zyRf0quRMEbnutn/FbACHj2vyqMk741k+/mmme7pMnpRKxAPTKGASpuetoVqz3JXrs8CUj5Np0Xys7o3Ic7g/My4Q==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>