<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="ctgt20" code="stt_rec" order="ma_dvcs, ngay_ct, ngay_lct, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc chi tiết hóa đơn" e="Invoice Detail Filter"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ/đến" e="Date from/to"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="" e=""></header>
    </field>
    <field name="ten_kh">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ten_vt">
      <header v="Tên hàng hóa" e="Item Name"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="111-: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="1100: [ten_kh].Label, [ten_kh]"/>
      <item value="1100: [ten_vt].Label, [ten_vt]"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgQsFsHDD0zSU3zEuZESHR0+nooAmjPoqIWecuDMaaErbbCdVZpsCc3SoPvcwr7CNu3D0dxc4oxXdng8U95OPKZHVXi0+5Dsw9IttCU+KaXJp8jliVIbcaS0H9T4lBZBuFTDAwTrUrsTcb/wdindj8SZEN8gxVNPDDZkAvCOXGt25CiVfpTfYsMFVo19vc9+KGHtY3cph8ijnF4V9NuEkLYCNuaociIxlAgxZEKerEV8f/Z4K6Bz2VJ77K5QjnIBmhY+R44ualUnQSlGz72P+eGIDtcHUJnUsryVMy3YF7ta9uGwgtaNHI0KVgVmaepg1TO0pKuErzowRl9o1JtWrxOZxEAyqisfYu7jZFrDC9p4U1a2bnlb++NjD++Eh1s3iJduZ4+mqf5KOJFL1CERg8I0Agaed1o3SRVWiHC8NboVcsxbPJ67TP3DXHgqoLN2Q/wQuOoX0AYlpOWMF3Yp0TU=</encrypted>]]>
    </text>
  </script>
</dir>