<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitInputFilterShowing.txt">
  <!ENTITY CostingUnitFilterInserting SYSTEM "..\Include\Command\CostingUnitFilterInserting.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xcdytdd0" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx, ma_yt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc giá trị dở dang đầu kỳ theo yếu tố chi phí" e="Opening WIP Balance Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm48ywl12W5t8msu1RZTak8z7xhHGNn8IOOKDQdXLQqqvI6TlDBbXskie9hwiMfy2OmMh17B88YFitNWdUQ5+r8FC2Cy1iR+i3VKpPVj5Zgb8jCIgvZBdtbQHgtsg2nWhgit4QOSvyrgzs2IH7bi0Tatj61E55hcMNXA4IE5kNon1fd9HShSA7Rx72wdJQ12WBN7zqlJJA22oW1tAbEUrwHkzGPLtIJc5NMSvNqeoyMrZ5kmmYBC/TKG1ajg7msMbmtDQmOQvjKg7e+Dt81FBwuLnIjazLSteYfrv1BjhdsbPaHDd92wYwsrWY3/fP5bObXNeujuS1LEtkbI/y29TbahzC7pLgfs0vsru5HCN1Kc8Dpr1XNzunDw2/EMNtccIofe09HJ1K3zbJytqsTdinpqekGFU+nCF9O3pFcZi7RtvCUu86qB1Beq2V3tSkOnNulstBKVc1wW2i3ksZuZ/fjvvBGra5HQGQpnLs8eThZD7paZ/bZnVORYCiSXHN/fTyRHU0PIuUgIiden0MYKBAuuH16ayCcsdl9RzvuL85A4wwY2kK9NodtfGf3DPcyMrIPohgQsnJ9cOVrGYgUbew50bNSUyvA4gMA1kU58KW6pIi/9CvX0NoPG73tI0NdLC9wG7IFGONLm81X3kCHvSJ2UuQX3kM8fy0yERNARr+tXweIN0+WwYHt6WxJmNW7lYGdUVm2aD2j8Kwiw+si2FFz8LkQ4gLd0VnwBqckS/5iZpT0Z9fjlm2nXgq388GqIqyYLl3Cd3UH899DjdlaymolPZ</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>