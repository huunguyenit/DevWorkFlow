<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrmapbhdd" code="ma_tc, f_ma_tinh, f_ma_quan, f_ma_phuong" order="ma_tc, f_ma_tinh, f_ma_quan, f_ma_phuong" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_tc" allowNulls="false">
      <header v="Tham chiếu" e="Mapping Code"></header>
      <items style="AutoComplete" controller="hrStandardSICodeMapping" reference="ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330"/>
      <item value="1101: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbGi4Bt8vpl5t7FW+BIvzcAbXde3Qrtui/VRCW+E2iFOPVNNsfh9/WN/7xf8YgfkYYV/pD0cTwMqc98aaHBM2Fh7dmeaotqK+YvefXS73c4t6EMzu3o27F3dc9AOs0cvItEOWJve5nCmSN1loo7uXaTVUpjdhCCd8FCMOIaLTYg79mk7BInOC8VMPH4u/pDSuzgNKP+HG6YsFv1z3KkxipEvHjN3/LW45b/tRbwF9XdyVr+TCCUzT7/eg7GhTjQ0An5srRp9rP24Lxd/VWerCZf6NVHqPeTdhlM96pNQOEL2IriCdd54tzMIm6h4Kt4oECat/tOcDKqOMTCTuZSEMSBUPdmRD9o7ue74cuFiY0h2JAukQyzk/YvUsXnM0eQmcRzIx9AGXuCAY77HeetIzTxdhrjMadrYU7H3o4f39Fanu965LZeuf4KKTLp05u3bQrLftNpuu1ZcnM4ld+DsDyGNEKtYuLK8L/GHvO5eYzXS9Fhh4OmhWn1oVRFuyPnBA8ZfAk/c1/kY88tixPlNBdL</encrypted>]]>
    </text>
  </script>
</dir>