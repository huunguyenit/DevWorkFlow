<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="vsysvoucherlocking" code="user_id, ma_ct" order="name" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Voucher Locking Filter"></title>
  <fields>
    <field name="ma_ct">
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
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE1dNbzQzOTn4QRiYLu+PlW1e4q+w6fZFnGauwiiH2Y1PHsqnjCOKealX9mPloALln3oS3YpX8LuWSz22gV71OkwDtlhqb9NVc/MbNM6evgsqgr25FwbhCX3U+fEg1KR6nxo8rThkKrB16BNmRVWu1DHMXj7AVfK0a3UIXTIhxrcgCvxtbwzd/FeuLk4//NEEdy/Pelo21i4ZG183e48DRwTYzwHgn2IKEmGgraJUBmN00AijMc/mvZ1DBFxebZCSNIn5xEzVgttyrvHMJNCK5D813eM4IRA1w/HMHJSBBx204LSTZTLlxTDnrW9PWYk/YP74qO/9gIq1f3EkYWBunw7kWLGbxvKTxgadPNdF248zNBrbQV4Or79oFzHsBXo3n/9fwLxEbxMkyqIhL+pUYh+oHYTjrmt+GmmuXLAmG9Aeu/6hZsD4mI/MCs7gduPyxiYWYxWrCbCR0sv9/tlATjgwQKRs3I3cp/jNWRhiUfVnD3a1qr8y7jIIzKxSFRtcQBy4Pxuny4xh9xWqjrtoO9G9VZhEPVkzCO4s8N4hjQy5gD+L3r7fS9oSyTKkQbKc/PYhaskCpUnKiEeOGmlE9Kw==</encrypted>]]>
    </text>
  </script>

</dir>