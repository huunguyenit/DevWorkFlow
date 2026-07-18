<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
  <!ENTITY CostingUnitFilterSetReadOnly SYSTEM "..\Include\Javascript\CostingUnitFilterSetReadOnly.txt">

  <!ENTITY Control ",@$control = '1110'">
  <!ENTITY CostingExternalFilterShowing SYSTEM "..\Include\Command\CostingExternalFilterShowing.txt">
  <!ENTITY CostingUnitFilterRespone SYSTEM "..\Include\Command\CostingUnitFilterRespone.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod">
      <header v="Từ kỳ/năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod">
      <header v="Đến kỳ/năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam2" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true" external="true">
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
    <field name="mau_bc" clientDefault="10">
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [nam2]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1100100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &CostingExternalFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK+vki0J1Lp5rAu2iaOiveOoWfiTU27KftFQozHWR+Hw0aGdaVqmm9k+5ba/PoVLe5Tq3nifyOozEGn6vPiu7DgtjqEd2TDOS/2a7WE0UGD3DTE81ae5Q6k9SL7pDFFmWqlPotJjRpygU5FG5/8sXLrIhcVtz8iYPcW1oJyxP1xNNkV3uO18fyM262VNqPHOvC/yvjRIp/4eXDb3W7H4mLeBov48qYmX92G6WHCPOW5OwiuZtxAIhZNXoOJdkJmksbEGrOOcN/0JjImQ8YIxM1Nw==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKx5zU/IemPobMgthyfNBoZh5V0wbvlx6QAU7VrRjFpihjaTtbhXFxw3OF0vCZNVi3K5RmvRr5npSZvrcKewO3U9wxAr/ijV5lwjqZYE4PwSmoY2l092o7P0Eivt2SkcDqco0cixrFbKsgYwtkek/9utIJUqWJ+zIgv7yrB49SPhyu5wuDkFsi+XQqrTVbgyufyqpwm+v1FplKD4QSbnpO50g+bAwhsCf6mSkoIm/j/59vCXBW4UBFYzlSFOvAvIw/nNGIbTTV9fqLP9WLRebTVBQ4yDtey7UlM6B2bDrB9okflr6mRNwBnQ2NS07jPvfFM0pEW6hd+aIBGKlv/XvyS7ILMNxYz4pgC8vzDzP9OZLBWPInOgT5DPWoXJNj8zCXygJSG8sPiU2E2VNbtK833sEk5BfB6JBmma5tqiBLIUP6s25ERIe0BHqlJNTk2GV3i4bEQy3zQNCgfCSBoJBXegQ/co2zAKOC2daLhexCbdbkU7OBbAuNfhZ2Cb7mjHfCYdKgik8yVWQ7G0gG92UjxmF+QztcRc5mF1x03ggGXOCRw8rjfGDM+1FPNVB2ayB90SNMzkkz+qxJriikSMfdAvM77Cnf7ioZbAJuFA1qSx7MlhKtBCFJvGKEqcVZorhkf/cs13uxPrtqxHle03p3HQ0E7AIQgGiWp9vD9hbpMf8L2GFJ2rvX2hz8Ahwz/lgsrAIGIzHWvt1gq0UuBtYM7uq+jOK5kSiJFGpMaSY/ZzL/TApNK8XH+gpfe1jXIY/5nSKBAcV0zIgs7AT9I9Hew4Dlr0K7UiV38MgjsHXY8Whdd7UqMEYiLxDoRJSUro+yw3n/JbTjFGQsDGD5Ib/nv7NfLJm5MXitWROzdlRRNKrg==</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>