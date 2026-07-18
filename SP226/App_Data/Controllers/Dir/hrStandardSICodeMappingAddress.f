<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY k0 "@ma_tc = $ma_tc.OldValue and @f_ma_tinh = $f_ma_tinh.OldValue and @f_ma_quan = $f_ma_quan.OldValue and @f_ma_phuong = $f_ma_phuong.OldValue">
  <!ENTITY k1 "ma_tc = @ma_tc and f_ma_tinh = @f_ma_tinh and f_ma_quan = @f_ma_quan and f_ma_phuong = @f_ma_phuong">
  <!ENTITY k2 "ma_tc = $ma_tc.OldValue and f_ma_tinh = $f_ma_tinh.OldValue and f_ma_quan = $f_ma_quan.OldValue and f_ma_phuong = $f_ma_phuong.OldValue">
]>

<dir table="hrmapbhdd" code="ma_tc, f_ma_tinh, f_ma_quan, f_ma_phuong" order="ma_tc, f_ma_tinh, f_ma_quan, f_ma_phuong" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo tham chiếu BHXH theo địa chỉ" e="Standard SI Address Code Mapping"></title>

  <fields>
    <field name="ma_tc" isPrimaryKey="true" allowNulls="false">
      <header v="Tham chiếu" e="Mapping Code"></header>
      <items style="AutoComplete" controller="hrStandardSICodeMapping" reference="ten_tc%l" information="ma_tc$hrmapbh.ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="f_ma_tinh" isPrimaryKey="true" allowNulls="false">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_tinh%l" key="status ='1'" check="1=1" information="ma_tinh$hrdmtinh.ten_tinh%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZf5gVWcuSQxUdnn35BZAIPead1VlEJIqxmFRLUOS5xrIgn9Hj9zmMZaFm0xTYm8oyg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tinh%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="f_ma_quan" isPrimaryKey="true" allowNulls="false">
      <header v="Mã quận/huyện" e="District"></header>
      <items style="AutoComplete" controller="hrDistrict" reference="ten_quan%l" key="ma_tinh = '{$%c[f_ma_tinh]}' and status = '1'" check="ma_tinh = '{$%c[f_ma_tinh]}'" information="ma_quan$hrdmquan.ten_quan%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZf5gVWcuSQxUdnn35BZAIPe9/fOjl8Nfzv/ifOXiJ91/C4hmriW6XzKniICU4Ycl0A==</encrypted>]]></clientScript>
    </field>
    <field name="ten_quan%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="f_ma_phuong" isPrimaryKey="true" allowNulls="false">
      <header v="Mã xã/phường" e="Ward/Commune"></header>
      <items style="AutoComplete" controller="hrWardCommune" reference="ten_phuong%l" key="ma_tinh = '{$%c[f_ma_tinh]}' and ma_quan = '{$%c[f_ma_quan]}' and status ='1'" check="ma_tinh = '{$%c[f_ma_tinh]}' and ma_quan = '{$%c[f_ma_quan]}'" information="ma_phuong$hrdmphuong.ten_phuong%l"/>
    </field>
    <field name="ten_phuong%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tc_ma_tinh" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Tỉnh/thành (BHXH)" e="Province/City (SI)"></header>
      <items style="Mask"/>
    </field>
    <field name="tc_ma_quan" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Quận/huyện (BHXH)" e="District (SI)"></header>
      <items style="Mask"/>
    </field>
    <field name="tc_ma_phuong" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Xã/phường (BHXH)" e="Ward/Commune (SI)"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="1101: [f_ma_tinh].Label, [f_ma_tinh], [ten_tinh%l]"/>
      <item value="1101: [f_ma_quan].Label, [f_ma_quan], [ten_quan%l]"/>
      <item value="1101: [f_ma_phuong].Label, [f_ma_phuong], [ten_phuong%l]"/>
      <item value="110: [tc_ma_tinh].Label, [tc_ma_tinh]"/>
      <item value="110: [tc_ma_quan].Label, [tc_ma_quan]"/>
      <item value="110: [tc_ma_phuong].Label, [tc_ma_phuong]"/>
    </view>
  </views>

  <commands>
    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZP8F7DUj1ODBkGD8clM51QsY0bFefvUsRuO7S84lIaBRvqUhjrZa1H2P06Pwo+NuA0rm4jJM4qu3I5DiYbmfogoGBE4AKK+/Z9JE9oP+T+xlIJo6OCNSM7hAagTHKSu5HeeP/tn31rlq0NOYKClBdn3egjKSOxWTPosW5sM5zAaV7ouujus24RF/8g9ZnSy/S4XrVNOdvnT+qPlU8yidcS+hZX2bVtZmH0Z57AfyBRJ</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRptsr13iekuFddlJY0mM2fK+oF3iRl1qC+7kUXOWfRbMJJ3FfD2ehqzYE9ZPEHqtSTPKGGFU3g2a4KJnW66zNlFOEVbZpgZPyKhciPVpaQcX3zzJThkFfeLPyoCfG247yOLC8Xi6bkxw7UYI9VYtAUk1Dm/xLF2tZEJmdY3x9ZFkYzrLN7yLl8cS0cIStRgwN1e/zQ3tnG5bDUQCK99uXXgDpmgDC7J8ZMMmRD68pPwTIKbDZTo2s1IoX72NKiK8bp9vSTjp1zFLkFtWnP7ZxfMEBDmptBuZ94xbzH2ACHnNEWN07FbZsZfVYI8o77FwXQhLk8QE/+MVGNQ/mJIBHuPmXOdiPXL1ihD303VkUKRQUFyjH/dtpOsNgvkv9IaeFUDsjgqUOFeP7W1ylwoB8jPsfAsTSOqFNzbu+jJtvD6A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmiUwkYQU+0jEk+0Whciwyy83m6Uj4TMS+eiuhxY0/o7Y3m8bRR9N4jEmDU52pbKGOgufXd5MCEp9ZdhRKouzawF0FoohsMnJy+PVySnWuYk8wmu+m8vkQMw7iun8EVVfycBpkZjUARzscI5kKpbDHCNqwT/+Bz5QGFCXrOpOrrGvlwpfK2v45eHdauJNSgqp83WAIR1N6EydDu/U0bikTj0</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfytvb6M6LF9clAvewQP2kjB9e5/rHiaMFB5+yaZ2vC0D</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8YMEMfGMqILN4uGB4D57RGLyMUYb7Z4Kp2SjILZQ6MhDN88dTYA369ZLxC76ZweJ2IGjDORLHkEjBco0Nm8sF+9/X+OKSj+mVUv/BFs0v8W75ZdqjEwDDIcdFQa1+cfHu2UQjl8Z8EhMT1XOQ5UDQRpEDBoFFLGkyma0xPg/9aN+g==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoQEbc42PYOK9U+zvKIILLkTLj8NwvIxjqL7wTtR1o7KJYeEEnBj/hg4nuPWbu4NCao90vBCSPkVcwUVThXrAOk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZm1I5LsWmFeB+bHQlwHmLW6F+gHiZ//wejdqRXBdh3GNaWkKzpZOLQf2WZEJn3dQHIFxbLAFk6/6V0WD5M1/CNcAUyHYgYTGBhR/b/VO/mvRuDzwvNHLrOsX2z2/ZA6Bx8I48yeS8GgKJBaD4Jc5lX94R/DlGMn5pQwyQjVr3WXWH0zWhwHB6RLQgMHPDErZ31jYttn5DkxedPi7dj2pwcWGmfoKXa9B57B6QN2B/lpAgD6IHvj3CSLD/lFWV2DBLK1XqeJqK0AHB2B9/CZNsKDvlu/K+Lb26Yg9fbHTHgOfPdqUY1VCWXbywtb4J/8tBN2qbvU73xjtkF14UqPJEqhNrehLk40Y23PrZSTCx1q8CMjGBPUFgo1ZEwWG49+Xq4yiyEZhs8xtn1PUV66K0MwpD86z/c39ZFWdFb/+qTjaQ==</encrypted>]]>
    </text>
  </script>

</dir>