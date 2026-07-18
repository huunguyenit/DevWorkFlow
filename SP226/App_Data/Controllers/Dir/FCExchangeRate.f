<?xml version="1.0" encoding="utf-8"?>
<dir table="dmtgnt" code="ma_nt, ngay_ct" order="ma_nt, ngay_ct desc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tỷ giá ngoại tệ" e="Exchange Rate"></title>
  <fields>
    <field name="ma_nt" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" isPrimaryKey="true" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" allowNulls="false">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110: [ty_gia].Label, [ty_gia]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3Vs2YbfrK+fZGJ5J89WpdHJgmF8ldES5iaDvPWXivHokEYA5cZkBEBL6rx9xCo5DhbfZMofdgJrQpLFWHudUbRPIkbrUPSZK9eJAjDfiYxR2ewYXZsAHkdIS3T4GNlZK36SR1mNN+0bb6oyC2sUcM23OSCBPRrwPtgu62dKW4HSApGnzBR1kP/8mwvoavGQGg==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3Vs2YbfrK+fZGJ5J89WpdHJgmF8ldES5iaDvPWXivHokEYA5cZkBEBL6rx9xCo5DhbfZMofdgJrQpLFWHudUbRPIkbrUPSZK9eJAjDfiYxR2ewYXZsAHkdIS3T4GNlZK36SR1mNN+0bb6oyC2sUcM23OSCBPRrwPtgu62dKW4HSApGnzBR1kP/8mwvoavGQGg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliXycgBwZQJWk5NqVU2cFvTlAHKWsbS5QrfO/jX+Gsts3GP6OXSOY/QPKMvCvo0bRwWaFnNQ4bSqVARgCQkESaRs5zH7gB/dV2kc5Uqb/iJHECYkAt5QzLok/qqVdsztd2Ys/+NTvbkx0g7sha2AaTZihbgeV/rSaf95mDUlmPsgArJTWjLjEHzCufYl80SlODRIZRd8wqfcdvl0Vb9jQJt3BbLJXnV8ldvkD64UP22VWScItms6ENVRAAgQH/snbML100u0bwNOSLhgGMSSSqzxYeb/MBex/YGGFRgYxvZzB08HRU0hy8w+EnVD5QlWBaoanoP/9PwrdZcmshYIibjCeRwZBrOv0uZcdxInb12YC9IDF53HZV3avJkcxhf2yd</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2nhwYbnVWA7Lwk0GA2x2SH1x+s6IB5RSIp3IKqnj9pzbvkPRmhnQCCwDgNJZqqm/xOG5bEtUSGTNEG0MUdjG485dkU/sSIpArvx504GL7MwwWZc+xuVhtA2FQmtnTUrzXEzlHsARsNbiZCq+rHCnzfNfmfUOyrFq6DOb/nYfBgVtT1D8N1nxYnppybagnNqIF9FPu2/LeotdLiLabfO67eIy+YZW2yKgB64g5i00K0zYvuNbLaTNi7af7pqjpG3Sj7yi5MSCyC2X78oToeLLrw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHNu+Ln2q3a45aBlTsQF+xlbzcE7wQii5rsRL5YLPD+mzyTpAAYc/VCvxEqHoB+72IfeNz1jcJU/y0j1VE/WhcD0QTvagqhw3nnn9Wm4X+QrK9538nXHvUe/47EwxcczXdY2fHSGADyOWwsQp6juHg/dXmSpiYjiDDWAXa4lAXPMY2+4pyoJwBhqtdgxgiQoHPcSUBBcm9iz4l26Kk6rZ4gAZfVvsKojyagK8ERA+WnQsGzfvVX9Uu98rJiu/pueQli/O1facaDPoJhpc97VczhoXJPB1wOuPRYTO1XxUO3+e6nf9/k6Eu9vAMNDR90cG6icI31g9cne6+Og1SHgmDQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeq6vJ82MBYWsgLYiYHxL/plLfv8BfYrvlbStmJVuulqOCjyX60xiwSSnxYWd1mp+8g==</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>