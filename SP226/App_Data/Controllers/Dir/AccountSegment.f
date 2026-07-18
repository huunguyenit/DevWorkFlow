<?xml version="1.0" encoding="utf-8"?>
<dir table="dmpdtk" code="tk" order="tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo bộ phận, mã phí cho tài khoản" e="Account Segment"></title>
  <fields>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" >
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>

    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>

    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_phi">
      <header v="Mã phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>

    <field name="ten_phi%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="111: [ma_bp].Label, [ma_bp],[ten_bp%l]"/>
      <item value="111: [ma_phi].Label, [ma_phi],[ten_phi%l]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQFkcW+nRLZyhTVRY8F0sHla+7hWtmSamLunoR6U2E0dV4Lw0DvrYNqc0bV39XoFHzZ+ZI2+tUb9uJLwf7pJvxGfFXppVjdK75qCcSCxvKH780wvwerXzXB4kUKMysK3vKuTnl5Ih7MDVNNTLvhdJyxa/dSLTBcHAjWoZhBYOiRnmDaQAb1kEaAbiBVOt79D2FVW7PBFW+1laTR9ndZnaiLkRWTJemezbGaPlaWbnpBVMISfhjqR1ouq27WKPmSyZ1izl3QAzvgNrdYjkpW40T5meom2ZE4Trt5feNIRlrN/terkIMEqIub6DRXojQEppxRt9gcL27e24/MGiT5OyBYI63PTd5GJ1h9GultaQKoar</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nVbo6bvoi5t4z9gP/1Pv6WnM+H1fZDXE+WbNJR25oqUerr829MYhrUiSyK8eZM82+NtAtsJ481LKmUV2Q20PrOoeeg++0aKmEWL1RxP2DWIb7VeH5+cFlBo4mNDig5p/Wtebd3zbJBgDlpreDjEo3KEzGcmTMrjXafCm0Jqa9reb5pKJdjtgnYzEcVfpGQTI2</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j7sXV2An6Eo7qJJB45zOjHKpvBJ2AOBiZaT5y2iQWbiiKe/I1NqVOb5fLKhK6eG7txREC3M7cgG/9CP9fHQMZk5mIvlxlOFFP8SwKDAmJ1MuNzNN6bk4E4FAzV0C67PLpbRqNbkYvL5iSiJcAY9xDWAM+BQJSQNOguhT4wGCwVpha2jucHLjQ0g4NRCNsN88QusxHDcNlitpd+e/Vth1iFWHw5wRqS2MK0X9Ef7DeSaA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkber6vHK21/B33qiMTObts7azKRM5ok2q10Ypl5I+1ikxd</encrypted>]]>
      </text>
    </command>

  </commands>
</dir>