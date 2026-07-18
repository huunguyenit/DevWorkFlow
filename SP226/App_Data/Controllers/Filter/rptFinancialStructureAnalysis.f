<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultTable "gltcpt11">
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

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))" check="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))"/>
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
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6hi7T1ny4weJQnWNqodF/ayFWQQx1Fg5db956cQvTwfiZiGwZyiD7GnfUzmKdG4GwNsd1QDCAOiONp68WbCuZWy/QPL8eyzuNU21a6hx2aA34X+pV/zefDpY/Sfm2MQ0zPURtN1jPWjizVxziU428ekKlWRZitgQGqOSNmeXQ/RLBZUtNiNddeb5rOdbbV7mg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfzE0YS/dcaCKslpL5LNXSUXu2/jfBLyJnLiAaZQDUreA5WKp4LGGEboxmBVzVfB4iZhPqiKK40daXvm285+liEz/hwqgrC2zSeIV4acwNHE3uNhAKblzKc5H+T2LmDilRlIyvfyTHeqonmcMaj8mFXP3y4eTNSRfLhc+ie8Ir1ybI4+qCP2ofoD8V8TNyfct7AJCY/iWnSWocokpanJGtONJfP5/HaNU7IBJyhYa450M+IoZ4G5hDHVTWa/ohO1x68zImJD8fANdyEpZfMkX58sXU2jgNajt0U177EiMQ7ybMsRpFuVx2XhaxBzOcqB23SAlzgt7LV74WS5+oNFoNGFD3d1Tz9zkQjqle9uecureZoBbfIN0Fic6IWC5+oSmmdxkXRVBMvNmBgyjW2sJQQZODltbCrZcIB6BaMB3Az4kENfaIjJFpGdAss02EhSWoPk/C8su7adXQUJPUN4rUYneBjtPb48YIAOyji8VdZOJcBBgCRm8uu5sAQG29FDMAkZDYbWip26Lg076CR4VtxWwt4+cmbFHTPtH5+XjQiMCT47yUnTkq/+0oReUNfeBhrrmn3LReJGp8N+BScxw5KUq6hW5CD1SuejTzySHg0huhHh4fSNtyZp3usfWnvZQ1dVPjWjwYt98VJ8+F84DAw/qm5pLxMwhzgj6sEO2+iK+WF9g0elvzIlDn8l87Qd8+zqi1/YqHivIaBDMh3hk3ZTcvmfTcdBbfJ/QU0R4819m3Y1Q2upzMG1COkWQ98XY6YONfK0hej9sqK9gIZegMqnTKzxX/QY8CNZt0Y7zvgtbAvwBxN223q+1VzzpeMnhP1D0ck/z3jrIJs+pMg/RTDDPQJgfLrq0PdoEfHUZilRA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>