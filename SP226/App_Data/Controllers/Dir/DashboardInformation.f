<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ResetDefault "if @ngam_dinh = 1 update @@table set ngam_dinh = 0 where controller = @controller and ma_dashboard &lt;&gt; @ma_dashboard and user_id = @@userID">
]>

<dir table="dbdashboard" code="controller, user_id, ma_dashboard" order="controller, user_id, ma_dashboard" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo màn hình tổng quan" e="Dashboard Layout Setting"></title>

  <fields>
    <field name="controller" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" reference="dien_giai%l" controller="DBController" key="status > 0" check="status > 0" information="controller$dbcontroller.dien_giai%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99JPtUy/MrOKOttzCUF+0cF5y5lJ+twjNVwZTYuzAq71ti2A5ymcS/qcYFqBG2YHHlc5JN515N+bxVyjO6bONtg0=</Encrypted>]]></clientScript>
    </field>
    <field name="dien_giai%l" external="true" readOnly="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="user_id" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="Người dùng" e="User ID"></header>
    </field>


    <field name="ma_dashboard" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dashboard" allowNulls="false" clientDefault="Default">
      <header v="Tên mẫu báo cáo" e="Report Name"></header>
    </field>
    <field name="ten_dashboard2" clientDefault="Default">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="f1" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Vùng 1" e="Field 1"></header>
      <items style="AutoComplete" reference="f1_name%l" controller="DBFields" key="status = 1" check="status = 1" information="field_id$dbfield.ten_vung%l"/>
    </field>
    <field name="f1_name%l" external="true" readOnly="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="f2" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <items style="AutoComplete" reference="f2_name%l" controller="DBFields" key="status = 1" check="status = 1" information="field_id$dbfield.ten_vung%l"/>
      <header v="Vùng 2" e="Field 2"></header>
    </field>
    <field name="f2_name%l" external="true" readOnly="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="f3" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <items style="AutoComplete" reference="f3_name%l" controller="DBFields" key="status = 1" check="status = 1" information="field_id$dbfield.ten_vung%l"/>
      <header v="Vùng 3" e="Field 3"></header>
    </field>
    <field name="f3_name%l" external="true" readOnly="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="f4" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <items style="AutoComplete" reference="f4_name%l" controller="DBFields" key="status = 1" check="status = 1" information="field_id$dbfield.ten_vung%l"/>
      <header v="Vùng 4" e="Field 4"></header>
    </field>
    <field name="f4_name%l" external="true" readOnly="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>


    <field name="ngam_dinh" type="Boolean" defaultValue="0" clientDefault="Default">
      <header v="Ngầm định" e="Default"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="274">
      <item value="120, 30, 45, 25, 65, 45, 30, 25, 65, 75, 25, 0"/>
      <item value="1100100000000: [controller].Label, [controller],[dien_giai%l]"/>
      <item value="11001: [ma_dashboard].Label, [ma_dashboard], [user_id]"/>
      <item value="11000000000: [ten_dashboard].Label, [ten_dashboard]"/>
      <item value="11000000000: [ten_dashboard2].Label, [ten_dashboard2]"/>
      <item value="1100100000000: [f1].Label, [f1], [f1_name%l]"/>
      <item value="1100100000000: [f2].Label, [f2], [f2_name%l]"/>
      <item value="1100100000000: [f3].Label, [f3], [f3_name%l]"/>
      <item value="1100100000000: [f4].Label, [f4], [f4_name%l]"/>
      <item value="11: [ngam_dinh].Label, [ngam_dinh]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH29+GlTAHticqmXCcfTLc6fpgPI4XmXIFKQHvoIR26KN2EYt3Ovg7/fh9LGAr16X8mxZ+Lo0LmSxUgW+Fyd4PXQUWg6b3Q9u6WrpWgd6gkIQnhUg4LS3I5ESYt74369fQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHRzoyRBWAkchPmSs88aynFOmkj0P1Rpq6psrr7uW9BlUz1P8zUxlSzlXWynwGplhkvYXO6sDio0thXgh2ODiFw=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH29+GlTAHticqmXCcfTLc6fpgPI4XmXIFKQHvoIR26KuyJOCLSWErLaEer4TRKb65RD8qxz6c525KeidNwB2xfon3EjbMecX6O7lSefmjqo</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIHalY8pzMKjtBtt6EJ8fIeI6Ec9AwFK85Ga1znRMJb2CqhqL9qLsBMLcuW4dDB9iLeOhmzQqvemDbFds8e6akLQBE2O/sdVeNWP+tRbojNdkfoVRstL97TZIBRqGoAm5Is/gcUehr4NyTayOtOxS+4BfdF/mi4uwxuBzt2U9Dmm4WEHRH+wbm5EII9dZ92OeX2Di7Ic45LJr4c8xb3nMTFtWj3l+C1VX7qHtxzVIB6QURGPVN/LWjubJL4TcQLkfbTnA1vgg5KlN+QO6JveN/GEiopN/B8ieMsDG7gvmWkLR3GgIgJy0Q7n0pYAr6fanxYOmEU2abJisjXHY7sv3r7w==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUhWzGV6RkJHEzX91qefMhYCslBHEGrmrAC4ZAjmHNut4t2SDgAIMEuwSbgPCryKIIKKw7k8WmDmZZmOLl6VnnwlzAZbtBdo8DH4mi1MrYeEIJkPfM+M6SRdwGHp2rbTLluOSdKXXc38HvROQIu2f7zTDJMDA6azs+6FLoa/+WmUbujEA5l/rQ5Ko5lFIpO2jzg3QTqq9KdrwBdn7V+QplTg4m4FZ3kSNhbgXBwZwbxxM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &ResetDefault;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLOzrOv2w2ruc6tvDuvOlpkf1+3HLyffbN0RikFKIcmijtFygM0VhRZx6tWVJw0xR1HEwUvnH690qeJKQdlKfydGU3ukuY4ncZqBAEZwYhvG8+5DiEefij7oYY8Kjdo/cKA+GHhgXG2J55DDlXHRKUc/liDbIEZtQoXFoIE3izlnbVMY87yiuUpGCVM/YlpjNdDT2rtv8y44iD/J1mEgO73j58nMVVuB/FbLHUAfLW4S6IZIjj0okKBIvsO2LMk5mftfKL/OOHRhEOzFAbphsyVwg0aWwuoJ8dtX+BzFa+zC8=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        &ResetDefault;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVyIdfPNw8gS5Ic2uVFemWr4UOLcO3ud1SuFGdPUHHcM6GTOHzq4E9YtvMYUcBN2TL40lzMWg/+NIN2wh5wYErZ8=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRjX8HNKYsCXddis1+aKzEoJo3z2l1FMDVa8ldXBWvgR4lAl/fKAxUBXRM35sZMYqh1C6Uj0JBgU/ad0vYgbDJ4TY2XG+UP0+grHJlB0FoVh/paYgYIF2zuh4HPLPimMSeMyDcjy6KowlotnpBE+SImiFBQgd5FuCHQ45YhowNebDpipBKV32iWnL6sQZ5Y01J65DZA/UsjpTqy08gKWma3ZrsSp4jWgEz6zx4wK96VF7x+tR+oawFBuUqhjNnYEmd5oMW9sYKs8Pf1h/770+FjgZUlmABr7BJD8blhSmHxG59PeIXYJYDmAzXglPpOPDEoIvK1d7MRaOuC5J5l5e2/KBGdt3kMqzovNKXxqqujyAysMIpDjXwWLW+XffQ45h/UOaerwlwGCtGvfAeqNSNFv/DT9suIHcOD3io73As+ZwuVeWse82bY1JZV/J+BN/jcdQhwOYgQn5RoZd0uS0ORzuK/7X57eOdvH7dBx5J3Z</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetController">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGuKTeynFegdOUv6WDwQUeozOIYJzNH6apI/uFd1t5BCINTEph1twM4Ek/wY+uRCIObXeDaWg8AAN8VE4A1KHBAsr+6zYJT8lQz2TC+ZAnVwufjyz6csjG4jaUSGlC5MC3J+CYp2bhfywONzq1mB6m+vI0BRmk9bQl4oVc7537/gIRQxlY0iLo4ezvR69pth+AGpSMTZkItVWKYgb7yebm4=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>