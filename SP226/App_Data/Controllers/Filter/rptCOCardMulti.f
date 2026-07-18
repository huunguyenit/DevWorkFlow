<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY CostingUnitFilterSetReadOnly SYSTEM "..\Include\Javascript\CostingUnitFilterSetReadOnly.txt">

  <!ENTITY Control ",@$control = '1110'">
  <!ENTITY CostingUnitFilterRespone SYSTEM "..\Include\Command\CostingUnitFilterRespone.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CostingRequireFilterShowing SYSTEM "..\Include\Command\CostingRequireFilterShowing.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginViewValue "110000">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" align="right" maxLength="-109">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai" key="1=1" check="1=1"/>
    </field>
    <field name="dien_giai" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9Z6UP6zpWBOTFy2wGWvxit3Ff5Nh8jMoxLotWzVzgBrkQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    &ReportMarginField;

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [den_nam]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai]"/>
      <item value="1100100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [keys]"/>
      &ReportMarginViewExtend;
    </view>
  </views>

  <commands>
    &CostingRequireFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YtETN6ZhggNCruyY5Gh/BWm7EQJTEk7acw5VL9+B5kA/tmrKfNNFcmyMtFWQtg9CmggPPRHl3PJN8edS0GtBk7qpsYXwIbl8z7I2bDWsIDkZ1IvjGE7bCfM+51TumazJes84vl/wyI6SC48MHigfD4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV7OwgNH1KG1jmOY4YuCBqrjkgowW9doUC7Ga3FNaIyHMH/R85g/Kkz2OqeERMZW/E3zPL4aQUgeUXtyZLK0MP+gABZtuEpIxUjBAe0QWNe9gQuCcG4xjqS+C2x2n13Zq8jT4ypVjzstw9HiMNuvWq/IpzROMwLTcKdVK7zfF0oRKCl+CRh9cnrZpTp+YR22nesVteVNOO7pmvaZanAsNmUQjJbQq5hk3ZMlleaNCRoMaZ415qHzEJeCG59fQ855WYsg89JI78nlCB/6D4fW4vrduyWqPlROiM4xm5vK1j7zFlUumIIG3g8M+P+3gzSa53V1qN8UaL9V7SViQnHwo/QgdQIwdhxzngEtN8/IMj/RPDnc1i229TfoBqRpNq7tOx2EzlFm9Mue0N2l9hzskWkgVRNPrIERK9fjzwnBr5glcfOZhWWcV0V10oWiznPqnOZxGYirR5ytvG1kJu0zV9oul1GBvXENiMjc7FvX44vaufp6IK9EvEsizxySG+OBz+NgD8ykwurEOE+aGbsqrOEEp1XCcFGHE8Xsl0JJ/nWKiMn98tAs8hgNNlEkQbjC4OTDbEFkyJ9+e08rHe4XKX92r5Kn9gR+zLKbOsWmM7aBAnOIJkocCcGgsC+nur5DQa5WQvr9h+RB6jpkMMfcpvNiD56d6E2/RtqWOxtwn8n5Rxg813YPnwwoMcurmwhy87e4ZKRqy4DerLHK6GI1ieCIgXG4zAqp34mX/vatDVfdbtkA3dBfg2JK5kvU+nGaDu8xWs6pG3jN1iBj3WUyVZB41Ij4x1SmA88/08mwu+H/79s5KlDn8K3mHY4OjkRaYj1wOWJJJodAtwgpG1f6qnWQdCtiGZhvlpBhjA56PZ/oqPY402p6LG3yMSOWqEhVjn+D9GVwfN+qoL55SKE2YRXfq7lTh9SrHJNEbCO0WmFdspdOUAcjfOMLW5aiCAFhKNpfzX1Nj0gGhvyis0iEDOHypqBZjvOKQviudraMpkqjnTcqiNoIqi/hgq0oZMIQBbIT/Dkw84lU8oI1WPyga8nQDvVScv03xzldyzJuHq3U1d4dw/dN/NBAhSCdqw0TrhzjYk9ZevUAq21y95mpTuB0SUQt4rJ7rVjmXI1ncGSMP3lS8vfh8/hY5aUM73qOI62Lmo4Qv4nwQGsUlAMnGKXDlCRYz86c1CPhwlqafjN+MqHa27yfdAGqEV6J5KnpHyrECdP/hN4+Kfrg//183JByXx39OpPSzfLKjhC/UiHZ</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

  &CostingUnitFilterRespone;

  &OutlineCss;
</dir>