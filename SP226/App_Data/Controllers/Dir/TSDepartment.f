<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmbpcc" code="ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin bộ phận sử dụng công cụ" e="Tool &#38; Supply Using Department"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bộ phận" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bp" allowNulls="false">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_bp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp0" dataFormatString="@upperCaseFormat">
      <header v="Mã bộ phận phí" e="Expense Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp0%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" defaultValue="''" external="true">
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
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_bp].Label, [ma_bp]"/>
      <item value="1100: [ten_bp].Label, [ten_bp]"/>
      <item value="1100: [ten_bp2].Label, [ten_bp2]"/>
      <item value="1101: [ma_bp0].Label, [ma_bp0],[ten_bp0%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwd9Lgzi+RlNYjPawxZ5Xmtex4ffKehMf95DZS/WLSBTS7ngav51Uyy9Itdxtx946xU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYagD4uMShypoVKHlRYAFcfRy2W+DXSwwUAyvnciZK5GkIvmuj3f6pOjNBKeYQVcwNs=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7f3Ww8iIiKLVQ2r5jTKX3iSaVLr7q8AFx/jGK2pGjCz4xaa9yyMriwSlZtDLjAmPXusEALFSe2S+9w6CjoqzH2bsxmgVfrsShhvxT+SqmEcHHjYKLEpA15qhUtxkpdiw4H2fN/6wZFcGeGAYIhwsc62DbVwvVbcN0S92YsxC0ZBvWNE4+iaWZiWPJibdzPSiBfagFi3AhsuqXq0TAIWU+I1OQ3XjdEQwgkqMQ7zHlBKcCVrZoZAYA/uHxRIalGK3mU7C16jir532kh7ZqcVy1S7xvjRlAuh1+1/kRoo5tmlL41h3/XKPkpXSiRswLZpS5nrG1HjZ0n6G0OERWS76pCyZie39VxUqD8JkcbM6zl+e7blAL+zTB2NDpDy+vEULlmu9YJDIxKFYlxrb16KC8kS/7Uh0ukf5TFL9qD7wVBhwhK3Acs/w3Dram8Bwbt0BkzO2WWc8Zrd/cJPWezzVM2s</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nfXhuiGxtx5ilNScGK8aDj/gaPT6XsQe3KalGvQju+Gxth1P518u9ujlfZpxf0mBSEd1CEgJfSCt9ISCms7G/mLM1wfNnRpcCpU2v752jL/ljjy7HFZI22D7RyxHu6Ln7h7GSZ0eRc+l7/YDl1LDH6lgVloNYXtLH5X8VYXv2PVv9/9TEMgpLv6AscSMxuzmftM6nJAm9XjThBdamg893Ll+f2LM8di4R4sXKxlPDx5Y=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSfcZd21UrWxtcnnihK+i6/6/pPKpRlRf4qRpU2BI2bFOMlMPyWUbPI6nGPeIW45Fozk7khp2BNqJ1DYVTX+D0l6p8Q4GYzhPEPcRm9lj6etYZGxEYrLnuzp7z8srrsv61rkh9gx+O4u1MUzAHg3GsZJ61cZcWPzRo41fatP6/pjlDG35qulTF+27IV4fREJgcPLe1Q9TdCvuZWAOeFJSojcdiozNCcsw7ydv7WtpKdnabr+wES0+goea+3hYgtyN7w==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbejRN51d98vJNgrmale/BmbKJhKVuFVjZuUVxtvZAdwNA</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbLcYNtLAtTD2dbwa/SR3mAppadEte4U7EE7xfSnzervzEZSm3uH3lqrklWzYbHbufH9XEOmTeEaf0J9Kb2ZQCOq+U+oW1v7l8IsieFGdfiwpjI7yTIkoyjAj4ieONBeO901FNhXb49Poq1AFfwKMjUbF0KkgMf/kLoz/88EO47GVWI9fO1frNDon03JnGU8k4tv3wk19SKcEa2XlPYhOHc1SdqNvVcph1wgNCwbkpsyqtHQMA/f1qHQYz0x5ysWLvgdnT/6D0gn0d+asyQamb56xEq4lQYXJb4D+AfASS6X4majH6oERGxAi/IQTIAoBONItT0WUnRB6g9f1TbUyd7</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>