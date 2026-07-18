<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultTable "gltcpt01th">
  <!ENTITY defaultForm "gltcpt01th">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="periodFrom" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodTo" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearTo" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111----: [periodTo].Description, [periodTo], [yearTo]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRWaPi/k0UKc31v6z1oVf+r6JkJX2vZ9KqqJ8kQU/cewq6F4+8PzO1XrTQ/yhZlg1C4hkHI+LNaKc2HtsF73/Rm+uLTWklw1luWT0KVGN9qckGAwHcz2Vf0IhG8AvNKGtaiZPQP/ZnLJTnUpi0jJezKjOv2fAOtTJ31VamkT5geSSf/C6cDlL25/moSSVL50/VFts+BZvbUxVwFbxWl7b2fw=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUSh7H+W23t9yJtcKtjQs8+Rrb6ZYk2PQfk9TLTi30gfjNNz9z3z9aDHvnhBdHzOny+RRwgILNl7TqzEHoPiCPgZCy88NlN1Q20y3gSJt9ZHT9OqvLLYFjULcbz/daSGkws2eDe74lvS5VjZBgQuBeu8C1qmC2qdbxIPLM3rkWgZHkfHXE9lm/QDTAQCrJox+kXQZ7Iu7kTJ5W4tkug/qUpjHeYLlRCmuNqQrUfxjbxK1</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6hi7T1ny4weJQnWNqodF/ayFWQQx1Fg5db956cQvTwfWXUnn0ENORnP+JxPflIDXgzXp21smX8vJ3G9cbq1KG766Pzuyo1+sq4m6+XcTVyxh27w4gvOaVBHNZq593Ee1w==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf0MictEdXToHQ0E4W8oewIarO8tkd+cnaf0VRBuyYP9huqJazsM+uN5fvoKmwuTaTyB56aD0/twsncgv3pNFDGOysAaQSlem/Ml1vdxXubU3Qi+kyj3ob5ZEsBaFxlrvJS1qNvzFmPt6nDYwf3JQcGazM5rIV9z40kfS/EnfKwcj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfzE0YS/dcaCKslpL5LNXSUXu2/jfBLyJnLiAaZQDUreA5WKp4LGGEboxmBVzVfB4iZhPqiKK40daXvm285+liEz/hwqgrC2zSeIV4acwNHE3uNhAKblzKc5H+T2LmDilRJ0NbAso98nDEA5u9z+jyifbbhRefTh8Xq68ytsL8ofAliZjdWJmbnY7XB9b8PzGwNxi5J71PmmUsyPiwM+Tws0vOADP2y4/TRhExFAJFOGg8kl7eZLC3yG/AhYsS8p90ovxmpQM01FLsSKt4+W4JycCQSpUHlhPJ71TytV/MQV5CCNwFBOjyj+hLAtbt6R1IfvK6wnV+tfzTEznaKvf5RafqIXAd80P03CGiiASxAPKsNYqfjvk0m3ks3a94DNktizlQebvt2xg6IPWKGKqKJHLcHWeTdlRpS3TiiHkazLVTMPOADVoFIdyjZbhPciCwDgdNbzboPHChI+B1j9pmIn8dQcW8IuVdHXXqIGm5/w81Vp5nf6QXUbGgGVZyzvvX5NVSwyejCnX5BgFMV5Ov9TI46Zto+edUuNlfi0HjmYPpPiXNfaSJ8pkog0sfY4fSFpmLfp4i+TR56uk2yEqZL0AFQBR+8noE//LEBNO675WrKi/jGkRN+VozJ+oePLUMLUAZT6THBxGC/McQKKZ7AZ3LMnbKCpyiI+YzLCAynlge0wEHOqob75uVdilMBKJq77gLAHy0zGL3ygUm1NN0hIpK8quZ3iU0D6VdeOGVy00MiMDZ1v5qWTE1RWEH4pt1R3g5vpkvxbfqB0AZBufbAy7xtgXiVjiMFZ+5IqMWGYw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>