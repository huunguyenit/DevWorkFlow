<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitInputFilterShowing.txt">
  <!ENTITY CostingUnitFilterInserting SYSTEM "..\Include\Command\CostingUnitFilterInserting.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xctgtsp" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc giá thành sản phẩm" e="Filter"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="1101: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    &CostingUnitFilterInserting;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm48ywl12W5t8msu1RZTak8z7xhHGNn8IOOKDQdXLQqqvI6TlDBbXskie9hwiMfy2OmMh17B88YFitNWdUQ5+r8FC2Cy1iR+i3VKpPVj5Zgb8jCIgvZBdtbQHgtsg2nWhgit4QOSvyrgzs2IH7bi0Tatj61E55hcMNXA4IE5kNon1fd9HShSA7Rx72wdJQ12WBN7zqlJJA22oW1tAbEUrwHkzGPLtIJc5NMSvNqeoyMrZ5kmmYBC/TKG1ajg7msMbmtDQmOQvjKg7e+Dt81FBwuLnIjazLSteYfrv1BjhdsbPaHDd92wYwsrWY3/fP5bObXNeujuS1LEtkbI/y29TbahzC7pLgfs0vsru5HCN1Kc8Dpr1XNzunDw2/EMNtccIofe09HJ1K3zbJytqsTdinpqekGFU+nCF9O3pFcZi7RtvCUu86qB1Beq2V3tSkOnNulstBKVc1wW2i3ksZuZ/fjvvCB3uEjwwKs9VTkxL99JyipgYtalLOTQXiZfJqjfjcOx9AN3Ry3rfQn45NZO5BxDSSu10H9+9ztVHybcgRLi72h24Ut45Lfe4RFY5GA5Wf/y3d0NQhRpSQmO6GMI7iy4RR05oaqZs98Dqbx7K6LX/X8GvpvWUd+Nprfz4GX2x34cxvwqBfmsRrarcDaJsa52WWaMRBv+K5kAUyEosdg7ZaY13fJExR3s9svTbmgLrltKQSujwg06GEN1jew6xYXVG+avm7iHxjgdbzQyP9iwwsH8O5Ugk5MFux5GJbmATYPq99hajOCh+3XkPqZ9Dyu4i</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>