<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Controller "MachineCenter">
]>

<dir table="sfdmca" code="ma_ca" order="ma_ca" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ca" e="Working Shift"></title>
  <fields>
    <field name="ma_ca" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ca" e="Working Shift Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ca" allowNulls="false">
      <header v="Tên ca" e="Description"></header>
    </field>
    <field name="ten_ca2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="gio_bd" dataFormatString="HH:ss" align="right" allowNulls="false">
      <header v="Giờ bắt đầu" e="Start Time"></header>
    </field>
    <field name="gio_kt" dataFormatString="HH:ss" align="right" allowNulls="false">
      <header v="Giờ kết thúc" e="End Time"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_ca].Label, [ma_ca]"/>
      <item value="1100: [ten_ca].Label, [ten_ca]"/>
      <item value="1100: [ten_ca2].Label, [ten_ca2]"/>
      <item value="110: [gio_bd].Label, [gio_bd]"/>
      <item value="110: [gio_kt].Label, [gio_kt]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI6vKWBe7aXQXrRS9zzqkWXRDT8ICXkLqBD2HtFjCYhRceoEEmZezpP4cNutDYVuQ46SmH+N3ekYBKgDe90dzXoHQe0CZjVpl8tZp67vAgy9Y1Xni8TqXhmLBxy1YPONBmdEpv33/efhylT+yAKR3Eq7YiRK2DaVa6uRC3A4HJUQcgbFPiz0xjV7SoOYVUitTqRjnyIPr7qzbwqS5Ggv2/6tiNj2VPGX5siOMibtfOpyUKxxFaMZT0zpCOCGis4G1nT4li6/svnuohoBY1CVx+slMgh83q/xzg4LkKEqdNDisI5+8M1ShqkqgURxhwcadWi1zPnPQe8Xizth0CZ9L6Nw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C5p7F40pbVZpjoxMa0e8KFaaAM47WROtWEdmItTewDqiyUJLJoSGu0U2Kzyvhb2YZZYD+wwic5zyZwqw2pG1cjtnQow5VkpzW8CWCWAdEAKmVgFETmatpX1NQ9Xxmqa0xptgvHaMWvuMlUSvGr5mEt8e51k9Dvor7CtfWi3A+HvRitj18rSz5ICqPIkILfmPkxdFyjWb3IxNX2PtRsaxzYQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteHx1gp7TPYf5zeZELY+DQ3JXxdqsDYdID5tUr7CNAdIQLcWETKpdOVImGeqPra4GR476UezaxQzWGuI5aWizknYMpg5mH03N9TWpAR50MUA7OX0iT7ywKab/+zINyRWQD3Jtu60X0IxU7Mxd9Iuwv+afFJ+3RbmxEMmyIuxRwimfnnFVyYkQMQb8jw6iZh9kaxQvK80SKLAfg+PiqCPJLPEHTY1IiK2Lu7bH+DBemJsbH7xf1VOEGcPQiiJFCrjgY</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV4X1ESNqs/rAVgLHCabENWSV/zDOv4Yce2Ba/V0S5h+Q</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eca7bxbs5SvGkiLfcZCNhh5qHKy1dC+9apQxgkSj+b5nXiZhK0GmhFbxOORcgOZn8rlfK5ze4/+pjM+fwVe4WzX5WngYjQsO0NL4UtxEbK5aCXSLD+dT2ud98RdfRPRwX00kjmDpWP2E9sTf0F1YZ2EfUgPZ4WGweZRjurBnTgKGcrnzeuvRZOsaz6+4PmGPrIop1yqv9SR1rlJ2jcBtSv28AlAzojN24mrY62wbK7F+EMECpOfrd8/For2GqhNOYSXpE+xvLC/Gq/ZpykJOdDpbT6g5ygGVtxPrPFJ/7lwjHNp6KxHtw/Kn3uGJ0zrJnCToKcvhVS7AJWlKNz70tAnKKGwVHiZfsnP9bvs39aMwi/zsgbs7cPtrr/d7qRSrh5ipnrcR+t1/nFWWdnTjQvb/srgNB0PHn3s6/7mUHm5JAkmwVSBYWVoWBmXQQ7JRjQdcMpi58IYU4nbNL+CztNNYGAdObJQqccvCLCkepJBM</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+QE5+824HsdlLYDaZfqrNdg22zIeL2+lacyL0eUcOyjx5pBOeNdIdiqW/GW2NhyUg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NC4wMtci2ihWiawi4sQTqKpGpo/R7/xgC7rnOpb3BiGKA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1zmcirVXzLesCZci/PpW2Wm4ojpV3CJiN+mVYQO2L2MTUQLpZp0sgq7UqjxftOviFQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq8K9wbgN5j3pldI02fUnyOHaK0TE68QSiaetR9bD3P4OuTLH4QGCzSeRvTBiBDmV68=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wkydyR8XStyMnqOjVK+LvzAqiPdge+2gteJgnKePIWc8Fqv4uXiYCq1VrWlNdeusRcylvMTHqI6i9fZ/zSr8gGlupAMezl1yDJNaGLKSkcwUehyLwT4T9LqQ7knxCNlFjMg==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>