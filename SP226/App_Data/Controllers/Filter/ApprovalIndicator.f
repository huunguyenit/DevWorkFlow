<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="dmttcttg" code="loai_duyet" order="loai_duyet" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại duyệt" e="Type"></header>
      <footer v="1 - Phiếu nhu cầu, 2 - Đơn hàng mua" e="1 - Purchase Requisition, 2 - Purchase Order"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai_duyet].Label, [loai_duyet], [loai_duyet].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTfvoZ+nZU6LcUtKrLY0TmSXXRFMUKMSbn+ZAUPdIHBgsR8NAy2s73PImgYbvgWQls9hg1r3UyOrWkxB91ZaL8tyuUmo9zDPROAvB+1to0yhDNzBhwcANEkCnOVgIvW2+GXLjTwIlXSmwKHlyn0D8XX4BuOwD7YId+9bSwoPQBghBQ1ZTwVeoGneHFbeThcZnVSRV9t1dvOIRD3I0har+s7z6kDGwsuPEVwJuIxbjJuXW0VqN7csRh6iZxmhhcY9JZk5klM3YVrY6PdpFYizi2rlRBWGqN42XkB1lk+K3xHDTw0vvd5lE/SO4nL7OCFGLoBlW7C1jRUOjQSGWYqxBu74msw3Djuf7jv7UDR3oZuH3ADg+3VazjYxuYX8rtdRHepbtXFe0OANEiwqvKLc2TKeY1UhvCjqDwmtU3dJx7ugmNpsNNeAh2mw52wbi4tSdIw==</encrypted>]]>
    </text>
  </script>

</dir>