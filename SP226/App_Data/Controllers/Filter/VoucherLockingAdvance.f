<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="dmctks2" code="user_id, ma_ct" order="user_id, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khóa số liệu cho nhiều người sử dụng" e="Advanced Locking"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Chứng từ" e="Voucher"></header>
      <items style="Lookup" controller="Voucher" key="wedition &lt;&gt; '9' and voucher_yn = 1 and status = '1'" check="wedition &lt;&gt; '9' and voucher_yn = 1" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ngay_ks" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày khóa sổ" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 200, 130"/>
      <item value="110: [ma_ct].Label, [ma_ct]"/>
      <item value="11: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzPDwpGoKhP/i6k8dbTNFV28gFaNKfLZXN9zKRv4m26u6ch0wb/CyFzsHvwuXjtoiS+higGoAl41R7JBYnjh3Ec=</encrypted>]]>
      </text>
    </command>
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbSgisHTu1oqYYLBD7P5VKV/qlUK7jmE3wBiWTrDViOuNh177uwGoQZbRdXoKbckLqtpqec8PRBmZExctwGNseFfFB+ZmeQTi1vXT3A0k9PjOfTOslxbQtMz1eNJat4d0vG38ZVKo1daWPYZJSKcVf14/6+7m+r0cMfH9BZdvaP4QPcnWwQick7Y3R9l7Wo7LYRbF4UPv3j3HdaUyUZBJUAoZegljISBiLlkh6l/fmjH8Vt3Jn0C5vBWEqubrmX8g1WWE1O1txaVR7ME7DsZ/5o3vLIocVeOC+amxSipcR2mTIaRWxksQDanRFDZ2Q1vGr25dhn/tQLBLvnfSI3MVM/Q5HgE7hye16Czf0FkYISekKiWW6sBunreo5Os/iTh13Me0gEotyoAEyd7yvIj5dVATzd5neA/UpfJDG2nGGCfwiIiBOXh+hr/fF5WOGkEqrfO4qDD1QY++QIXELrp8w2jdOQ/OH358xECAfU6Y8C08qtss0AetAnVrpcU8DI1nH4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JVAU7kSPYn/O4W9vtyXO72em3sG3zLgZPutWjR+Z2T93RMI3/Qr5UbRz+iXtTZabgKHWnRAympifGZ6pG3ryKU09rghUPRqvfFv2gyl9FcEsOn3IXwivCJnrJcLlyAMOg==</encrypted>]]>
      &OutlineEntry;
    </text>
  </script>
</dir>