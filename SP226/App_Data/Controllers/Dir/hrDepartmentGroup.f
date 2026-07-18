<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnhbp" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm bộ phận" e="Department Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type: 1, 2 or 3"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
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
      <item value="120, 30, 10, 60, 330"/>
      <item value="11100: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="1100: [ma_nh].Label, [ma_nh]"/>
      <item value="11000: [ten_nh].Label, [ten_nh]"/>
      <item value="11000: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcAnHt4v+VBGzW6u+FI39TcrE+X1JAE5pvTSwI8ZJxRVOUxvDFwN+KD6cU7vrR0YU8N+m2qlrBaDP5IpKKp/lOv</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYayvkZKl6Eka4DgS0ejcWVUDNxDhsdvIXHzzVhKo1jFQn8pB9+L/q259qJBNu9OhO6AJDU69Dsv95HRDrf+Vime</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh4VMLv3SAmz5M2T/styTHyVpCMPzhgxtxPWU7CbosEk3ei3eHQDmwaCKszqQenOIR+0XddNPA8FoAmE8xLUOfRm2FbYAVEQ2qYDQpiH/BKEhGOU4HHQtVfMVKK+Z+igcNbTdI2RA9BLVoz6LFGWrgXxAhliJgFVVCWXWEAiP876JpbXGs/9jtbJ+WMqFdLEF0nQio3kWRpUsOBHggA6OVm5L7j2m47dyBMFwgDbf2xo+FX050afRe5DcvdJebDg82R9w5bSvdNcy0Tw8LmQagjHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82naZcogpCeajCtEhgkNU3pq3pzFxVd3rZUs80tXohCT3xb9xkoR1ANYQ5qEgOKBxWcAP7D3mrVik8XpOWat8+nMZmhlaBlMdqQ32gaYgnwpj7xBvQ9+FNu62XNtX24e0LnwLdrTB50tMGqZUi9RRkxEqcPwfKsEH4gb8XHg4BxL/hpLLH1QCVqdbfo1yRWkWlzyx2V7RnZUdJbLLrx3VFGA0wS/LZmkt5uRy+/FxxqFETLybGUg2h9/EpBltgj5rih</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jYVHtnfab9pOCUbSkAnVHEvsWHmqRhGNaf8MosDxAH4G/9bkbxplxzZPC5Ccge9Lqr999RsEUDvkEqoDqdI24rebkW8sf2Az/qkd+CyLypOyYQfQe6f7WFwogWZ2dABE+NWP8dHpONhdY2/TZzsdbjnsMUXyHucuSfGE/v74fj5zTa9flNaQFYnYhZEn/WiXHjzHbY+b+7vXqyGA7ZCyiyjOdqj4iRcfZS/0eeMe22m8WkDz4kz3cvvyCxPupH6uOXYseaxHlqgcDH3ZF4N1DK4I4iSd4UHyWn1dBuB6zuHKkJMvoin8NXm5Qayw0MRZO</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehRCaqK7mRRSejil883DxjntSP1IFG0A7PU3T7C/6L5/Zb7/zagAyL76MHlhRZUzlQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYuZWAKPS9AmZ1mbQwgu9i/1/QSPlP1B5c1JNMb0R+1g1dPg+beqkoiHK0xz77WadahMwzVXWqyUDf5B/5g1olxyaGJ738bUvOMoCLA4CyC6Vr4jp59+d3R/5yspVQjMRMwIXbxm8iDePXOw1nLbgCtF4uISxc2stn5wGTbDLjCSWq0T6Id2fnLCsqLhTiBvhvFv9aK3ME4kaA0qUBeZAx+Q3jAyMvLOOt+PHw/oQJU1LOmOLN5GH1sJFxwxSN6tCp2g7KL0fWxVFrD283RT35NxyST/hRayxiVl2ssHi9uUCymeV6Jaz1YzLsO5SUirJra8qnAsFoJdBcSLfw4Lzvx</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>