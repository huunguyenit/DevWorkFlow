<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmdvdt" code="ma_dvdt" order="ma_dvdt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn vị đào tạo" e="Training Provider"></title>
  <fields>
    <field name="ma_dvdt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đơn vị" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dvdt" allowNulls="false">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
    <field name="ten_dvdt2">
      <header v="Tên khác" e="Other Name"></header>
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
      <item value="110: [ma_dvdt].Label, [ma_dvdt]"/>
      <item value="110000: [ten_dvdt].Label, [ten_dvdt]"/>
      <item value="110000: [ten_dvdt2].Label, [ten_dvdt2]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr7VFTK0nCzkJLaHVTEYibCHYIKhiAKHGkFi5Yya8Ej2qDY33JjWJIh5lTWdojmCkWg=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxo9sadXlwFLP/JrHDWSfC5NszXpvV1Op4q0Zmdpmoahe5atkmuhFJ2b2JLgd6px70sEI4hYIY5smNZQVkupjIY=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliaaZ7lP5GMsQAn9UOKTX6jNSmz2Lsx21XGBzffwjp73qpdES1X0dGdDa3XumMpod28twivihM7TfQVHSKT9ZNB1Fs8+pmjKgmYu4VWDiB7ja6c1l0hnoO5CjTErEMOKrSn/pz2E+4f2qM0kNMZl28AYCTEa5g6Gr//W9Fj7Y8M2/PKSwMM0HPxPMykvvnOMkSymLFrIgiukJFGCKcC/KVeYbnVrEdkSZR3Gy+TPTEhy4WE8lzpfzIMty4H0ofZA82/QE5sE+OMczOpiY7DyqJRV2eKPCbJN9i9DDBV5KbfQ6jhLEgSSdIm845WtQIUAMLdo5r3gWZiiaqR0ux4d901A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n5y293PHu4VSjLYoITs3vvQfFWzSZmxRqPkSufxuwueeyZzGa7XMMUMe5ZfnhjKzVLNDwLjybJsBZvHlPcyHdWakWDQ/wTh10uWWDjVN/X30c8eARRAZjiED/wBsx+MmDpQyTU7VoHW+wteV5o2KcsSZOVn3tM4Ae70cJIuPDdLF+lIC6sqIs7xQK0sltQMN8ynkcua8kS9PCHIwsn3gLaRQ40JVwMxTyxLruFggC0og=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jUJmiEY6wUsVg72yIX3FEqoAg9zzUAKv/xHHoTgqaX8XBBlEDqGumqf5KBvYwzXvRTUHCeuWEZ7VT/xQl22BgzvuhuMbNOq47KVWZRlDZ4Pne0xIBh6u8Z8sFOGZX1XB9z1SFgCcRDddwUBiw+Lb3tCRIYhi/SjZGZ8ExLfCZt8bOWRBLmx0RnfXTj44WeZWOEDGTkEU85zkSebjineieFJJ6y6kLPAIMFWH8eHWlA/2ChnCvjRoEP7fLULRn2htH5WZ9riIZ5Yap5eKbHs3hng==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelp5oh4+4JvM24YrIUkZqadIUsuBqYd3NCJcOgQ8cu3U</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JWlW6p+51seyiaGR22uVRpJ+5CLlz73rx3hkf/lezRY99xM3RrjsF/bGA1QpoTThjqYI0Jo+i+PqD+Xh3O9WZYcKJ+jELaGSc7J6B8V6kJiFw/7/v0rUQj1v5zh5CM1Qv1UKePLhzU/a2nZNToEws/RAG2AvJ7upCip+T0JjfYoFrAt291LEh5RtJhcNKsk4jSCFXsrn94LZqaFHgbzE/EfKf4eHC2gE/Z3nXi11FdPFmdPbj1Rjgg8oF/NDaqOi4tYwk+zKffzGxtJfls/QFMa+Qu5fbFpDSaBAUv4qxYXtX08M+B3RV08C6qdqtw4S2xkNaGiEO5TKti0b74IAvYr</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>