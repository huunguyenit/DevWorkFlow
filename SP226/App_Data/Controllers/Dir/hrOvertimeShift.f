<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrtangca" code="ma_tang_ca" order="ma_tang_ca" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo tăng ca" e="Shift"></title>
  <fields>
    <field name="ma_tang_ca" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tăng ca" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai" allowNulls="false">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ma_ca" allowNulls="false" onDemand="true">
      <header v="Mã ca" e="Shift"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="tinh_chat = '2' and status = '1'" check="tinh_chat = '2'" information="ma_ca$hrdmca.ten_ca%l"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="Tên ca" e="Description"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330"/>
      <item value="1100-: [ma_tang_ca].Label, [ma_tang_ca]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
      <item value="11001: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfmEkTep6OOw6QCh+UhIMMqoDTmiWUZ53y1h25E2JmnZP2EhMEOsPtWdluVayoTReA=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0XJssK5ClaqdrinLDeEE2LQn5huKSZ/3tUiz/8gj+DiI/c0/4vgbsJBQ7YypzB0mUCyvgfntQNeEv2Py/F2DIM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI7lMPQHdMINJSk1a+Yh4TGBCL7MkIH1urWs9dVvTPkeV/pyo15MybS27YYbXeY6ZFP9BOaN9DnE84Vi7YX7JAJnUj2+JlRZxqn7WDm/pB+7bua/EN38B6tBCU1KJpAmcGfg2f5leOlCxup/PIamYSGD5IgwlyI17j9DXfl2bkr7cZQ5611Np9enML5RQF17+VFSPywDkdRjabbTdCQvLQ8zUrtyl1PSsW+Vz4vBJ6EdxJgE7Yx0QilSrnDIQIxBK4HHwkWXHQDHWijAQ2vC9kRuCy0jBlUgKk5/woyE/yi/ATnQ0HBj0uXSh5dERK/vpaHUlobNmHipWKlJeb52TZLjFoefPVrLQXJPtASCyCbqU54kLmynShMWR68Pu7nLC9rWGasV9lkrEAu8DtLDKSEhiKNdRqsYuR9SAAKIo7jHgA38X/1SikYrzHHb7wG2kSto+FYEt+KHNXFmE62taFBfAKV+tme76/kjWWYK7zeYx</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nkVfKJRg8qoy1HueKbfJuBMvLGAASGIfqlBGlqm7DGzKv4uCJHdEcC+aD7uYi15yDkVhfuXphAR3S1HHhhoB4GyMLvekpKaqRXmQ2/dpAt03V4z+QWLpgK4vOWIhC6ZB54xrK3Z9QjCY5hhY2fM7kMuIs/PY5x5Es4HOcBvJK2RIszY4HrUKG/owQkyCvAd8OkMDXzWwDxW3H6pksJ/yyeqkCpdomBXHo3bM/t636SxE=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jUyso4HCypN97d8JpURqXeE7GD5DCt5F7r0imp/n+pI8cP8quMhlEKeRmrLrvyYs3T349+0KhOiQ57seuvdULRM1qJUOXMErA3V+kk37vQEqMijxTm2OfO1psjJIEn7Ac7GWZ+MdvzTjyn2L69MuZLEgSNUQEPn4rgyif5NqHz272e64xke7hl6QCI4Qwa1zetLwfIzk15zydll+OeE5UW0Rgj8YuifBUCAb6X0PjrcguzGKveKhGqkY/irB/foGIdEyP8sm/ser7vIjEVk9AE/A3berFen2W43Ij3kuNozxOUzFDZ/lTmbsGVyApJlBr</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkber0lZGHkwHJH3v9YVxhjmvy5Z7KgHw2uUG7+bTnrJ9YaT6KeEQPR381z64BCRdyhjA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IvL6RRnOAv24HWNymNCitpkXmtVLcs6HBhnOQ5R7Ig7apHXlMpj16yNg7QSLPGf4jSEbs0ZEIzo/8NSVeSQ/rJkTDrUg/wE0GtUNQhj3fPOzZJ8i7mPF2TAlal+nh/WRQCGRpv8NONxgLvwLbXenAwWGzfpr1Zk2olzHUmJNwO+Ig==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZF6jYDHq2Zrt/gJ1gEueNMmye+0ady2xnWFFzbmjbWfABNUdscfCNy7zI+WE67A1yBnMlNjvLoTxdPnAzfh/PErahJmBgPZm/QVIHb/Xjd9dqmgbBht6/JKfuRayGsjoX1kstC9KH1WLgDQ6TOIPFPgmPseY2meHYN+j5t43exNl0P83B8Z7DYLhufueqljKEzgkGgkFPGIpw96DsW/YoSBzGvf/FGlaOp7bjJYcQoDNbgacl6cdQU5pPeIFv8StzoHvtBWIudAJtq1VphTXoej7exVbemq308E39bntpUrnlxDc2U6kWfPMO/R7NVLx0=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>