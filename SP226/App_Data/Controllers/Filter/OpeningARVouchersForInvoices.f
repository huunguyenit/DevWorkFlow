<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="cttt29" code="stt_rec" order="ma_dvcs, ngay_ct, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc chứng từ đầu kỳ thanh toán cho các hóa đơn" e="Opening AR Vouchers for Invoices Filter"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="kh_yn = 1 and status = '1'" check="kh_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="111: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1110: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgQsFsHDD0zSU3zEuZESHR0+nooAmjPoqIWecuDMaaErbbCdVZpsCc3SoPvcwr7CNu3D0dxc4oxXdng8U95OPKZHVXi0+5Dsw9IttCU+KaXJp8jliVIbcaS0H9T4lBZBuFTDAwTrUrsTcb/wdindj8SZEN8gxVNPDDZkAvCOXGt25CiVfpTfYsMFVo19vc9+KGHtY3cph8ijnF4V9NuEkLYCNuaociIxlAgxZEKerEV8f/Z4K6Bz2VJ77K5QjnIBmhY+R44ualUnQSlGz72P+eGIDtcHUJnUsryVMy3YF7ta9uGwgtaNHI0KVgVmaepg1TO0pKuErzowRl9o1JtWrxOZxEAyqisfYu7jZFrDC9p4pGXqWSaaKVedDwLjofaKNdcNqJA2HU/PR4odketTH7HpiCRgqeCTlXOcqyaHBkOO9p90fEvkxyp9UWxqEBRc24U6ZyMZWuriFL1IKBq3KTA=</encrypted>]]>
    </text>
  </script>
</dir>