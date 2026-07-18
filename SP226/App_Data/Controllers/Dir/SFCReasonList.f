<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="sfdmlydo" code="ma_ld" order="ma_ld" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lý do" e="Reason"></title>
  <fields>
    <field name="ma_ld" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã lý do" e="Reason Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_ld" allowNulls="false">
      <header v="Tên lý do" e="Description"></header>
    </field>
    <field name="ten_ld2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_nh" allowNulls="false">
      <header v="Nhóm lý do" e="Reason Group"></header>
      <items style="AutoComplete" controller="SFCReasonGroupList" reference="ten_nh%l" key="status = '1'" check="1=1" information="ma_nh$sfdmnlydo.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_tt" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí trực tiếp" e="Direct Cost"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8TzETId4X+ibqr5ChrMODk/bfWEYpgbh0DKgT4eTby0FKqh4pyFe9i5A0OCOBlMo5w=</Encrypted>]]></clientScript>
    </field>
    <field name="tk_cptt">
      <header v="Tk chi phí trực tiếp" e="Direct Cost Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cptt%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cptt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_gt" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí gián tiếp" e="Indirect Cost"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8TzETId4X+ibqr5ChrMODk/bfWEYpgbh0DKgT4eTby0FKqh4pyFe9i5A0OCOBlMo5w=</Encrypted>]]></clientScript>
    </field>
    <field name="tk_cpgt">
      <header v="Tk chi phí gián tiếp" e="Indirect Cost Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpgt%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpgt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_ql" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí quản lý" e="Overhead Rate"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8TzETId4X+ibqr5ChrMODk/bfWEYpgbh0DKgT4eTby0FKqh4pyFe9i5A0OCOBlMo5w=</Encrypted>]]></clientScript>
    </field>
    <field name="tk_cpql">
      <header v="Tk chi phí quản lý" e="Overhead Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpql%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpql%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_dv" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí đơn vị" e="Unit Cost"></header>
      <items style="Numeric"></items>
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
      <item value="110-: [ma_ld].Label, [ma_ld]"/>
      <item value="1100: [ten_ld].Label, [ten_ld]"/>
      <item value="1100: [ten_ld2].Label, [ten_ld2]"/>
      <item value="1101: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="110: [cp_tt].Label, [cp_tt]"/>
      <item value="1101: [tk_cptt].Label, [tk_cptt], [ten_tk_cptt%l]"/>
      <item value="110-: [cp_gt].Label, [cp_gt]"/>
      <item value="1101: [tk_cpgt].Label, [tk_cpgt], [ten_tk_cpgt%l]"/>
      <item value="110: [cp_ql].Label, [cp_ql]"/>
      <item value="1101: [tk_cpql].Label, [tk_cpql], [ten_tk_cpql%l]"/>
      <item value="110-: [cp_dv].Label, [cp_dv]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNsjcNw4zRKATSYfY2PZdBYQM7e9qxg+/UhzzdqR2Fh5CC4DXLUM+6IaCgw29zlVzEY5bKI0nsI/XBlLsvL66eJC/DtFFHCV3NEg97oV6TYX</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAYri7mnz7OGnLjuozYkHmDTAMXeBXB9HFsY9kLSb9NczbHdYFoYaIMyVjh9ZJljYJcL9ZXAMj/NHAzkhInSvxej1g9tQ1L8qN4Cu8ZePKzt</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAlToWsMdfAZsGJs2F7HR8uAVTmCyNi3w2ydWwz6WtirWoH1xCnBoUy2oNjDfkfCaoP46O5Pv0qrrX+OAzmc2iVgLzEz5hTKxTTwyLZ12+xQ</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI0OPr0NL8LimLyK/g0Ph3SIm4/s6PuXRMcs/EPmKhTojwCmu1LjwVa/enpbvV8z+/BDPZtLIG713yXMwVXCzBezYxZpgIpiEhvHLCrRO4UthgMu5COLI90Be5897DeMDfYQwIaBqDMzG9nmGhMssnG0TFQ/SgFXrqwZyeEx+xVPfhla4cA9CUcCdNd/Oc8RG58RJS9soV6rSCmf5k4MTC9w4qXTbp5gpGvu1gDEtcgoEE+PyzaDrx6jty7uS3CYwHlnY1Ey0ImvnHXoA2rhRPh7ykVbRT3u580CZhHD3lex3sminlNTMrR8jBlpLEz2aGh3+Kik5Gq4+E/L4slt7Omg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C1hyD3ROARpIGu+YxuaxfmKb2puqQBu9xRJ3j73bSEf1208BWkZUaIap0LyP1X73gS04aZ239RNAQU9AQUN3reae1hKkoC5ZgwAqDRPrsDjrluuTq6bb2wvyX0X8Ey0BkEWdiS8ZzN9hBqjVb0peOUnwnTzHlBWYx1FUOQ1DiUqDzT821+lg+b+MBefl3UUiqSlyZYAKOt2HLy859OS62VBiR0TdgtRPquPcTI+SkNco=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLBRj29v1mIO96Mgsez97AlolZPwov8UmrqbOFvh0bzNHIVQjLsLi9mvnNzOIO49n4wHBZ32EB1LeSA5wbcBI90beHevGz1P3X4OjboTEaZ6cjwF9VtLdj001ZDc6tK3Zt/5GpPrAeqwr+Yfiq6St8bvhPyvX5Lc+eLKkeHcZSmj656uYBQ8TdQGSIdxqcSdMwMEQSB8U1IdVyJsfTutuA4V3hiwC/LPxoeDyLdwu52U6Urp17fXB/o/fdfbm1pWLU</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV4pkNfoN9/ZmcFg4BxKcFi6Tclwov8JBDdCz9FLNKDEU</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQgaudoRIQ6p1GKbZA/Q6mBBCGW4y+eDCMTtcJkAQ9ymKloGD5vBrEtNb2eiDGCHDgSUj/vWA4qzaMuRLZDVssCiyzBfrglxzEapWEW5YWZc9Ywdi79+EL8YFDBzSeJ72hoPOUd/zDpiRUE+MVS6raAsNp9hUS1EOZrY3KpyHN1wIhlhTVNr/3RNPVf9sDUYe9GESsy3AX2T3bRfzvffPtE1e9/J5+Py+sLw1NqT/dEjJbjGa6GpwwJD+yfBauIvEPzo6Cf34MRj0cRWJPXAzCvHjP0Hdgf2//TiyuNUIyrobpTgQ1OwDZcOnHbINBozVBD9/GYTptxWkdLPAWdyq/VB7AUo/01/f8q7p5KyzFgTPnzVhjEVZ8UwEjRl2Swcjr6cQQeKW7zTPYiBppFeLQ4=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>