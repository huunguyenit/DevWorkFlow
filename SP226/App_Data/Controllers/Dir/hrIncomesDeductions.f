<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "ngay">
  <!ENTITY LockedDateKey "ngay_ks >= @ngay">
  <!ENTITY CheckLockedBeforeEdit SYSTEM "..\Include\Command\HRMCheckLockedBeforeEdit.txt">
  <!ENTITY CheckLockedBeforeInsert SYSTEM "..\Include\Command\HRMCheckLockedBeforeInsert.txt">
  <!ENTITY CheckLockedBeforeUpdate SYSTEM "..\Include\Command\HRMCheckLockedBeforeUpdate.txt">
  <!ENTITY CheckLockedBeforeDelete SYSTEM "..\Include\Command\HRMCheckLockedBeforeDelete.txt">
]>

<dir table="hrcttngt" code="stt_rec, ngay" order="stt_rec, ngay" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin thu nhập, giảm trừ" e="Item"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99KnrgaYyikr9VpQfsnVTwOCZgr0tVVxoKL/66jEJ+7Vo6CSfBq0mq7S4UnDwS39nnkyTe55pnngEqZo6NMByQ8E=</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="loai" isPrimaryKey="true" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="hrIncomeDeductionList" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$hrdmtngt.ten_loai%l"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGT3RE322s7AXEMoNIgNPljTRPfd3W48NnvVXh3KI5FQ5DJ8u7pOrNjRa/o/9HHtVqOMGXRcCQI+0k1MukQr5ZA=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckLockedBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF82lw6FwCN7UZQUS7At9mL56tj2RAtZnAMoGI5srGGBNemEsNDMbW7DoFnOl4MkZANKJtr0IrCAuOceuGv9elQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPJl4ig9TEZlc9JEbZqT9WHhkONU5KLrQnZTqud+cnEtK0pRlgwvZsHcixA8B2oCwV/TtkAqaNFDnTSgIL10FlM=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VGdCNpd4KFOwYQ3UljlWMVXlKFtOLx4LCbu2rM2T3SERfAKf8MLpn4h6Pf1aSmLg7xPQuXZpWsRZ2Yhr6juAgXEPJ8lKuVfg3TcbDGp+IMVvs3Fwxztkm+CcUxgDUGo2uNgDAcrd5KCJCfZIhWPV60ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGqVf5EPIIW/FkndcZYnb+qzGYK6v/1/RgKYRAeqKHSZs+S0AwJ+z1e2+r9UrP/4xyRDpxcMKAJ03v6AiblFCKVzo4BHYO/8j5DW4UcCxm6CccK9OzRBDS5bxIUJRx9YvfovmDmP8u65DLjhlH7vkRNQHl7uJcPzU0gUQil2pB0axN5KpIo43gkmhKsLx/v5un+xu+QRA+Rmtcj7Bv2aQ1WzKbUp4HpjIsiyvbs1qZqCw757DFXRygQB7IN48JpBv5FP2vx2R94FpCnYbSs6Vbcdy7M4Vtb3DjZ03i5K+CqejlC84HU4aAK+6/TdSbn62JZ2smejQvoJRQvCYdzkXOVGGDXf7K6n8y5njTINJx3npg==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtW7PdlO4rTAd8cAYIbrfJwQG1CqwGLkzlNxYTOK58g5d5/Okn6kvy8CDodrqZNDwbJgQBmD/kgm2T/c+6XjfnYA4tzMUBIr49KmXt/8IN97heLRkEeQoZJhdosxNL0vFi2Lfw60dO2DnsIdgVkdnlPEvqnPUw3uuiFE2iGgCRhkJvQQ1jzIK4wcmLCuU4KVDJzyEFoDl+pI1zAzjrWbrso+81dynFiBN36o5T73Tex8YDyMFiYccNH2YXzba2ltjtITJliJh5qcE01m58elKi7LaMpfXetVfjTf9tI2SIC7bgUEi28Y1Akeh4k/PqYePX56f0P0kqfvuB3MDJf3RpS6zOGHsiXO9A2cR3sg0KqL5LFaOhACuWAGfPjbdUNb5PwX8FRUyIEAFUywmpCwRc6g9MkxzqpRJF+1KlAsa6mzxy6b8/B5vhNLe4kbjqoCtuQ==</Encrypted>]]>
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