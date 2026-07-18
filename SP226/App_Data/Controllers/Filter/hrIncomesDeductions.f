<?xml version="1.0" encoding="utf-8"?>

<dir table="vhrcttngt" code="stt_rec, ngay, loai" order="stt_rec, ngay" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrssK1tuxVfApR5KsByhmMX7qmSKIuv6x58si5O3rfF5buDhPkIxb85htdKFQCCEaCJ4=</encrypted>]]></clientScript>
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
    <field name="loai">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="hrIncomeDeductionList" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$hrdmtngt.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="110: [tu_ngay].Label, [tu_ngay]"/>
      <item value="110-1: [den_ngay].Label, [den_ngay], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11010: [loai].Label, [loai], [ten_loai%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0mb4WrhgaB8qrXLtaYUE4MIUMZYdqGr+F2RFCiDJt6tkXJBciVWbc7DB1PfJIAM7QABJh98RM2F1x+OXdByFEaznhOdZ1reLfs5OmTqqs9M</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Bbvcu9NMJJ69NSEFLz4euhT6z98m6myBai9ia6DPx42XrnYG0VhYGuLf/OP7eF2JSVQn9fPaSrPPYoxfk3q4mrNZQk17rQJq2C2WELp133</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ApdFkqajK05i9SUWmzDG8y8oAIlCQsBRVDpHtmcsf5g0tFJ8IDCgvGhhRQRoGnGvTKSAu+RP7sGcR/Ppomp3P5eVRqsJUn9bLUMWmtUMYniwtR3Ht5VCBUp2G9vBfhY3bzYGHvcfpkFimvvLVRG0p3AS/YYUpFWrWvXQ5/0Z21BZn0NCVEDe5RCx66fwoTlyHSsvVyMOEqoYh/4xLlI0eaZtx9gfuxh+VhCvQOzGLGF22adJuEbIPzE6Len0W0J7nfhbie4QF0/hqprqNLhXOvxBaHgFZa7OQh8mBJN0GKDRdusrTVF1QzBhHUIibOqMF5u34Mbpu5D4/fJRe7R/+EYyC8FAC7uahlDdz7VXmyLrFqmJNB2KnhaQC0EeoPOIA5OkindzH3e+7X6st+cSpfIfjD9QCTEaiGLVs36teMEOpFg+Jf/Eiwizsk7sDoyVhKtdVSssunLxItf5DDIaiOnQ+kK2LyS2meOHdcSJPVHm5mlssivGWgvAztevn4gMztjA8HcbRD3UERbg5car8kgGxXJBRmPC3aRhrlLzbT2Zes9cy4Lopbgj6lycy1LrPS8SMeSJCKrTGGFaXS6er0X5xXGKLCxmIwGvzNFBRaqrfqQE/BIORFhnWShtPy5ZKYXl333Wi3JU4SadhETIViHICerge9HnS+KJ2PMgd4bfEd6naJ+cW7SYwponprBsQCVDQrpfkQfUyGzI9Dz3wo=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RvkanJ8hkyOGyGRkPgHEvyFtcJCp+0PrKgvTE7w6QvKECUowinoHqh+NUOEJMcVJyCQ2WF9ZkQ06w0aln9BLucVhrivSK69UILS+LUWfXRJ1UgJinZPwwgVFAKSVqtnI/mlZg4+Va3dpfnTBuQLPf8=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>