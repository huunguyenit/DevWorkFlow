<?xml version="1.0" encoding="utf-8"?>

<dir table="hrphepbp" code="ma_bp, ngay_hl" order="ma_bp, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo số phép cộng thêm cho bộ phận" e="Department Additional Annual Leave"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_phep" type="Decimal" dataFormatString="##0.00" clientDefault="0">
      <header v="Số ngày phép" e="Annual Leave"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330, 0"/>
      <item value="11001-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100--: [so_phep].Label, [so_phep]"/>
      <item value="1100--: [ngay_hl].Label, [ngay_hl]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuMgNGj8tJDJ6wTG3GYYmjUX/4c40GA7QfMT5JCXxH0lqqhqP1kiGSXF0PWREMFuRQvsdcYeavKAbCSAYnbNHBtvLIspOz/mA0Dj8XItojGV5emahZgRDq0FC1L0JUE4QDKd6L2hfC0KEqRMFOPSu2nNysqMTIFP8amraNI0EIT5OjPRmQuHSoetCk9SMdNdyD6V+suZrICE6OtgiNAPXMA0iQNQk9YRwP2+yp/UmYgmFeZCGwIPiIL0jXIzKgwOj0tNqgpu0/3kCrx6aEZF0DxYAUH3Rfjg2LhwR0OYNKmwGXlcl8kCuzd1A9Ip/twzRG38elIqET+/Uzy7NxBWLimhkUfRcl2lwJhakJ2mUNEvfusWaiUrjnzzc3MNj9oNSE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nqOdXWM7pi8qCe/eqeQQlCdPBPAE6Pi4qGSI+BfijYlQy3DJpxIyO6Q7EOaYSBy/LhqbsA2nVs+9eQgYc5Rngkp+Y3T/eHarxPChIbbYx3ZVnMiD/8rDRGRhWlzs3gg67Q3jpCODAKh+i6uL2zKP50QurVUW4ySWcfI4UfStrCPv+ImrcIaICPN/l/8zC47uPDqmjyygNR5fCIyuJdQj6IA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSQHCh4JmiM8XwXASpTrkuvVkwmkS4xWzAtEVojqBMIqq3QahPe4OpW5Tsih5i9ZVcwgKjOYm/WuFmPAXW8EFxT9nGoEo4s38pzd8AR6qINzj6d0XGS19AIp9XHAAV/jow5ISqyBbE6zLcXzyB5O8ug++lOHaYgrLYRDEvWTitSVBa0r5XCywqn/gigjq0O0CWi8g6yqJ5Ceq/GVcLv3ssWKS8VAEXyBUiJ3u245xKuI8I9jTJvJWnHNvZA07gpCQLg==</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuZh6ZMhJ3z4eB1uSgYugrZGfPKBn8zx3XzzDhy+7lqOha6Yf4yNHl6WvfT1/ZNUyg==</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>