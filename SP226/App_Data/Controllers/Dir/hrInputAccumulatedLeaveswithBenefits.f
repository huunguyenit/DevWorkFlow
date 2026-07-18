<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CheckLockedDate "
declare @lock nvarchar(4000)
select @lock = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
if @@view = 0 begin
  if @@action = 'Edit' begin
    if exists(select 1 from dmstt where @nam &lt;= year(ngay_ks))
    begin
		  select '' as script, @lock as message
		  return
    end	
  end  
end
select @message as message
return">
]>

<dir table="hrhtcdk" code="nam, stt_rec, ma_tc" order="nam, stt_rec, ma_tc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngày nghỉ hưởng trợ cấp đầu kỳ" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZW++g3Cv6u2ugtQEYMeOFAwXM32q4UJ3pa0wGXfQpU82C8mhqzTCQc/I5QQ2ocs4Ddyc3lCvXc2umWa48wJ03o6+RIr0CsXUF8rCrCCcSUEO</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" isPrimaryKey="true" allowNulls="false" allowContain="true">
      <header v="Mã trợ cấp" e="Benefit Code"></header>
      <items style="AutoComplete" controller ="hrSIBenefitItem" key="status = 1" check="1 = 1" reference="ten_tcbh%l" information="ma_tcbh$hrdmtcbh.ten_tcbh%l"></items>
    </field>
    <field name="ten_tcbh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ngay_00" type="Decimal" dataFormatString="### ##0.00" align ="right">
      <header v="Số ngày lk từ đầu năm" e="YTD Accu. Day(s)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 0, 30, 70, 70, 30, 30, 100, 0, 0"/>
      <item value="110----------: [nam].Label, [nam]"/>
      <item value="1100-10000001: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="1100-1000000: [ma_tc].Label, [ma_tc], [ten_tcbh%l]"/>

      <item value="1100---------: [so_ngay_00].Label, [so_ngay_00]"/>
      <item value="1100000000000: [ghi_chu].Label, [ghi_chu]"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOXPO19ZItzkn9DeXIWqakOVPy+BgkkjRCbs7s1/doYGN6Je7GRgpBWemmOec7pMCeLWkXpTWfmCLSHVl1I/VhUQ==</encrypted>]]>
        &CheckLockedDate;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tO10ZAivgb4UU171IJfh8zw0SsJ6ZsXSgMO4uJkGks9oUvnZWJAy89dXM/k3wj1GHEjt12RdCN1DFagr2dDUjRUA==</encrypted>]]>
        &CheckLockedDate;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwnMdMA1zoRzi7cxG+41040A0h0ZSDcAKVwZXhCGUyZ/gpFLHVTCZxV0zqLkAWcrPyHOLTtbNhjFejiszKIvTWX8WAg0usqzae7Vjq3nc2YJ</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI369G9OmxSLLS2hndR2DBxsvBEfo9oKyiTCJOkS/YAbT5KwQN3beTSyR+w4HHLhbki6nRaXpDfhEGoWys3rsrWXlHbh9Xr0dI2prJoXqIek8TxhDwengg5HRQPCcDQCE04vggg+m1GwRJF4grr/ns4WQDQfbdpTOEKYOuPfhnS1xPXAbYZAR+tx3YEq+S5579DrhqocFb0Ccl6541VcolwJk6zKOgZHNhJl+iXSLxUtTrhiJnm+IQKxkn0dRLfm6Awx7cDBAkT3MDh4H5wEXE9pTzDS5u9bhDEIZWgoaxhX6sv+n7fIUd9GMtKrNCqQSQnWG1KAHQgrti2GHBmDOSFPvQFH+c6a6PWpti3LDEj66O+jsvKQdVaG0S4p54Uz/Rz7HSGG6utPAw37emwLKvykAiQ2a2TqRvlldc+SeA4N8H1Lnyz71UKnIQB7wwW0CboEB23hAMKsQpLucU62ryJryMqMjc8/Csg7OYb9wgUSfSH/0LzqlKPn12d0reOLyxLxzg8VWvld0JrhrXzhLN1GM+3Gbhul52xEh7/a8fCM8</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK43EaGIaK3n8FIGN40LOIoV/LR2+T+zAaR4JdkZJjVypoYhOUqZEHPBFgRuUURhYSpqX43VGm74gYY/0e7W1a9fKS51ntWNdhvPOIaOB9974DHjSyIyQpQeIdYc9lkUCEPeNxFmWgKZIUQharjBIunvzP/a79dptE/zfqFE0Oufj41xlWIsj60AXp4hTCqnsCiecN1W5XM/qntYEt2dbb4TLpxPSQIlN7p64WI8sRFj5Ju7oPq8jInlpfUY1Iyx+Mq4OZOAvsND3frNU+C6lCEuU53J6LNWX8Q88SXqAXB5yAYGtMv9c6LKi3X50ZFW3E4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK43EaGIaK3n8FIGN40LOIoV/LR2+T+zAaR4JdkZJjVypoYhOUqZEHPBFgRuUURhYSpqX43VGm74gYY/0e7W1a9fKS51ntWNdhvPOIaOB9974IXHSEqAnC/Ujww4AVqujpxt2UyZSx+accfuJcg9TWYld7RctEcfF3nmtbgMrION4/2lmKzHE8wEAM+jbAfxcBhsJQlveII6hN0CLMULH57EUqdv2EF3TxRehU8rfP23OuXi/qvTj55wcQcoHa83FUgLnElMzOvSL3o9ZmVbmyXnFDhmsr7uGzpA6I6QYoP+RAnTQZcuco8zMxlT0EE0yu+w04qF76tiwFB8NdbBurU8YjSMeVX+9nYuWOP8CnPCsOQIyMHdVNPPlxtdvSuOaIY=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgazNUY585npJ7BaLPGwgtJJrMb7HoXe0aqku/FXYlkXrQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK43EaGIaK3n8FIGN40LOIoV/LR2+T+zAaR4JdkZJjVypuga53wazk+1TsFKPOATPpET9RpedsOl8s4JTmZSmHFYtoiSAftmYBvUqJ0RFkN830QeUC1KG1rLGyuhmBt76nM=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FsN+BE0uc9eSjWrgwuwgsn8Tchbe3nUK9+QNHi4HC04A5PPDjQVXYdWhUfgyUjUo5L8rWFjg+JzU3zc6bslwhAqMttgWVjpROfcxpH7lfcIcScn+jIjRNaXROURvgUdB78vC3sDOqquiSkT/4Y+wUzB/OqDalJvdtwWNMXe7K9tZNfe+99k44BH953XL8PTEIpJFy5tf/70qHbYNqiRjV5YFSuwHpNa+1VG+1/+x4lCKzQAtXGNl1O2KaFCBMocfHL5VtpYHApOZn32Pc05FFuRtctpsJdVnCneBppv+DjyvYUH+5XRYShACaARGB2tQ27nunXS4jopN5jBwS3ZoNsuZ65AM6aLPD7O3BAIytNdqkAMYEECWmHSKUaDqPGN6hhUcEdYra6rg8Y9+FSJucZ3FIqtTnbmgE1ePb0G/jwqh5j/J2APDs5Hck/4bbmugzrfXRtm9rAAvjCr/NQgOTiKZo1EAIrucOo4AtHhrpCg3Lu5Tvnfaq9u39zlVw9MgIZAVy4YlOf4sHVfNjQQIhIKvdMm709cx5cuwirWY89CdQ0+ilPL+LHO1LNO4aVTh94+4ilY990H02jJSfm9tV0=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>
