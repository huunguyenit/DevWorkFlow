<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhreqtlbhht2" code="stt_rec, stt_rec0" order="stt_rec, stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bd_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu từ" e="Start Date from"></header>
      <footer v="Ngày bắt đầu từ/đến" e="Start Date from/to"></footer>
    </field>
    <field name="ngay_bd_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu đến" e="Start Date to"></header>
    </field>
    <field name="ngay_kt_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày kết thúc từ" e="End Date from"></header>
      <footer v="Ngày kết thúc từ/đến" e="End Date from/to"></footer>
    </field>
    <field name="ngay_kt_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày kết thúc đến" e="End Date to"></header>
    </field>
    <field name="bo_phan" onDemand="true" external="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1DAoGhO8NRODcSoAFiE76xvxtevpXKJCeWXhyLy9j8imAhrf6N6eCkIo+MoUpLyBsA=</encrypted>]]></clientScript>
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
    <field name="loai_thay_doi" onDemand="true">
      <header v="Loại thay đổi" e="SI Change Type"></header>
      <items style="AutoComplete" controller ="hrSIChangeType" reference="ten_loai%l" key="status = 1" check="1 = 1"></items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="lEmpSi_yn" type="Boolean" inactivate="true">
      <header v="" e=""></header>
      <footer v="Chỉ lọc các bản ghi sau cùng và còn hiệu lực" e="Only get the latest and still validated records"></footer>
      <items style="CheckBox"/>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_bd_tu].Description, [ngay_bd_tu], [ngay_bd_den]"/>
      <item value="1101: [ngay_kt_tu].Description, [ngay_kt_tu], [ngay_kt_den]"/>
      <item value="1101001: [bo_phan].Label, [bo_phan], [ten_bp%l], [bp_ref]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [loai_thay_doi].Label, [loai_thay_doi], [ten_loai%l]"/>
      <item value="-11000: [lEmpSi_yn], [lEmpSi_yn].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvoIqT6OIjs9tvUSIdb5scMB2UY4YDAoxA7UkwTuhq2w3m/AESI93EOglEk+l0qINwR1OrNMi3vvJD2J/zpEPgHN</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOP3/gRBDAeIs8IjJBLSMSQK6HVYvXplQMEaB9RJ/OpPm/ZFIC9UexgmkJCWPu17U0M+xzJO3UT76IVFG9ue1NSk</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwJWhN+BvEjwsiNksJQNrk8E368TygIXy86sGShidVLwD+hIq8tc9zAGjENJezLmBa1GnVePZsMDv65BM333iaKYedMsdW52QYuUawd7/sKvHWkq8XMt8HF4/1ETnU1EuMa255qXavQYNVVmxYZyJrFO2ENoEnfdCz05MtevQQSxVEMnTEPhWIqP2oiK+QrEHEhrDRW4yqLkNWphkJGhx/L0KaUvB60BAex1XNssbkn3TJtwfMx4RYYrkm49Tp3AUWQky8StdPhEaetlFiQzL01vCB/c6n0Vcq7bry4hNfr3spSEe8rhXzaa9N22iNRfCkPY/tnszY/lGFwkvWO5H/SmajmRdvkfTlUiRLFID/Wvx/r5ny8dwAvNXaJQYk+dhdD1NbxAUjr97NWPnsqjZIWKAgzL9GlUu7jWMW2za+BCaTLEh5lq3sTdeQZ4VVd4iUCmow41etBny7HpzbbCgdidVOkRp5SrT439LoLnAlS7TuFnwXasvX0AIBfKm4rElcBwP5Qt/Dn0m6BRYuN05C08JnXVHGJFZEPFCc5fRsQBA4F3uxj2/HCtCAVUa5lqgYaUZm7DulwVuY9XAsZOPjREsGa22Za/y6af/XLEv01QlvB5A8bwqlpo6SUFQG+rE47Fk0UQlAlVFvQG06TDPaP3bP0D521RgNFlIjmPPixHsy3WUn0Ey6DYAMV6wgZURyCjI2vgWxa38PoJsvCqKpLRb/jMYSewZJGAmUF9wt/422xmRoXYYNNMEiLgmlm1xf2jbqE/0Y+mNHErxFB6uVd7ABOqg1LDwKmaXaOEfb2sljDH0umvx0w9q14rYlPhWEHBpxywCt9kytOfQM0e2IcJJJoBanxYF6Z4Nrfvwvg2w3qh5Ous3gH+OTMr5B/cR60Zpt8/EFXQnkxsOxobO/uw9DbcvlkAFsfvSl5HrcEEy7d9xCN/rn+fKamf8VjVECGj02hB18WEsWUqZkvs/UZjUB2OxkT1CfyaUSf820xDg9Bz/LGv3I3qKjZYMSXb6osX0TPISKvHVZs09uy7aos4</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQkgLsQYVSpqEemRHWTf1mhj/Zta8wLN8KCPgPSXbL9YK0BJAPffxD1MADDJJcormBMMT0yYGS4j09QGJxDSsoQg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>