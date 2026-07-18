<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultTable "gltcpt11th">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="periodFrom" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodTo" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearTo" type="Decimal" dataFormatString="###0" allowNulls="false">
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
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRWaPi/k0UKc31v6z1oVf+r6JkJX2vZ9KqqJ8kQU/cewq6F4+8PzO1XrTQ/yhZlg1C4hkHI+LNaKc2HtsF73/Rm+uLTWklw1luWT0KVGN9qckGAwHcz2Vf0IhG8AvNKGtaq4sITPL1GuOfme6WjCjf0JFAMXSyJJpKvKLwm7RqzOtwmONB1YmswKq9uecytohq5NQ5G2IZv3aYvlXoWYIUE0=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUSh7H+W23t9yJtcKtjQs8+Rrb6ZYk2PQfk9TLTi30gfjNNz9z3z9aDHvnhBdHzOny+RRwgILNl7TqzEHoPiCPgZCy88NlN1Q20y3gSJt9ZHT9OqvLLYFjULcbz/daSGkws2eDe74lvS5VjZBgQuBeu8C1qmC2qdbxIPLM3rkWgZHkfHXE9lm/QDTAQCrJox+kXQZ7Iu7kTJ5W4tkug/qUpjHeYLlRCmuNqQrUfxjbxK1</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6hi7T1ny4weJQnWNqodF/ayFWQQx1Fg5db956cQvTwfiZiGwZyiD7GnfUzmKdG4GwNsd1QDCAOiONp68WbCuZWy/QPL8eyzuNU21a6hx2aA1f9epBBW6/d8E9Naa5yc/0Q3lxiwhZewUwfz7NGPkxrHs817DATFZlD1H9kebhUk8P88kVnj2Ejx8wgzYgrZPA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfzE0YS/dcaCKslpL5LNXSUXu2/jfBLyJnLiAaZQDUreA5WKp4LGGEboxmBVzVfB4iZhPqiKK40daXvm285+liEz/hwqgrC2zSeIV4acwNHE3uNhAKblzKc5H+T2LmDilRlIyvfyTHeqonmcMaj8mFXjV9gfiGCqTXMyxdc5yuWg31lomflfaUiRM2K3HXjzmDpksI5JfVd8b7fqCv/AcSfYWdOnNaSObwNTtAFOsviuZ6ew1u53fju8XGMRTp7iNq8jg7TAJXHgXiyW2Mt0YUFfyskL/G2ceKId6qWBrdcblg6jrm0go9i3wBjcR5yaIt61S8VihSbU8OCcZCmAmTCz7wNkL/KrbhytwAwYO4JJ4qEbF0C8X8q0aohDZddDqb+B2YR+IiyGwNZ15cxOqor6Abyvf0hB8S1XE6aPGwM9aNX5iqiWauy/iBQ7TeqXqUbhGxaJkURM4yc0u9iUwp1g5EF3bno93DGcSwlgpfpSfuta2k0KGMoKWiSLbOeOE+Q+peRZZG/gBLQ/fjZzv0ljKwe3YWs6RZPYdWM/Z4zg/xmfr0mT7Ds7cBydT3G+c1j+RNXCSp34o6qqJ0t/V7U/UQx3dM9RfQ/jEMHd7vkAcEflAc+VuD0/V3qhAaDmbPhTaBAdtCAjiHk88quqbM++GduVS+8XuE9S/XK3SuuNKc3+vGZCValX+kxVpksEynkUZ7Jrap40Bodmy40cikdN3jPYfIWJieOTA80CPDYcghBsvqeaeT47bU5yNXS3ds76RWhwS8odS/sYTmjZ3786IT5E/8XwKijRtraF0uVzv3zYrzjxWAmV44x9viZ8l4=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>