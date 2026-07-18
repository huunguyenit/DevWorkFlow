<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmktdbh" code="ma_kieu" order="ma_kieu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kiểu thay đổi BHXH" e="SI Change Kind"></title>
  <fields>
    <field name="ma_kieu" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kiểu" e="Kind"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kieu" allowNulls="false">
      <header v="Tên kiểu" e="Description"></header>
    </field>
    <field name="ten_kieu2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2, 3" clientDefault="1" allowContain="true" align="right">
      <header v="Tính chất" e="Type"></header>
      <footer v="1 - Tăng, 2 - Giảm, 3 - Thay đổi" e="1 - Increase, 2 - Decrease, 3 - Change"></footer>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_in">
      <header v="Thứ tự khi in" e="Order When Print"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280, 0"/>
      <item value="1100: [ma_kieu].Label, [ma_kieu]"/>
      <item value="110000: [ten_kieu].Label, [ten_kieu]"/>
      <item value="110000: [ten_kieu2].Label, [ten_kieu2]"/>
      <item value="111000: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"></item>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="1100: [stt_in].Label, [stt_in]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwenprF1xNN09CnwzIOVXX1ugmCO0SYfeNDzxeQjHB0ad5P0w/FhW5RsgxfHVhpo0NR/DKy20nWhdCNgUyLVlGmy</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYlPUS0dX6uSimmBGY4f1B/bnC1sV6JdmAWDbm2BdilATOMMzwkciAvoHD1mmTZx80=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli+XQz9EstiGnFcfL+vPUq6OwkgZ1c+WbeM6/TymzG57pl0ZIKhWurJrkC56tztlybtFUzp6Gdn4NcGZfV+GTGJmz8JTE11sR77fISd+0PMWuFAV2a1IMif6GF/SQT73ZGn9gdjz0+jNyuOO4FAUzzTejW/77pIbXiVtymv29zWUa1wyAJDd55oA42awuFhD/4rlEfxaVDy3YZaUApe466bvpbXz9+wqn/YevmuotvnECyPhPT4yQjq0i+VlideW6qIQdtlP+/FEBslQQ+PJrmmXL6aDmwaKygg4o9UBI14Ev8W9WxUsl41tfKdBOUqJpR45ErDILaviSXgLoghWkSSVuExoDwLJwJtfwyHiPrNRg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nrVGupSDA+Yq3y0Crzv1Da+rspy9/+vzYf4lzu8XWmEdfV7aytyx+CEroEkVSccJa1QMUNVvNUBGtDDSfdaDufANs5HTAUbFPQwaWrWyYYnaN4eZzwFbqR33/KOPdlMkyTrP5u4EOUoPb9zpmF/Rq9fDJGX35+Vqu8Cn8Ys0xUR0feKYz3r8pH8u4Fcwzpvzhyq2jm+E8q6X3SJYAvjZBSL3dNKib/nZSu9tykulA+tM=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jneI4m4Ieb7bRICtopzRo/KRV238eduejhgFPcigqDRgK1NTJVHz3He+SJek4xgPQIHeBAQm5V4PaD6aQr0Z6xZmFfH6tN9h57zDlRUK3QKWubbDi0UDB4HgU9AVn00Y0k4FC8LHCAmx+2KfCCBDPsNhuVQm0561+kh1w7XK8uv8da4wiy62qalqIwttXyW+CGeYQBQqI8kuTaMgoj0ZRMml3o3x/K51gGBsUb6NIkj3xdy99Yz5db+hN6mVEMKbn</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbencOOarsCdRC8DPuNKri1CPWEibG3KrZkxTgPIu+es0U</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYK8qV2PNpruSBC1Y6orYW5ZgW6f2tzqaKg/vPlrn/25Bm5Ej6C7HQpQt69ezU0PWeYrLjMHjhjjF9pRa2iomrKcoyMmsxnUMAVa/aU8HxQEo3EO+oAYcq5q9X3WI5c2PnOVgk1+IUqsaUHplppu4iL0XW2vz8nkzPOnc29aKOmj61l/2Ts3HDUOIx25ol8qm98OoI+KUuviL0WfE3AK7NhFeMsBuHZT+K8bIMe4VWCeyDNdW68fgS99JZN/SVz1wS+hEhwEYjzDE5Xmp85POrO/Zk6FlaahMQiNtijqwEPY4C8nwtPJIdFqv0RYnl6WZdy9Towc7IepIEB0/3qveTR</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>