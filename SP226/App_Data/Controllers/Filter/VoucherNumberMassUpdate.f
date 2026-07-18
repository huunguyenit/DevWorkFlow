<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="period" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQD+NQ26qSU5tHmLC5YVrZQcPji41Y+yLXw/3dByHSGDVAlpnccgwivEEPQg5xOvvA==</encrypted>]]></clientScript>
    </field>
    <field name="year" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZX+gZsPg/+ZXdWanSJGPMpTJ70iigasfi8V4wj3X/COtWVRtUYAPAOdCU0shu866Og==</encrypted>]]></clientScript>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRlww324DK2TluCgnJwK8QGEzRrQF9O7q6fqaDR2EgWoZxE3eA0wcwArBOnAV9gvxg==</encrypted>]]></clientScript>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Theo chứng từ, 2 - Theo quyển chứng từ" e="1 - By Voucher, 2 - By Voucher Book"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="ma_quyen" filterSource="Optional">
      <header v="Mã quyển" e="Book Code"/>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_quyen%l" key="status = '1' and (ngay_ph is null or ngay_ph &lt;= case when replace('{$%c[tu_ngay]}', ' ', '') = '//' then '' else convert(smalldatetime, '{$%c[tu_ngay]}', 103) end) and ma_nk in (select ma_nk from v20dmctnk b where ma_ct in (select distinct ma_ct from dmct8) and not exists(select 1 from v20dmctnk c where c.ma_nk = b.ma_nk and c.ma_ct not in (select distinct ma_ct from dmct8)))" check="(ngay_ph is null or ngay_ph &lt;= case when replace('{$%c[tu_ngay]}', ' ', '') = '//' then '' else convert(smalldatetime,replace(replace('{$%c[tu_ngay]}', '$%c[tu_ngay]', ''), '{}', ''), 103) end) and ma_nk in (select ma_nk from v20dmctnk b where ma_ct in (select distinct ma_ct from dmct8) and not exists(select 1 from v20dmctnk c where c.ma_nk = b.ma_nk and c.ma_ct not in (select distinct ma_ct from dmct8)))" information="ma_nk$v20dmnk.ten_nk%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZX9QB47CIxua1F77QvSnGVEZIf3hAnj7a9CLwTdK2slRW02ko6crHOQ62cuAWT6vaw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="so_ct_des" readOnly="true" external="true" disabled="true" hidden="true">
      <header v="" e=""/>
    </field>

    <field name="ds_ma_ct" filterSource="Optional">
      <header v="Danh sách chứng từ" e="Voucher List"/>
      <items style="Lookup" controller="Voucher" key="wedition &lt;&gt; '9' and status = '1' and ma_ct in (select distinct ma_ct from dmct8)" check="wedition &lt;&gt; '9' and ma_ct in (select distinct ma_ct from dmct8)"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="(@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_edit = 1) and status = '1')" check="(@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_edit = 1))"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="111: [period].Description, [period], [year]"/>
      <item value="11001---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1110000-: [loai].Label, [loai], [loai].Description"/>
      <item value="11001001: [ma_quyen].Label, [ma_quyen], [ten_quyen%l], [so_ct_des]"/>
      <item value="110000--: [ds_ma_ct].Label, [ds_ma_ct]"/>
      <item value="110000--: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bhydntmDR7QHXhGSOqjpGIfWXeaRd7jGLogGFtEmBuSp5fsxzC+iN59kAr34br7iPTa59hGMxUzmpEOkVS/MCd9IWUACl+pXKlmLyML+p7R+HEBQQsKQqEmMTPkIQGZF/zi4HQspgWCRQcpYm6GqMYPckMi/dzmNwsNSU/1oWeVT+DVPgMrcvfhdIFwfPs5+Vyf56WiP8aeplZfHaer/GcrByshvuvCRP27UAISk54tR/CdryH/LvGZExVcnoJLentG45n3v3JC3JsmNANGEKo=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4+65GnrTKAr5BXyfZkKQYHJp9Ma9wuuEF4YoIHu6Hz4L6BakxJBQA7i6p7R0qON908bGKwbFrR99di8ZVDSK7wFR+sl5p/W/QgxRFqRYuGMY/Ie5WOK0CDHat4RjpYvjlO1JRudurnwNCP3CRYlu5jln5+cHlSSkR5AOpn6Q1kMgN2RBl1qasXSOmOe/X/ljca+GLCkCUu3NOnEDMfi8Bg=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukkjdESRzdm0xjZXWPiQ/THRGPqWDRBCEp+ZnKsOH8f78h2iuorKPcGc+9u2Ot+k/9Jt67svdw0ospUZ/c++w6AJjZtGuUYlFQ5hhNwmkdH7oSJRGcYD18W9rLhr9MXm6XN9PmCiAffG9HQ4MHAttkVtvq2L+lBW4wovRpWtwaMMzhSBOhsTMUYuwqpNWY5gSQ8MSEhNTXQSIGu+1tJHImJXoFBF3vePbaYzN3rfRRFAQWOu0d6VzGQ5jB0oyNNcIj3DV4xQru2+txH8FLVsKeGrQGUhduzsslISJFALK8ePeA2lCjdSCiuHRk+S1UeXcPv3zzzv3OH3+qs3TDR2bA6/bctGm+0MpnA8rDrbS8NJzDjcqPdM6HLl+Mwyqnq7y7VE2LsGHpsBEikU54IWpHooISEXjyBpB7j1oqwPC2s90c0IXAYNMQplU04TGLI2YbSfGGZJ6yjxiEjNPnLB2KdWf+TjalgNoIsRmBZDwf2J22wDqsyMqPfAHxi3oGCsay+39rLQsVh5FFNnsdJb4eC15Ht0UP6daP4w2FDB5/uOWnYg1fZkIgIoFEo6BJs0sW7</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtdc5/UhbzS3d9SNHRxTRFOi4j5WP5YY4vZIZNHJB132dpltsJxb6RAA8TmskU1rvqUkYOn1f4JULw2r+k9EDsf6Nob2v18wPu1wvbX/uMLmDoTm1MaMJ9ImACKq6PXAfI6tMEEpvJApZEw6IWTSUikG4Nn5KNZNDgoOJBu2M7pEAK4nUcTrKyhorUsn0NLi2lFCisd9Ylr52rh6hSP49BWUii6dAS4yNwHPBaXoALojclKHK3/pXMyhwy3UmhC4a8q/BWdLjttoxFSUos4kubkpm8GXL+1tularsSaxy7JONxTQSyzhftrnlBu7fmAEhtF/FksnPCwGk3BUlfRJO96ayNQpT5zoQfLJyW0jaoi9XU32WddhwajYS0AVZ5UaBNpXu0O4fwDH/UKf3YcyP2E0/JlIXFx7SSJmhqybad0G9nFZJE6eAOmQcGy3vW+8VMSfuF9tF6IBp6NPsse9brEyS012NUtOOk0ay7eqJ+AuJgWn4ia6eCfx/33QHIszl8ZkjAF9GZfTMZSBmGN8sNv/t7dp0XdZdFLfmVfH5xr02vljb+39QERXvsM8sM3l9jUb2uM7Vm+/u1bR8TCbq2lK3uYdYxucgFQ8rkl5VG0VRLH6tIgX4FipFZnsKkd35xxg+Da3+esp1mSPh9GQcdT0cqeC24SzDjWCXygXz/5L7iVrO5NCger/ZPWppqZeYgUbdcxudhw+Obz2BWN9EOMZS2I2IYNYfz/bP7laoCzWzlWV+VMIXTzUVBAGu4TApxsNE/aiMC9ylc32oNpRo8aqpFt87yhK+dtJWVn+XTcBqUFS1+vxK2HghUCypPGqEMwr0zaIZmUMzeFldzVSpYZMGqOIeJ/6oEi5I9wuaHCw94SsbV2a1qUSg7DsRgZFQ1QFfdAPAn3l2Q5dUQsSNxwhSdF918761Sg+rACpJUkGmEQM7i1FSVABzllKBR+3tG/Wem4bh/3hf+e0DXjmGbB/pptkag/gVOCrHKVYqMvJvxUx15kA+CBVITq3p64jxzU/B2VDXaaagi+PjfEVpJpwhsFNxljDJm0NFeiHpThI77rxmpz6A0OmHdeGoTCZhUQ+6nkaocl6qBYRK9QucVBJUb2FVHKZSqgIcZQ/fwsadhL8SlLOaelzJLnrMJJDrQ5HthrB3Fdg2VTS3MiD8Fa+Ilh/k7x1fRbbpgPhRzuCpbyxSszHrS4/isvSgj65QJkRlHTH2mirI2q0edxDnzfNtPVLwI/UxXjXWgI+gCoz8y23uxmazi8zoPvyrvLpeFAAPl1YSh2sIlBRppNiFMW+Go7hLqJdAGlUak0TCi/pzkXvzUbh/fVkIb+4BldYrqr7utJxAGqj7CgixZXQm0HWHqY5SPZFeCW4YP2vIUGp0w1VignNLG8FIVx1qeGZat7x1vLxlBsrQNq8p3YLFY0zXhz9x0GEb2o4kPWLwzFWMqu+XqE8/Wmczxb0VpmzP4FibLwS+B/klfWsc59e4eQ0hgDhmJILDK4K3H7CJVyplhXAH7jYnNeqcGBZAadtcw0PekxAod0UfXSGgnzqYnnWYgvl6r6jVHlxyLBD1f7sKsUZTuEKRqp7+VgoaYCm9vQkHSzl4imvjh2/1ICK3mdxU94DK/o0iUUFJiwjdWH9GBSHQWmPACr/PyvNoauWAqI=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="VoucherBook">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3FRra9DrohIiIFbEuTaV0G1xcsJ7/BWPKw5ntEA5I6qsnODzZM/GMEyvU76d0KFcPyb/qu5rko6btEc05+Inh52t5Vgoj5Ng9w4sVO8RNjPHu6yNbDpzblVNRxSJVgPakEZbn1yHNvE8AaSXplHXuckDm+rQm7asR31XeWwyYk64tzoa7uo1R3JhKj7pnrBvH3hUTUc8k4DpH3chl1vi/JrJ0IYbfDQcEhvKo33dJFZ</encrypted>]]>
      </text>
    </action>
  </response>
</dir>