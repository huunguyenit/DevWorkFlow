<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtt" code="ma_tt" order="ma_tt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thanh toán" e="Payment Term"></title>
  <fields>
    <field name="ma_tt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tt" allowNulls="false">
      <header v="Tên thanh toán" e="Description"></header>
    </field>
    <field name="ten_tt2">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Tên khác&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Other Name&lt;/span&gt;"></header>
    </field>
    <field name="ten_ngan">
      <header v="Hình thức thanh toán" e="Payment Method"></header>
    </field>
    <field name="ten_ngan2">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Tên khác&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Other Name&lt;/span&gt;"></header>
    </field>
    <field name="han_tt" type="Decimal" dataFormatString="####0" clientDefault="0">
      <header v="Hạn thanh toán" e="Payment Day(s)"></header>
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
      <item value="120, 30, 20, 50, 50, 280"/>
      <item value="1100: [ma_tt].Label, [ma_tt]"/>
      <item value="110000: [ten_tt].Label, [ten_tt]"/>
      <item value="110000: [ten_tt2].Label, [ten_tt2]"/>
      <item value="11000: [ten_ngan].Label, [ten_ngan]"/>
      <item value="11000: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="110: [han_tt].Label, [han_tt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwe/68//3RKZXMXrgM4Zxdyz0DvX5tGBKEDEw1yV7vVHNgqB7JohXA3KOEI/SneLwK0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaQDQjNOKYId8+jHzLZm5A3YdKaiUeM1s9OHqnz6HTsAqJpaFkO2JQQBSd4rUO+Fp0=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26Qcmk44mnGd6DIoYZsFQUTYAQhhmWkWIJz8idUvsU8gm51q/ADUw5azpSVSLZgo3UBstK6PfcOKz5oxbG6WUn12iXzSt+MFXNSxUjg55V8GO1d3AssJt2HxR/sULyy1nbY47tC8pr7KIaZCWJoWUhAaGbcFLMKwDZpSvmsPQ+iTiFhRFmTIDdLbrQgg1ojj0oJnb66OFX4GRk0HuVz9QzKnPDEK/VL270ZMsyFmNt2fThhXZLdExeG4NweLd0E4YKEmSBkkMM+mSD30VfzqqKJpd4uSq+ge+XNJXaq0hHwOwND1c9KjphyiNBWZZxZMktvv11f2JdU28z21C9eVOYGke9s3aTrMM5h7ZVwOa24Tb7e</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nDyl4A5JHIh3nJgop6pUWPbmGHkttABoSGYhDghb1t/FIQiiOQYrIjaWYqz6dpUZp0riW5wCMDuv5mZSh5pn+syxsxpsR5Ix/TCjMgKA/mJ5cOA7xX3DI6z8zkA5MhWt829bDiyqKXeP+f5gMI3y/K54imI+5qlf58XybhVpd7Xo/mwFX+zMhZVz5QSFj9EKfTLLvmpAesRPM++yqbHv4nEtTodLaxaqhnOlKi+RcVrI=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jQM9qS97fjejHbcEUelPgPTnfyomsS+OsjHO7wFosIF5T0qUNE8BlUHpwXgfu2U3HpL+rvHDgUmXiR0SisoB/k7p7oTbUeY8Pr/SWyOE7ly5mYGeCw4a7R8Ik8GpWv7UAXbGi2VHJiPPcfvAJpAvUTJS/lwnmUQumIJjodHfajCZ3AA2705MqCyn6CxFq0m1ZG6LjiY66CEQAZ3T8sJYWVluGiO+tRwVBY6woirIvRg6zslDugutJwR4Ltfs8BR9ORBwZ2zFmkAAJjTLmh8VlXQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbenyZLiaN/koN0JqTN4HzTH61yHiLzsqdrgMZawkbP1A9</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYlmDnY8c6c2C4wnn4pYz0Vnvl5fNNjrgqSxAq+8l9o2QvqN/puVfMmc6gG99/z2Pa3+RLsS+rCwdofkTyLv/vbOkvnCE0s3OYZTjDMViA3FuFKaSmN2bIydpJ74aJ/fEb95jVeh7LUxIVyObN88q/ylZIU1Mlm3J3BC7qSL3YRloKyQuKbpGiLT+YmGqwaYGgR2YUwA+2PlKGO5rqdBwk2HCUBmstSLtWEIThMjWq5dU532dUw2bTo+k5eUy/Xc5qU6QqS44dmZbh6f+ZbRzVHy9qcQG/j1Tfb30kxbgjHljwJzOGm3LwRn2Pr62A14oruyHsJXx1vWcVbwd1Cbyc6</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Y+QCYmxQhPKYKNNKSzCvyQeXz3xnN/rWLgK/sNI8qfYfEsNWuvPUwOnrvQkxVuKwg==</encrypted>]]>
    </text>
  </css>
</dir>