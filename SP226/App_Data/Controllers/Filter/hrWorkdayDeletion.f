<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xóa công" e="Workday Deletion"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="1101---: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
    </view>
  </views>

  <commands>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbTSSLZZL3K5NV8m4G22hGXI1tsnp7zlMWtBck25uJbUjL959z+P3W8B/ug/ED+6ygNrAeyhwO9bWLvAfXbgf0NqeCNrbn6VJazM+TqWJzNTBE+zjahM/QGbskKFMf9wMeIA2TEkLJt3PJvJlMuFQb6d9N7/MO9uWLPnnwx0N7DcFkUl/s0HDCK7VHgrHkQZC8xA5w+qDR2Ndun5HF6g4RSItwhmLzK7Bo8Y9vjmZYV2v7qOoOU4SztfNm2VnfWQyzCNVkXexDuAHtL/9Z0izE3J9CZN87W2KJIpH3FpZZyg2a1NX+5lA3BKE3l3kUvc6yWQ+INzsnBLsYzFWDm2vlpqtqDwwPbeJ7b2WJAjPY++PbPym22ivrP8ZFZlBxnChj6uuFfVcVzZK3BafZnEsUn13K/QR8awyEgK+cSvprWoTWIitWiYGF1F0GEl9merOTtTpk1FwT0sQ5Y0Z8bi2qCsHLHtWe7WMD21vCuG+Hutwd1bvurnTTyE6pV2DhuZsfYuEYUdZe7VW2CzVzAIqlpEFREwvIopV787y85OMorSCZmNW0+QM/6QE5UjaxoUkFoaA/04FXzFn19N6lz6+5Ow31V+xqgDK0g92B75tvqVU/UdnAd0peGhrX1KYga45md+Irijp163UwI30UeE7Ae1/RCLoiVA2wG7Vu+GfIaM8xHXFvFeBFDibvyCGtjH21+IGOGVE++NJdbGk36GrhD8u3MR6LyIReqm1JXenKB+h3EqtuzRiSe0pJEEpIHp5AbB+jn+WY6Argg0K9SaiTCRwAAGbWDqN3/3044+NL/bF/7oSARFLlDtYazpyv0q5N7eBTsglDX1QEoK7DCLMoox9w6PK5qQlWJGvfgoXh2mAzM1tnbuAuL3fOvsN5lq8yDYxIwZkH67XZSaa0O52x+s4osvuagxhdW4AcdAmzOROW+H2azk/hz3YzZlpk7nRyIauedgi3OlWvLYvJYAT1NCrgsOcBBWYBrP9knFP9xTlGoUFS8xJC6m28mh7DZLWNv+SlF5efD498PGYM0PfW0AjP0JuYlXEW5Q675G4sNLlNZUqS8f9fpMxdB/tyOEUyb22/Y0JojccI97NfOYvH9ZOr1l3Xew15jnaDyKtntHNQ==</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>