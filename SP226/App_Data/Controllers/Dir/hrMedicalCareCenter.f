<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmkcb" code="ma_kcb" order="ma_kcb" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nơi đăng ký KCB" e="Medical Care Center"></title>
  <fields>
    <field name="ma_kcb" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đăng ký" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kcb" allowNulls="false">
      <header v="Tên đăng ký" e="Description"></header>
    </field>
    <field name="ten_kcb2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_tinh">
      <header v="Tỉnh thành" e="Province/City"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_tinh%l" key="status ='1'" check="1=1" information="ma_tinh$hrdmtinh.ten_tinh%l" new="Default"></items>
    </field>
    <field name="ten_tinh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="benh_vien" dataFormatString="@upperCaseFormat">
      <header v="Mã bệnh viện" e="Hospital Code"></header>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280"/>
      <item value="1100: [ma_kcb].Label, [ma_kcb]"/>
      <item value="110000: [ten_kcb].Label, [ten_kcb]"/>
      <item value="110000: [ten_kcb2].Label, [ten_kcb2]"/>
      <item value="110010: [ma_tinh].Label, [ma_tinh], [ten_tinh%l]"/>
      <item value="1100--: [benh_vien].Label, [benh_vien]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwejg18W/LcCNwG3UswAAHoDmFH1Cxii4hCEL/E3JQ0sP0lWC7UJDEc3J0KiGh7Z8OqY57dkTJ32spoM7trVdkJG</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYK/bQ/nWfsahza9PDlGF9J3Eq4oSHKMSGn8B/ydEa4UEm3vMsQP/I10EtGQbqykDAoWMQYWNHoWRhCeoj3vvvLK</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliLFvWlytcSHnEDdnoztwqRAonNw+Ded1KpOY1WwjBh8qqHgE9oO+kwbXYituhqTiOH0IolWE/5BOzVxC3TwDT/UgRbPlVkbK3N9c5PhZ0HDRZtHS05pFb/Oumzik9I56Cv4ivy74kqWUxOak/DHZdKc1n5ulDt9QnCLcm4qSlMOsY1JH7WCMfjzLafn8CV/CltsuJZdIJ8tb7VPbLAJbHUbUNnct/3SDnuMWiz3p7G2oAQrj8kvQoaoUazsPDhfJEmmpSQBf5tAntUKw2LeFIyjwfdyIoauW2NpdR3hJ9ITs+yX2KglqThD63NRQ4j6LBzzLwSvqhNCMxh8YWcodAVAzclV4Me666S1SAdHr8M3A=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n7ckQDTcKRp/xZ7Nyv9stk2IbUUcJ+3SgiZW+7ecuF2KYjMRB6Oq2/leb9gbNTyqohZEdVjQUalMMS8lBvpFghPgkRrRcEAnOBzdZSmCna9U/UDjvwPxjQuaBoGfwISKveZJKlZ+0XpswirzchCt5nUwlUSE4anhy5KzdE4j1C0YC2YYR+NjPqdFofOJB8pL/QiDq0zabwCewxWDSE/yr9e7yGJrNZqaionM4Hsu1faw=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHQzVAIhbOnU8rH0hfPkRixAo6nFUGe6L6DMA0cSLBQEbWVMNmWUTtDgsBZPEJbgISgzwHwy5/xlUJKOTcRuI/eT/8wdzrSrUzEXrCjU/mnU/WwPkIQO1rf5xNs3n0D4sTAQ4Bg0GaLV1nxPesveRqI382yrF99I0c9X6JQtXA/9gVReRVBa4eoF0XbxxNWAqHWiX/WBHIkfyaQ3fPocuc+jlUBYXBP1dWiqw26uPZCed8UpLGsTNBs1MtNoLoytH</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbergMEf2uQh8KUkTPZNhQSEaB5FIlC4+DPDKhf6KF50WR</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZuBaMcxcGSHvuIUuNlFTMmO6Fs+vg3UFSg6VNb2Te8ms+ORzCFjCKBijqi2Bcr3jF050kYb86QIRUkutC2FQqFNpPdlY/rZ0YSVjqYxMK46Qefhhh28BO6Lh9Syd0JIniKQ7u/nG5bPJaCqVo3IiZoXUSQrJe2O4nv5lOaNFfW+WC4BB3aeD8OywNNeSL2JM4s9guD7ek+RawKm/M/zElYC4fik1I6D9q8IRCQ3ShyS5aZ+CfjV5QbtIaz0SMvrJlVe/+u63/IsBcJCKzfulRjRPxEbaxX5+Bq91ZzVfr5CB5ZZK7xjwiafpGAxAKDrNVmbYqUNFjFCQuUDUNybXql</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>