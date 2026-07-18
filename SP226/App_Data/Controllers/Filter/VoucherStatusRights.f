<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="vsysStatusRight2" code="user_id, ma_ct, status_id" order="name, ma_ct, status_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc chi tiết giới hạn quyền truy cập cho các trạng thái của chứng từ" e="Limit Access Right to Voucher Statuses Filter"></title>
  <fields>
    <field name="ma_ct" allowNulls="false">
      <header v="Danh sách chứng từ" e="Voucher List"></header>
      <items style="Lookup" controller="Voucher" key="wedition &lt;&gt; '9' and voucher_yn = 1 and status = '1'" check="wedition &lt;&gt; '9' and voucher_yn = 1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 430"/>
      <item value="11: [ma_ct].Label, [ma_ct]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZ0X/Kbc/Bsdk2TP5G0CFwg2QKKcke0aNj9/i7S2zXVOTF6zfi4h/CYPh/xGtbEM/o+MSGNJOO37cZIkOMWAgZofWz2LVhyxIeCcMssGlpiRBDpnDJjshg4/09rDPiV0v1dzuT7wBerC9ql09twSP/ytDm1OrMV8R++UoUTEP4V49a73cCz6/aT+SimXn1ZQc/SfyVbUFtLGUw4l3OCcMUyFNOMtqFU2+yI6U/ZPU/lyAwLTkLwLUV9YRx2UWE67Sd0dVZWI0pDzLitJXn1sVWcDWpbVGHnLlGso4V7aO7ZLQ==</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE1dNbzQzOTn4QRiYLu+PlW1e4q+w6fZFnGauwiiH2Y1PHsqnjCOKealX9mPloALln3oS3YpX8LuWSz22gV71OkwDtlhqb9NVc/MbNM6evgsqgr25FwbhCX3U+fEg1KR6nxo8rThkKrB16BNmRVWu1DHMXj7AVfK0a3UIXTIhxrcgCvxtbwzd/FeuLk4//NEEdy/Pelo21i4ZG183e48DRwTYzwHgn2IKEmGgraJUBmN00AijMc/mvZ1DBFxebZCSNIn5xEzVgttyrvHMJNCK5D+r22AYNFMG5v8+deNG8QNl0FTZ/85m2nUm2h2t3cBPsDoFIa1D1kO1XDRM0qVCSQiqpeSy2hATjdpf2n2o5OiobSniur8FCg1YUJsklBSrFDWJUb4BMHnCEEaVP0euDaqVODr1sqnaXUV7XH54a4ZZtWEqfPm1YfoLTEf1Qmf6rl4/k9VuN+95VW6Y+C6DciADb7cQIwNtr8vqDn5QmhqG3akYDDvt0BB9tLOHroGGlZwhfLxi2iGg3wHgtp11tStsiI/l+OLqV8anab0k621HWWkkgS3m7IUiB6/Vz4dz6</encrypted>]]>
    </text>
  </script>

</dir>