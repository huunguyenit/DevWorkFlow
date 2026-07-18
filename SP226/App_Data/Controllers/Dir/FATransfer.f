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
  <!ENTITY ExternalKey "and ky = @ky and nam = @nam">
]>

<dir table="cthsts" code="so_the_ts, ky, nam" order="so_the_ts, nam, ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chuyển bộ phận sử dụng" e="Fixed Asset Transfer"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="X" allowSorting="true" allowNulls="false">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" width="300" readOnly="true" external="true" defaultValue="''">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ky" type="Decimal" dataFormatString="#0" isPrimaryKey="true" allowNulls="false" align="right">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" isPrimaryKey="true" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpts.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_ts" allowNulls="false" clientDefault="Default">
      <header v="Tk tài sản" e="Asset Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tkts%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tkts%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_kh" allowNulls="false" clientDefault="Default">
      <header v="Tk khấu hao" e="Depreciation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tkkh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tkkh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_cp" allowNulls="false" clientDefault="Default">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tkcp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tkcp%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 40, 20, 330"/>
      <item value="11001: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="111: [ky].Label, [ky], [dv_yn]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11001: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001: [tk_ts].Label, [tk_ts], [ten_tkts%l]"/>
      <item value="11001: [tk_kh].Label, [tk_kh], [ten_tkkh%l]"/>
      <item value="11001: [tk_cp].Label, [tk_cp], [ten_tkcp%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZgKpNu/cZKTrjMMYZG/IOvSQZKetC24kqGyTJqTyesBRtpznhJna9d+t3ajlQJXB4</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZgKpNu/cZKTrjMMYZG/IOvSQZKetC24kqGyTJqTyesBRtpznhJna9d+t3ajlQJXB4</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandWhenFixedAssetExternalInitFields;
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulitjEInIl8R1FIqf1WCLWCVrNRrG7J5VjVorGjMBr/6YUynQZel2a7dhFJJ9W8/7nQIHVeItYsHPI/pPkSLrGyi6ipZVsXqYKneN2F0/WsOnOcg0vjXTUNEYRU9y60Z+1cvyUMqMTsXRtxI33/ejYBpz07NQZiabEKD9qOiGwYeiSBlIbeluluGm6mKNMTxQvFgOdaRqhrbTlCWpQ46+c4cENF5h+HMeznwuds0Q6HE4Ri3fQr+uIpQDCxQWLVEuNFzZKHv8BLTC9DaDmUWOna1Be1ZILqJ/qndFCHsnUHa+RLVM6/66Va/x0Y0czVQInbgOLD6LHqxuv+aN0eeQX6f0aMC1fKOnGdQGrpxDlY7vj/m33FjQtdan6H2DHZlIQsqxXtRvGsoYcQkq2cqX7aFw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n+36q8YbC0eUNO6acLMw0/lT4McxWzLi39qVJeKhnEswDcbsoEhlqh8QrSoXh+3nVmYJy4QQ9cwgEiGe2GuxmLdgh6v6sxODGmWE5WdEavQsOBf/O01Rbm3xO9Bvjmjbrr+MFZoZ5nMhlWAWqr3G+cez3GvIPzI+6FUPg0iHQrnh0On/003haUEgG1EdDmIdIZN0g6w3QeQN4I4EeLf69J50EVFa31YYOws4TrPZa6ECDLC9WAjPRvQWLzMfiyrVCN7CcV/ZOYaHPyKXiYH8Ksg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jGiVBTTB+Ft3JuMTJj1btltgV0ZQUerpl8SCKao5xAU0gjSiRZi9VZfp/SZUKgtrzKFW4bsNrRApay5ujHy6mRKZBgnzfuWIa3LTY7Wtr2o7uOcuikmtQNAye3t6DuPf/+loioyM2aG8cAWk86YjurT8uxAciwVVAj/54RQvcAJyNLiwlYliSb4VeLd0FL/olhnIwTpGLllnijvYspQm/zQ0wYBsGrFWqFmaQ5IdwZ2Z7zj8SoZ5G8eFCplNNaOzBmmdp19gKqHKnf/z5EyqUXhrSdIcyfIbBFnx66e/y26xeTromaRMhLH0xrNsmrjQCvTcmTqG4wCtTrpyIytZFkbbS0jg4lPbEX2yIP6nVc2Q=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70DKOe0RpK6gjhcJHtvN3IHJ+fbGdP1eWWeS5Q4OaEvFaoQRG+AI9bgKiXnxEBWk+5xI0UbO+NV/Gbga+M9r46mtCKI6pBbcFZk5VrosbZD/M4eZ5sk5QHf6dE7oaNfZu+rOFXkvbBqbathKbGInho/4Hv/8xG1Q6VpI3G4bobfc4uCoG3Oqcdw/JNfm2821gIcpzJ3VSUET/TK0EcWYt1GjUGObMVW9UVLYFlElu/SM5BYY26WogXRpc/gNWCGqA0ENHVLHlQjyomm3j9IxftIFWHuybWu8BjIB2o9zWGmcv2mAl/12thNcUKLZxk/YQV9OVqzAXwa6NRXIGXOnKo7vhZA3VmFExD324x8sFJfb/</encrypted>]]>
    </text>
  </script>
</dir>