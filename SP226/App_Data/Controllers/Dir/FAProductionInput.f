<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY CommandWhenFixedAssetExternalInitFields SYSTEM "..\Include\Command\WhenFixedAssetExternalInitFields.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">

  <!ENTITY CommandFixedAssetLockedBeforeEdit SYSTEM "..\Include\Command\FixedAssetLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">
  <!ENTITY ValueDate "dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldDate "dateadd(m, 1, cast(str(nam, 4) + replace(str(ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldFocus "ky">
  <!ENTITY ExternalKey "and nam = @nam and ky = @ky">
]>

<dir table="ctslts" code="so_the_ts, ky, nam" order="so_the_ts, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="sản lượng thực hiện của TSCĐ" e="Fixed Asset Production"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit and kieu_kh = 1" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="sl_kh" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Sản lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="1111: [ngay_ct].Label, [ngay_ct], [ky], [nam]"/>
      <item value="111: [sl_kh].Label, [sl_kh], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZhonkjjOXULKshY2+S8Wwtpp+ltR7evjU1bccmODYL5j5h2gMWDVPOrkj3JMBOcSesz27cR4lOt2qXi3lPzUQ5g==</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZhonkjjOXULKshY2+S8Wwtpp+ltR7evjU1bccmODYL5j5h2gMWDVPOrkj3JMBOcSesz27cR4lOt2qXi3lPzUQ5g==</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandWhenFixedAssetExternalInitFields;
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cvKUrGbIGsw1gGgALHNLFTbP1ti7UQ4lhtWVSm96s3mIcX8iJ167Bmtj++FLDj6vSQLR+x4o2DSaoDS4ELuPBvsQ7UwHVzQz9P7Tt1wjPJT2IsJgPF2YQHmkPQPFmo9Z+fX+96CZnCwYO5+eJ42tVIgkKkMsEhxAyXKMY8Oth/mHGbXutcGGziGx4KGXlwhip2iUn7DB99NBMjxw4lcKgKJnOQkOzce6WI74BY5PFDtm9FfH/dZ2piTdaB17sMg5p8kIWazIE22WZMRGkX97TDkGW5te5vHK8B2iddQNL6qOr6QiIDtMueDm/KKe1Ca8TwokkXlVMwjz/muL1f85Nej3RfPcq3TPGkaPnT+/FD3fA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82ni801LKI6kW4s7CWteK+tR9A5bn0EGRWtTkfnHspf2kUntA/7M2dovCh31bIpEp7oFtjMRfukLTiXd/EpIj6ib665Pwh0ypWtmiffJQKG+TcI2rmL45elt+nADIxlRpMwpIEKDCWwgPly/TuFnKruHLMj+qDfsP0FUTIfbb3L5sPV7X432HOpoYeTjEB9gr94</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jGiVBTTB+Ft3JuMTJj1btltgV0ZQUerpl8SCKao5xAU0gjSiRZi9VZfp/SZUKgtrzMR6o6ivgMP1TNHuySck8JCEtLPcd1syv9GXJ7mDPqjg+n9ztwDCQ+Ny/bsqqytI+aQV+ZeKIjRMt5MojVmN6VGgTKLIjqTRk2UsLHk3lAlQmuDRwrgCCYE1jyt7KKlrYif9EIQnRD0ynnojm/rNxM2MK1RZRLEP3fhAKpF5MRJ7Ysiqp1fTE+y/9Bx2NXCQwM6BzMCY6vGT/4ceNVPhERw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbemzdUd7aU/79lqGl5ZH06Fk95IPZIwvNcq13A82ZYKWFkjcaCSvOmU4rJt3dZbRlNw==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckLockedDate;
        &CommandWhenFixedAssetExternalBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70IKbfetttYg99hVlz7ucZkgQrDOEex8eZVGiArZBOHO/I2tQOHTL+XkPYxZbXKQhC+2jSyDmdfHQnMQVmOzU+8xjg9TTw3OCEYHSvMb37jqO0xJLsWzkRpKPweCY3BLC/zzwJiUd/dpdLbnTSEsuIAQiUaTHON1r+Iac1wInSwxhzUsty5neG21Xam8S7x2nUoHftATPRJYNMT8OsC5sXIWKKu5EBpYCXBjWPzez8IA6MvfR2ujdRTIlQmPBVcBqm75epw18MItAuR/CGSUgsWpmVBWXaFkxQs1mUqmk7quodQZluy8fs2hTgEDfkcE5/A==</encrypted>]]>
    </text>
  </script>

</dir>