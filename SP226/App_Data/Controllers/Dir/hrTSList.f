<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrcc" code="ma_cc" order="ma_cc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="công cụ, dụng cụ" e="Tool &#38; Supply"></title>
  <fields>
    <field name="ma_cc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã công cụ" e="TS Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cc" allowNulls="false">
      <header v="Tên công cụ" e="Description"></header>
    </field>
    <field name="ten_cc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_loai" clientDefault="Default" allowNulls="false">
      <header v="Loại công cụ" e="TS Type"></header>
      <items style="AutoComplete" controller="hrTSTypeList" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$hrloaicc.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_cc].Label, [ma_cc]"/>
      <item value="11000: [ten_cc].Label, [ten_cc]"/>
      <item value="11000: [ten_cc2].Label, [ten_cc2]"/>
      <item value="11001: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr5Z56GBoY0ZNbacAMfTAOvWeSLuzMpSn12NWy7Ne/YuTX1FYSN6/7mH6QXAfgO1y64=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzEp+Wwpz9WFbS9qn2vXwT2VOFYDv/TZQ96Y5H5ytMpmXTmVPKFaofPaCM66RavrLkv8dKtUU2f6JMVVZmo6eJE=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7eHB7Te6LlMvpL7TiBxG6M/X3d8BDPwNFd1lWrJJZd5QkF7rRoLMrlZXM1aIrdmAr+2p6aMtQlOMP+lsuu7fxGxImIng9ElMiNL0FcGDmhyNG0FDhYV1JQLIX5ZqMV8c3640OvxaoUVvPyuIiG/z5bjlHDy51ya+vw1tNgiGyvSBhHnMHVvfXZhk2AXwwj24PAs9PaJbCACSmMGq/VaHoSoZrPCO2klBDNuvjY0SGFayHyCvH6iE7ghOhl7iL6fdQx+bCA7+aekXc84wWt6TCXG9uUK2Gt+Vi0tbIM16RUjaRN1EZNJZZ0Q3Ozvqf3rmL8H7P0MKS8I9LFLgC0hlhzgkdUEnGt74gl6b1II0ceJ02gKPuX/dh4g6L9QDUyAMG66lgOXenGPXS72/yDw3K9uJJtXLGX8IVPZ6+M9hJSaOA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nUZ5WM+67Aa3uGfiRmFicij/1JrqvfpnhN8g8hRyO1UQtaRNnaHqtluZzznSI79/RBaiTfXZzdsvbQf2HlLZMmthKbXhCXeMm1FNkUDpXlL2AUlCQ5dgzV/8cQEhBxU/SnZxI92jLfkVh4ggdSj2grgm+31zhJzAcq0FHR0nBbWroRIKodArfOm81E+xV3JdlwRkPaoaEHWYXvllrKnrId+uBjSpaKfwg4JvLgQ1Z9xY=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jXV+ZGpqlBJ9B1j+VIraqrGZuP0Zzt8THbvPRPLViN4yQuf60dcUzhbt0iKeJwGwCQRZPj3ly+QwRInUs4qyWv1zd+Iy3YQ+GQ8fm+TWr6Q29LOh/XKI1gx0Ib9d5YVlDD7x7/a8u0/qWidQ2vONzLX0hybjvF4pJq+owN1e+6CvLXcV2uX/E02lltVpSrUDc39S2+1iyNgVw6lpoCYG6gHTnDv2uE31kbTfjnlBUBoWklZCB6AEOG+n4WxsObSZ7jp6wGWPd0ff//ZbWpyOU3JhGlNHcjdsxVQEpQiTEKfxmwJN2Vy6N0JZP+tt+gI5OgHOWmekWpKIpGrvJRkd4RQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberqDPRkbIQARNkL48Cqfy6YG6y6cAy3NKLGMst0/Yxih</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf78Kl0WlkYOBqplMATAGPvfVeZ9iqOTwsWTUvYh1FZtAvB+tZqVMc+LJcmg1RU06cDDNgf0KrpxJL9UaZYAG/bCw1KlZ2gwMHYjEKWrzT0wFZdVtmBAYviGlnbUYhfoVtiXZpruynIHCzlVoakrMJ5uktKhISiFHO1M7fasB4+ZsHw6J69ruOYQWC/zByt3bRw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JVUvnr5wpgvbG0XPkceoeoOEraQmDCcoko4mt10K8OR9bHxSEeJ/KmAKaXqorUjoJtFYDg4tbVpRc6QgFBm8aVyBFGugnm70LUqOYHyZf7bLa0IeaNCHtc2VE0v97tOlwNVTIRoDuKnyE5+eWwgqPNtz555SYZZLTY8lEy+AJPiL2DF6uFK2/W7ZjuvQnEdhhhK0gUWx+FSYVVyOptzWxjB559Wdth1thDYMr5OGwpfp2IEPKtisSWTBqauwww2u2qkb/8imiQO7nJJPO2XhtNIvx8aLps7tiJh3+uHY8+cGCUTM2yKQwlYel+Vn0P5Dvk=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>