<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitInputFilterShowing.txt">
  <!ENTITY CostingUnitFilterInserting SYSTEM "..\Include\Command\CostingUnitFilterInserting.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xcdloaiytdd0" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số lượng sản phẩm dở dang đầu kỳ" e="Opening WIP Quantity Filter"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm48ywl12W5t8msu1RZTak8z7xhHGNn8IOOKDQdXLQqqvI6TlDBbXskie9hwiMfy2OmMh17B88YFitNWdUQ5+r8FC2Cy1iR+i3VKpPVj5Zgb8jCIgvZBdtbQHgtsg2nWhgit4QOSvyrgzs2IH7bi0Tatj61E55hcMNXA4IE5kNon1fd9HShSA7Rx72wdJQ12WBN4znCF/K44IbudWLbZWpJ49T7aPfwND/uSSioThBsyDyzzTaz6BB+vWIbLZxs3aY4MOJ1crvOsLOfIEvqYNq++dsLZViIPQP7UiI88hkeDrH060Y5eZGV/pAQrwXolkeqeqzn6/o5ifeGVoIgAy2plSMKpa22MAwjecitv5CzgIQL89RsZTHBwkF0GwUGy9qPh2V6XA5nK/W0vV1AV4FwokkUrJsflPm4hTUpPdrvcvRHdfPkYxvZcnECz8si0dQZzAWvVicUKww+RPmJDS+6zQwKf1FmGnwX671gPECUKT0VriC+n5hM5KD5ch9WmFpmpMtk3CdhpO8hWJwJIRKHRNyGfEDw4ylCkrzwc7vf2sWppUyqds1VXAeeYkAFJizwAGQ1qMxlbekxX5Hd0Sj5h3V7jOlpwAg74fnS6wt9wLa3FFLogGiqeQfitjwCg8PiUnLLUJnbwb9Qd4SfV89Hm24cneXlvdTrNACHL3WUAJKyx/2eS7DflDJHdpW2EsetNctUNNTWGGotj0qDQjIopENW5/hXfj60icLEMRyRK40U+GBOEKc43V93X255AeSfiJqBEYzgAMuzqwzyWJE1BZ</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>