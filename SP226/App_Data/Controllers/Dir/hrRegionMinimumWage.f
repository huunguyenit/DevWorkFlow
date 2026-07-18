<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdmlttv" code="ma_bp, ma_nt, ngay_hl" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lương tối thiểu theo vùng" e="Region-based Minimum Wage Levels"></title>

  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="luong_tt" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Lương tối thiểu" e="Minimum Salary"></header>
      <items style="Numeric"/>
    </field>
    
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" hidden="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 100, 100, 130"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1100: [ngay_hl].Label, [ngay_hl]"/>
      <item value="1100-: [luong_tt].Label, [luong_tt], [status]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulidlfppHwj/13UD+6SfFokqD5x8p+Kk1OtkQsZ/l/ip/pylRD/S1urhYuf/YK2In/q3nZj+coB6c/RloPQh+udQwo1t9xYCjN4LCKU8pv+w4X+4UXFQkJmE6umcD9h+4nMlfpKvJZEHB2yjsMPJbAip6uzOAlsDUWKHLSvRjPJOM2OUzAchPj+UKE0tZLCf77+SUHSB9sn1Wjc4JNzCL7QCS0B22XLTxVQeFz0AEmKkBq9SImVRFTsLWHBRpg7TLY+PUsgUgVZHUoI1j0vz+yqhtMtusd6aDvrC/fF4sNhxVF1gTSlPgYrzTUq2vc6hcCECh4DVm1iXg1qA/NRHrk5wd4dITS0aff1LWEWQqsbMJE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82np3U1OUqhjLPsFmfafI2YgmieMrzBRDQhl/b5OUoIasLJsrcsAxvX7hv9Nq29Mqh1Nolt0jmbG7tSyfrTeUaPSGEgltEnfh8Ya3MWIaHZ6n2hEuLycWuYxU7Mk+RmrXGJgFQxeV8IdqV4n/BmJnhiM7w9qEB7wefgbSK3hJQEj7n2JYGko45UXW41cEI4ATAP</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSVHOjoO0tKxAWWdrJ3W1fxmz7WHQSSvr0m+K1TFh/fV1FkgRB+Mml4lTToJEpT7UrUa6ncZQ3HNZ7B+NePfYiYsPbno/dcud1guIc1ZPV/UjtNfUSGyAdDGLvJ9lv7F31OeyB7Mt0a3RdWE4bfFkfvln3SwKouvW/PaakZhR9ueBnWOZid3izJViJxwmKG2qpqO4kZGYA6VK/drXWLO+7MEiAW7H53XJxXnqki4tOUo/L+lgdjy9hox9sAL2TXu4Yg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuZh6ZMhJ3z4eB1uSgYugrYu1koKam2fnJosuF7eWRcD+x7FX15ER/OBcXRFUDEAo3F7x3/O4aaEF6SsBH/FJiM=</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>