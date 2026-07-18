<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="glthuepl0128_luu" code="ma_dvcs, ma_so, ky, nam" order="ma_dvcs, ma_so, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm49V+L4TnFOED4QETAuzmObLfQz7bOCyncMQYxkb5L9FfTkwB5ivGpTgH0im9mleShoSsAa4NECWVlXjWPmjmyZZO65ZIO6ScqXS1lbYkiTtc3k2aHmtg/jjV/8GZ2PFEO+S9Z0fwhC0+rWXJ6osiOwzjOWCfgN1ux13epWt9dr45VET/fNanx+wjI642P2EEWs9VQikzcq7bZUPKsQanT7Q72fOOk9M5sV8K684SqgPF0+y9spvjMwKv26Y1/ZxNA7TW3V/ZpdP2SvYEDhDoUpjgZN3WqmnAqQPnf08vcamvNFCbJG9muc0hkdnEKYzms3sm5ZVipGX/WjSDwHRkQnuTLCbER4rmpHj3v+4TGOy0zStaHwr1Xfyz0ni0LgGlH4m3KLy9LtMMoeF6VMHC6DoBPi6z5cZLpTeVadrmeomsV0P2iABRGDAKjNRQ1dtoNFunFzPY8an0KQlETNZv7Dr5QLEimYUxCXqXPKJmovlcg9C1fuOcIfp+DdUfN9zbTxGlDXkF179fmptmrrU/QPGHbe0Ga8ceeJBIvEVyWSUdw==</encrypted>]]>
    </text>
  </script>
</dir>