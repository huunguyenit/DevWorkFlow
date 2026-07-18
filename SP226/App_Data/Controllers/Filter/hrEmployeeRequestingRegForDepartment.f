<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdncbh" code="nam, ky, dot, stt_rec" order="nam, ky, dot, ma_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo danh sách" e="Register for Department"></title>

  <fields>
    <field name="dot" isPrimaryKey="true" type="Decimal" dataFormatString="#0" clientDefault="1" defaultValue="1" allowNulls="false">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" readOnly="true">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" readOnly="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chính thức từ" e="Official Hire Date from"></header>
      <footer v="Ngày chính thức từ/đến" e="Hire Date from/to"></footer>
    </field>
    <field name="ngay_ct_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chính thức đến" e="Official Hire Date to"></header>
    </field>
    <field name="bo_phan" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1CiGxOKBYyZPYouUqaMcywRUSLJJGRFZGFuH+ng/HSsU79XDHz7lJEnmBpazNYxCcg=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0, 0"/>
      <item value="11001001: [bo_phan].Label, [bo_phan], [ten_bp%l], [bp_ref]"/>
      <item value="110---11: [dot].Label, [dot], [ky], [nam]"/>
      <item value="11001---: [ngay_ct_tu].Description, [ngay_ct_tu], [ngay_ct_den]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1knDQUw0B7bvwvaApV6Tas1XEVzLxAavGsEXJZPLEQ16NoHUQgEYDPTa5IxLIj9a2228eUAOCu4n5F+ALbVISzoxyA1ZLtr4JDApzw57zoR</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxiWn1XwMbwyyITpd53qAFwzXNtxhijTRk15LHeZ3SFq6FBpoeR7CstCW3Y2hEQqMLDaXgbiG3RhdzoX6COERabZJjy6SH6Ap2oz305irKI9</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+I7U0B82VB3sJS0p0rTa8Z3N8RjL4RFK83v0F3tWkQSQoEdDnZFNAHiFRZMo1BZrvZzQtWWa2Eyprm7rQD5Q6PHVni7Dr5yRpl+UccXAwxh4I1GaSYRIxGFJD9y6mHxA8cxI87IhD3AtmXBTlXSuIsP0a65T6xyxbzqIq1yFyzFLtRTQvQVJ96Xv+ROAtEAsGy42vbVrr//SCPilcVt5bJ8XcTZ9czgYqf5d5VbYvFntlysr99EOI0jhLE6CnBZYxVt7leV8Nx6P79bIz0TNWohtfd7lcSRnpS6OQfURPgEvGjaRZcm/OTLvpBfl+208LLhBb+N/08zXZsHQTBLdcn3ZAJXfvJOnysFCemd1rZoSU67TSvgUCnGrWapkIe+FvWHzPG2nkx4MxxYwdyC3OWt3LnJCIcO8iEFqd3dWfW6LLg9FCDt3NcsqYwODhJ7z5TvgedrkDAR0MF9UHz7+KCqBZhdkCSKa+rPcA8dOfZnO50lVQqHx+Zaqa3QNGNhDGuOxfOb4wG2DbzlrEZrwyuxpbHkbp5HOQZybY4LXVMLvNvbGbSKq4wt3yKBezOcAEQyaqS5ibLtne3GJs9i94/7IzMcu6IeF4rKxu4g9ija</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBabhh/QPbQoNQpbsgyDg8om/x4e+AB5IucDOQpAblRZTE5kDrWbQ8c4JH38svv1GbmA/M5JNxrHQTKUULfCn4m2MR26bl+SVpA5dQysMQeVfTYFCL7tWTcmZh1gATBvJrR/hm0pz8ThG/p2Sgnc15qjKJpRZEzy29xV0sqyI+yCcdzfUOklcRijPDyQBdCU2+o7L1pw8cBf8Ugn0BSzNGnqDFk7TyZ0eIwCxVT085rdjVCr2IG5jnpjf4uwjnFzVj8azVpJcxN3Z9bIqZe+kGaKHMjwBnLwQ8CFyY6sIKOHcEsRVjQ9jUVxY2+VHiKBNwweJmkHs7CqdGA4eo1ugs/YA1JBJU840t9FDA6CQy7Z8iiXlw2+HTrzPKc8Z3geFKoKac8kxi31dud1ixmuWFrQznoEJe97i5YMGLh8FykuwrIqY7Md1XKfQlGTOsPKcqplOFWfK2oniOPMgihf1bOwznxykHM7HyCVVFzT0v5fxhvSUoyqZqJXpRqe4+q9PEXxTMlFg7on1FexQ9bVEj2PcTqoPRz6C4wRem7RNR1WwNe3RM2cd9f39aGfKtDudDzXOY3ZUiTZ8yC/Zx/bxTn9+SVgVQ/WM+A/O14RvW+WiQ==</encrypted>]]>
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