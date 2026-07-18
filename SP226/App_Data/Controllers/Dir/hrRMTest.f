<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmktr" code="ma_ktr" order="ma_ktr" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại kiểm tra" e="Test Type"></title>
  <fields>
    <field name="ma_ktr" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ktr" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_ktr2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="diem_td" type="Decimal" dataFormatString="@markInputFormat" defaultValue="0">
      <header v="Điểm tối đa" e="Max Score"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="####0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_ktr].Label, [ma_ktr]"/>
      <item value="110000: [ten_ktr].Label, [ten_ktr]"/>
      <item value="110000: [ten_ktr2].Label, [ten_ktr2]"/>
      <item value="110: [diem_td].Label, [diem_td]"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9uObV7QOkBsfen+WZqTe4LV+s5gLHcluhYIXMBNA1wZ1sk20fMAenob1xkWCNNoepdrxJMYmQrCgrKhpVg4MA4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8iwZ3YBJepQjwLfIdAb4Q/tGI3hIMMvlTe2lCmn7hUpA2lTxruwYe3Az9mTeCX6v1zg=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEIJL/UC7EISCz+mTST7VWN1CmnTqHjTXTt98i8P6/K7Yusr4zR5x6yIxdvMFYhQ5gEov2ChMX64GAHnbDH+ydi9c9EexdfQigcDKrl5IadaqcRJ465jFfFWk4WpWOJS1qjqJh7PAgM/StWM+k6ljk55rzAQ8MmyUNMvuGwbNZjeH6833J4hOQnyFr0JgWSDRLNhzh78mwbJQXQsN2tJCut2Kg7k3oMsBKUQiMsdUVbAO0+y0AdYxCkyLQz3dNe251OQemV+4Z65tVWcp4xjVI31nDVsUUf3MNzkucNIEmC8XNeV3MSgkFOUE8RgwXh3OvQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nYd3Fod74sm9H2hmYFqjIet6bRJTDmA4A/B4aAJicxFNSRcXK5xlU8pSDkePFlR43Gb0I8bASdOX/tqk8ZmR6ZvgkRgtyHtA8ohu5eSdYTyDR4TQE8ETJc82m43TJf5nMnOsBB8Q7Cpnolo99GJv56WAaRtw4qDL4qV6/bvQod0s5mCguCI+eI1qV01PTdrHr/9fsQYjQ+8uUZdzfYfmULtajft4BL+0hjDpuc6gCtl4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jH7sQ/YpMsgNPEopwoie7tFyLE/VxbDa7F4mHRr8seokelYZfbPvNwZBIOtmpN2yI5v6PDfJueKniLmtgsKcIAq7vcf8/35FoZ37/8vAY0mr6Vog0iDLb0qnLX1yXBEMbF+r4t6b0w6Y6xUINNb8EXXne0pUHUoTg2928j3gVxgxGblnhjuIbEKBE18FZwwY5OAaDXcjFp1ksVN8OnG9Gltjuex4rdTZJg3OuZF0vo6Ulg4hbn3mRLcLQLwAGDvBgxAYZ4WfuaJlKIrFRjnBAJg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbepLBwrt7gDLSgbr/DEQJYWByWYjpKmpYxb+AO3n3A/qE</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gUCtSdlzf5Z1YxTFes9wrUSk8H/tqUEgffKXpTqbw0SZwHdu4cRAvoau7Zj/s2CPR7AqqwEkGLapiwrOjNSc0lTQf95q6hNh4v0QYtk7CHBf6SenSvprJU3W+cSKzrogm+LHdWMPbhEUknjXcdbElHUjbc7fPJqsw9yplepwgM9tAc6lz2UXRVaWdEl8LXgHHXm/xHoUOBCcANRJm26Sg4Opcj5DQkunGOvlhjW1BnRP59emcLk4rhcHDbwhUq725aSpGDaLbghcq+JhbZSi5gwf+GBLWjId+XlFlYsLVq57PhLS2cK9eDW/FgCaJyqSZ2IeMDCtpYumZQQ0NrBam5v</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>