<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="mdbbh" code="ngay_ct1, ngay_ct2, ma_vt, ma_kho" order="ngay_ct1, ngay_ct2, ma_vt, ma_kho" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>
  <fields>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1'" check="kieu_hd &lt;&gt; '0'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgQsFsHDD0zSU3zEuZESHR0+nooAmjPoqIWecuDMaaErbbCdVZpsCc3SoPvcwr7CNu3D0dxc4oxXdng8U95OPKZHVXi0+5Dsw9IttCU+KaXJp8jliVIbcaS0H9T4lBZBuFTDAwTrUrsTcb/wdindj8SZEN8gxVNPDDZkAvCOXGt25CiVfpTfYsMFVo19vc9+KGHtY3cph8ijnF4V9NuEkLYCNuaociIxlAgxZEKerEV8f/Z4K6Bz2VJ77K5QjnIBmhY+R44ualUnQSlGz72P+eGIDtcHUJnUsryVMy3YF7taNNLCmMhT4XL9hEDzg6d+QFFQd8rDEz6JFerIzpFWDDUWPOGfOdnRu0vBUQXDphi7tC+YesT14zQUHhA9HlXYRKTigqW3SMyCuTFa2yPOokug3cpVZJ8HAt0csOa9FRrHwrr9RW86AbANnMeJc/0SLg==</encrypted>]]>
    </text>
  </script>
</dir>