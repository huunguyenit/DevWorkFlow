<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="vdmhttthddt" code="code, ma_tt" order="code, ma_tt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="dich_vu_hddt" type="Int16">
      <header v="Nhà cung cấp" e="Provider"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 300, 130"/>
      <item value="11-: [dich_vu_hddt].Label, [dich_vu_hddt]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VjWAjSs2gaGxZUXnJJ73ogD6bf+6LTuH2KmpJT9+DQtxQZpQHc1bDORiwJdywlr69wTjVIygH/rTyACEgVKpnOilnifGTQXx4INrPl2/1JrhC9cR1VKUayL3Hmi0Qz7XQD3DptGE84J7Puz9XKg1GgUWo6HZrqBuNN+o2qXGRuK9muU3AAU31/9nwm04CXdfYoKDfTpBREYgY1j+oozub+9tdvzVcYGzYq1xO1ckHqIIN93p34fl9TCb2u4al+Eb23C5G9vLttlVs9sDY1fG+if5NEJxU60YJFatLDZiEg5kd4YwKtSpbBozrAQmaKYzPfc/D6fbeTaKatkU8/UlRrN8uZ7frxcQHBAJWyLhsio3nN+CdWdkEWUr++P8YDaJ4YfuM5Qf7q0MYnRP6L+65U=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY9q01P8lvxw0Kf8tAol11m/UXy/lCLK4ss2Avri6R+oiWHlHvPaxKhBUkB+cFJtnT/o6s8GpRMyrGPlVF2c1KYX9caJ+U/C+SoYjuYWZURBWmIqxg9OjSftYnjC+YXxAk+mhw6dKK7i3CGGmJEwknZFIYNLhB8VLBlLYuu0h14Lot8CLmW2Es7esxrp0bXIG0uDtmlJJN+1psk7UR2jGalY2aVYQlUxsR3wAMnQbWIXyZSW09ikx6oeixCX/8DTXp/AolMiuJvsyyRG5GcmZLHMKyGSSTgTt2O7SkhzAozfUiSYWCZkXVgGupv/mLjaG+14jIL9HX8paKfJpzI/JLzlf2I+hPudy6U+G8k5Lv3V26MBg9atWBPKDnMgtnZ6/ge5VeOZ2uGdUTBC5Xa4RXUEfaqlAWQKstlM1lCj1jDjJ6stV57jaccmzPf6WBVO2PuGpvCBZOB6AXb1WDBwoPM3JGsO20orWcF4t1d7NM4utHlRIx3eNGeY7zQKdyHm1H+Pa5OuDD0/3SbiFd6ldETHH6HuNVNxdIgSDEdu05CSUJiuSkmkJP7kQ/9iyTfy1wJlwPYSL7WeM5uHa3raCQQIcdF+/2pSNWxeLQQqx8rzY+TCj5iM+NUuttcgTem+5wqLYHn3yq8jbIA/QugptcK7SbejSLxQyw/A6hxBqQRQTPp1sWdZUjFb8/y3Cmm7CbH2pifgxtxTeIzDEKU54xhFCkSTv9FW4mYXqYP3TA1nI=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>