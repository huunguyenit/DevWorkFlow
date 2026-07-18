<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdmtlbh" code="ngay_hl, loai_dt" order="status, ngay_hl desc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tỷ lệ đóng bảo hiểm, công đoàn" e="Insurance and Union Due Information"></title>

  <fields>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="loai_dt" isPrimaryKey="true">
      <header v="Loại đối tượng" e="Type of Participant"></header>
      <items style="AutoComplete" controller ="hrTypeOfParticipant" key="status = 1" check="1=1" reference="ten_loai%l" information="ma_loai$hrdmloaidtbh.ten_loai%l"></items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tl_bhxh0" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="1">
      <header v="Tỷ lệ BHXH (%)" e="SI Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_bhyt0" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="1">
      <header v="Tỷ lệ BHYT (%)" e="HI Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_bhtn0" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="1">
      <header v="Tỷ lệ BHTN (%)" e="UI Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_kpcd0" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="1">
      <header v="Tỷ lệ KPCĐ (%)" e="UD Rate (%)"></header>
      <items style="Numeric"/>
    </field>

    <field name="tl_bhxh1" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="9">
      <header v="Tỷ lệ BHXH (%)" e="SI Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_bhyt1" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="9">
      <header v="Tỷ lệ BHYT (%)" e="HI Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_bhtn1" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="9">
      <header v="Tỷ lệ BHTN (%)" e="UI Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_kpcd1" type="Decimal" dataFormatString="#0.00" defaultValue="0" categoryIndex="9">
      <header v="Tỷ lệ KPCĐ (%)" e="UD Rate (%)"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="111">
      <item value="120, 30, 20, 50, 100, 100, 130"/>
      <item value="11001--: [ngay_hl].Label, [ngay_hl], [status]"/>
      <item value="1100100: [loai_dt].Label, [loai_dt], [ten_loai%l]"/>

      <item value="1100: [tl_bhxh0].Label, [tl_bhxh0]"/>
      <item value="1100: [tl_bhyt0].Label, [tl_bhyt0]"/>
      <item value="1100: [tl_bhtn0].Label, [tl_bhtn0]"/>
      <item value="1100: [tl_kpcd0].Label, [tl_kpcd0]"/>

      <item value="1100: [tl_bhxh1].Label, [tl_bhxh1]"/>
      <item value="1100: [tl_bhyt1].Label, [tl_bhyt1]"/>
      <item value="1100: [tl_bhtn1].Label, [tl_bhtn1]"/>
      <item value="1100: [tl_kpcd1].Label, [tl_kpcd1]"/>

      <categories>
        <category index="1" columns="120, 30, 20, 50, 100, 100, 130">
          <header v="Nhân viên" e="Employee"/>
        </category>
        <category index="9" columns="120, 30, 20, 50, 100, 100, 130">
          <header v="Công ty" e="Company"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5wNM+EjXqSl13nhPO6W0iMRhBVq4Wv4W5s8LJbURX1+jtTz6ZlajE2UvE9TGaOJ/yOmHE3kjVloBbfMa1mVbz8=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN1mbLK8rN8xyCaeGVDCeJsKFG8EvwOtu0BqwwYL9KGpDFwQMkJtCrbS4vg1rkBpp9s=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliQDRbTWfMEubOaFHQ4hzhiEla9eFnw/pl/zVwLE0dC+nRz1VNpcDF9TN+ZB9c58O4VV2eEVG/X/LqKYCcbEu6gWo1Dt2GEsBmjo+dRYPdGSd38XLJ7RtwTs0Rsx38ONBx5axeMZ1fMO9KH06BNbEaSA6TyurfNSA43H5+Hqw7EEzhrS2G9CdIL34EuYH3/m8qqOujtrZc5TxzTbfTs/YIUBSu/0Vc9OOdX9eJejlW84BRDnPHLrmKsKWI5g7Gj9acfAu6CvXJ5GJku+4a0uZuG67wzJnGAVKVgokxg80mhZc3Ka4YNmJb8vYzVpTo5uvGOUx7XqpPLKTgMjHsA2ZmOtd2E01CcFz8DSx5trhcSRGQPUxtGPFxcPdaTreUUHmkjD2YzuNNnb919zgzw00lXJa5d+SnkzXMnuINiCb8mTDGlV7y6PlfoWkylIYAJqeT</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nCfkNRHi6M/mEOBhqz0HD7f5oWnH+WwOkE2P2oPCdGI9fEhX5ZkZCX1e/t1xdcDSK8bL9fzhD5zoBqniRQV5OdiPxwEeZUXS+1NRm24salA1Bke+ovsp5EWAkHI0f5wLJrJNtWT3Xpk9nmznNRpHfXDZQUMG0ph7pVR1isNhHR5NUKEz9y50v9IOSdi+l7exZvvkYrc432aU2+f6WpYMagAYtYQRH6y22OIyGz+84VlTnaqwI197kqixPpiTvC3EY</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jiOhBfHQ+ZMen7E/3asYGu4DKT+H3zlmcHF8EiGO4byH3sNjwXg7+ES9v/WrSexbnyEU3ARmQroo0PkzG780f7eb4+sliwwFpfiHha5rG4kYg3zl4OqUuJN68Zn+tHhVUqrYe+6JAHfdBSjF9BuZcgr/cU/B+mSH549Tda8Rn3+iTOmrSHzHHitqHVl5NZ1NIxe1LOglLtFwq8UVNd7h/oMqCE/YQWyATj9kF1L75Eudh8ufKjHtwJ3czQ9ij4kcynT04aSE4aR3FCEZQVax1m1QlxohkoK0wBeZOwUNmWUy/tqWg+b24L5C3DWi9XF/P</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbemvHmePhRNTNC1xPpvXDDdy7VXT7MX4+9P73MVBKAd3fD3Gr3fkMxgOdFTT7NA55Pg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HuzKwrwbenxUDw8GXT3U56RNzuEvEOi8JqcMe6ZNAyYWgRtLB628thubm2sur4ngfU95hTSasJXKS9cW5sOBkb0myGlMA0uSDza5IGCt8JNeT+hHn8ugfSuybUVzxj/4m3A1ksTTZj6Wr5V8R98DQ1BxOYFlBcnOfWv893mUjJs3sitslYDKqYS46khXoXDzWbYRi2c/NOh6FqpuM+cXJOps98aP5tapEWZPcpFroC7oHBb06mXinoi4aPQ8ANcl22Cm4uw+pF+c2lLVzGQvaE=</encrypted>]]>
    </text>
  </script>
</dir>