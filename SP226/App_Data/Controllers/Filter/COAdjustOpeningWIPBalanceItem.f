<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitInputFilterShowing.txt">
  <!ENTITY CostingUnitFilterInserting SYSTEM "..\Include\Command\CostingUnitFilterInserting.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xcdvtdd0" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc vật tư dở dang đầu kỳ" e="Opening WIP Balance Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_yt">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1' and kieu_yt = '1'"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true">
      <header v="" e=""></header>
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
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm48ywl12W5t8msu1RZTak8z7xhHGNn8IOOKDQdXLQqqvI6TlDBbXskie9hwiMfy2OmMh17B88YFitNWdUQ5+r8FC2Cy1iR+i3VKpPVj5Zgb8jCIgvZBdtbQHgtsg2nWhgit4QOSvyrgzs2IH7bi0Tatj61E55hcMNXA4IE5kNon1fd9HShSA7Rx72wdJQ12WBN7zqlJJA22oW1tAbEUrwHkzGPLtIJc5NMSvNqeoyMrZ5kmmYBC/TKG1ajg7msMbmtDQmOQvjKg7e+Dt81FBwuLnIjazLSteYfrv1BjhdsbPaHDd92wYwsrWY3/fP5bObXNeujuS1LEtkbI/y29TbahzC7pLgfs0vsru5HCN1Kc8DrArY8eVT//aS+We+0RXeLQHsb/pYb7n3bdB6/SGe03IATjQ7dw4411Pe/C8sI0DB4RVFouBxNbUgrqzHrsTtf6moFKvSR64R5cYdPH0rNiIfxJyhka5Ure09v+by7Rup18LXIkVVia1ttVuZewdPfInbVLQNnLfSOj/Q+BHWrFG81PJK/tiFFu84MJvrmNoXKwv3q/ZCxQLnA0MeGp88iYmeNe4dgmkVui9Uk7tLRbEMpZxDh+ovlvCalhjtYKKVWxDAk5o26rHa141FyZbMikKXtrwc/C8F7agfHVmYxV31gfIs3zTt4/SlApmMVxTYtY+F33PvNxGGUSm7cFPlLbNJcZZdnBtqIukxMCNn34kSXvE2QQOyTTeP+zMVGe0QwGEbfAy2P+IqQa4QnzIaJtBq0ZziduK63GBQfP03/b/oe4Pnuyvx3grtXz3JBvUi6LtZopIzM1nVJ5fa/7zlCI=</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>