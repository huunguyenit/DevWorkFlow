<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmbl" code="ma_bac" order="ma_bac" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bậc lương" e="Rank of Salary"></title>
  <fields>
    <field name="ma_bac" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bậc lương" e="Rank of Salary"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bac" allowNulls="false">
      <header v="Tên bậc lương" e="Description"></header>
    </field>
    <field name="ten_bac2">
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
      <item value="120, 30, 10, 60, 50, 280"/>
      <item value="1100: [ma_bac].Label, [ma_bac]"/>
      <item value="110000: [ten_bac].Label, [ten_bac]"/>
      <item value="110000: [ten_bac2].Label, [ten_bac2]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwchWmMmVZtvo5FYF0husBhHeBTeHDUypuFPDDK2K0tKJx/qhUaz8EiMM4UQG078o2Q=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbyYSLPrLy/pOn76ooLjoEonKM/nGNdC4G09uus5GwJUdvKUgSSvwtfKRz8oJ9OWAU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli5sORwP8XqxSUt7qYur0nMfSN2cuyce3QfM5o9shW5QVsszUU0FzdBr9qypjWmZyh959Cb4+sqhYCTrz7EhLDKyU5mGmRUpXOz3KBsxXTG+eNtc7EA+4NJkrIkd7J48OTbp+EJ0SKmgn9QXqL3pgN5+sX8AMY8mqbLLFVoT9aK6896UrDj7F66OVAAM8lyvl8ChluxjZXMAk5S3WT1rxneOPLqxlKHLqgnd4pdRgVqTnpVFt9N2lfP2P+kckqPHZhxfc7Dw82EiVFXx//SbPYcw+uSN5GhOIxxv/P3h+GhGESh96ArVoeoZllWrGmJ4o9KpgznoJSk/4Q3hkSpZTmnfq43+MNmZhwj8FXR+VJd0w=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n7lne9RFJSwAyf8KIDq4+3doJktvU5Qsph0joUYJfG40osxULjFk1w8e15yXEokEuSo7Z1xS3X0LroaaXOchURN92kJW5hQufob/57ApAv5iXw7zZ3IEsmnuHcB7BoY6xy6M/LBws5LcCeSbRwnl4Yv+mhqNYFMrafb4jbIa+z+KgtPxTYgTVWF1tgZtoCWk/O5vZg08v3ia6e06YN69W1MaCL+rax9EDVmhzodRY9tw=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j1bTMWIVgvXrlfLBVA5cmOJ7subQjHXwgA912pyrUtGbH6u36IjstELx8Pmgl8EasyJCSwpe3xNmBLcyV3mcQPw1dqAqIqKJ+tcL8uWECqXdWmECdpg7g8+wnQPwoUa/sdtzCTI/ZaiI4oF/RTp6KKZQajbW4VjINg1CUL38NANpDVx0wXM8oHwwf3rbHVNERlN85CCthSsnOBPIpJFWh6QowRv1jzLNvy80TjSRpGGYAoHduVONlPm6zoKBCalfa</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelJ/55nACw2PERxBcSXpGqek9HbUF36JPrsdgf7/8EiA</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbrnqi9LpTuyV+IUPi2zRZ1aVSb5Ffnx8rKz16C5Vy9Id1KlLQsG4CAzocddNaA+cnONQ3Ziquox6WCm2nLlrOWUGX4mdIZivjlHNYmDYucEtSF7Crr1jXkrMGg/+iXc0ZjZtR/yAWOc1IuimLQUW8M33JheUvT2qqnyy3dLoppaPgotzPNv/4tCDO1SfdgU45g8NfiwO1ICK4jXqbiV0fgI2JqS1pa9DIx7gqbbKaZpsk/Bhjy+pKppybMtOQe6NzNSL+lQUv09m/SP8letXvpjp67muPue/UhlxdR8Qg/onNn5xWOrJ8HIk+h5FFuhPF0898WfTiC0wz+ESqUiIHM</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>