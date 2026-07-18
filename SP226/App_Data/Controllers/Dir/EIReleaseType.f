<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmkieuphhddt" code="ma_kn" order="ma_kn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kiểu phát hành hóa đơn theo kết nối" e="type"></title>
  <fields>
    <field name="ma_kn" allowNulls="false" isPrimaryKey="true">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="EIAccount" reference="ten_kn%l" normal="true" key="status = '1'" check="1 = 1" information="ma_kn$tkhddt.ten_kn%l"/>
    </field>
    <field name="ten_kn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_ph" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu phát hành" e="Type"></header>
      <footer v="0 - Phát hành ngay, 1 - Chỉ gửi dữ liệu" e="0 - Release, 1 - Transmit only"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [ma_kn].Label, [ma_kn], [ten_kn%l]"/>
      <item value="111000: [kieu_ph].Label, [kieu_ph], [kieu_ph].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+JQqY3ZUdFitAJSNSacZHHMLq3ELVTuelxhXuigRnJ4avm1pxI2S4FZT2Fe8O+965kDyQQMyij2b3oBJwjpSo0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6NvE5bhprSvW2D0gDSirQmRaxWH7Pbm32pBZThlj/mt+JUAHDc2G5THbe59NxRjoel+ENnAurOroiVfgoHOJnU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQPVWDQ2SvLpGMT420mlq0jywhLSw2TMonTZTCLristch9JVcv+T+P3ZBPMRo39zBU/fs8P0xKC3G+/hazY/1Dv4iM+9+VPNuouOfqvDCx2YZe0VSsnQ/aXi1v8wXW+wnA9bilY1NqXuTie18B0zbBMHBu5t6l/erzeKkhzrjZXAbCs6Twov28TU6Z9R0XU1m/351tE2smGStUJMEND7vlGM+8hebYYTk90GgMCTLwDumf0DITiahWCjsTrPdCA1nWoelTKdmiov3LqiFJxVh7iBCCPV8obVSikKT7uc8rX5gDI6siCYOFBoFHzqMQOUhhmXRNbJEoXBthnN5LI/cx7w9mRpvjjvP0M+DSh4iHwir2k46yNK+YUlCl3b1KrtIGQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nyLUT4LMQ4eCOc2r20DXcpMpWwwR+hBbZ6HYgHHpl7P7XFOX20Fqhk0nUo4w781cEi/Patu5oLIquQDtKCLqv2hvT2NPtnZOgEViAB6kF3xZgJShOfT7EffJVIhxhN7yLul/ZDl9tjHr1Wyi8UWWleNBLU0rgYkzCI/Te/mQT6imZwMk8njjloUmNzd7oMzuI</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jXrBJI+YG1GhUn3JOuXWbx+gvLJByw6NYsyFkNprDI8ooJZyw/KAeyWl+f/exobjPVVAU1PNeTP7mlIGu2K5OxVS8SbO/sXqaKKcLgsjLEVKlOyCKabMgO/t8XuEFEuO2VQZDPoAcS5+tFWZ2Us1q8wfk7godtAevAsNxHdeyV2yRLhi5L7aut8fGWe81us3Cj0nKzySkVGqlSFOnAB/bcZiIMaRWM/ROetuvruNuFNs=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbes3+fT9Dvz6H9tLF6RcF/KUUn7TsLCnzpUB9nIH6DkJT</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JtSYx0jKhCznPmVa9/KDVtApS+M/Mo4l+3FbUkRguXduMQxjBSWXHT5HDicSkb4p7RDnjJuJ8sCUyLVcGHi/K2q+/sfyHuIjX98r2dKoeCNtgwDIIyQ8Nss+RMHcnneFJmu6es4vNomEdyAz7YCzQj72CWVzk8cSa1RFMVpRBLfAeT68jSw4CYXIs/h2ZNz+xU5Lum95AqYq0T2eRyqyqTjkSpU93jHCk6CVsYi+3XJiDuMpsPYyJJ0vRPHM2NTsW98joIVAyqAWbHVunhtbHrz8Q7bwf5lyqgXq+LyT3exEPBPtKGsLm5M4xe/u2MS2vXJiyOPt9lkQrrDLI0EGYqA5Z8IR3dvcE2Yx3TUu6mS</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>