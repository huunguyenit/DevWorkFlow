<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitInputFilterShowing.txt">
  <!ENTITY CostingUnitFilterInserting SYSTEM "..\Include\Command\CostingUnitFilterInserting.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xcdvtdd2" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu kiểm kê vật tư cuối kỳ" e="Closing Inventory Detail Filter "></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_yt" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1' and kieu_yt = '1'" check="kieu_yt = '1'" />
    </field>
    <field name="ten_yt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
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
      <item value="11--: [ky].Label, [ky]"/>
      <item value="11--: [nam].Label, [nam]"/>
      <item value="1101: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm48ywl12W5t8msu1RZTak8z7xhHGNn8IOOKDQdXLQqqvI6TlDBbXskie9hwiMfy2OmMh17B88YFitNWdUQ5+r8FC2Cy1iR+i3VKpPVj5Zgb8jCIgvZBdtbQHgtsg2nWhgit4QOSvyrgzs2IH7bi0Tatj61E55hcMNXA4IE5kNon1fd9HShSA7Rx72wdJQ12WBN4KtuZDkLTO1NHITqyorjuVFWuVSKS+mwDDPNLSMl8l/vOQA+5CfV13T+es//vgrUm1cSSihwldAt1kNP+IMWEHAZTT2o+yrmeTGnDdMv4zfhR2VdYK9OMMNnI89Dj/SWhtGnpSVVZp3s9Lg89R+wcG8l99h3Pdd+AoitkM4Ze61IR1mQ9oAxjolbk07CMub2zQJOl+OAPNeZKVD7pJA7ECQTpdA88soi5gxn7nyOxBoxCYOrtEmRcjvd1NAWsZ9LSqQ6Bl4V/fCvI2vL1jFA+6cAPjIc2QWP2pGqpm1rlDzZpffoMo10YVkxy9kNK8G0hwvHulN7zeHVYyVsucZJHmICUmJDfm8xt9E3T7l5zlJj4R6WK1J+jtBSCYqWJWAJHnfcDR3pV4CL9eb71ZrfF02kY+jR4oCAvz/hhpUxd75JVHQX9G/LBNf3CeKjME0vJQtjUzCn4xRK/9oLgltC7UD/H95TrfyEBCG6NDI+LV0vL4opiIAqzSlcHGEjkaJSazi1k5aT/2t2nVLWsuqm4FqXSg1yVrJwC0N9Nk4aO0LmbSwgmiIxp45A5tHWMtqdYEpSmxuTsJwukQjBPjK07o5kL0Z0C2mkJCtjjkpMhrHaNR8ErSr6uRkd016zJDbX3tyoqZqEzTKBssli6d+dXcH2s1Pfjxt3eIj/hIC4Fqeg==</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>