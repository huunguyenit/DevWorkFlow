<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY CostingUnitFilterSetReadOnly SYSTEM "..\Include\Javascript\CostingUnitFilterSetReadOnly.txt">

  <!ENTITY Control ",@$control = '1110'">
  <!ENTITY CostingExternalFilterShowing SYSTEM "..\Include\Command\CostingExternalFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CostingUnitFilterRespone SYSTEM "..\Include\Command\CostingUnitFilterRespone.txt">
  <!ENTITY TransferID "rptProductCostByItem">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % PrintRight SYSTEM "..\Include\PrintRightFilter.ent">
  %PrintRight;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
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
    <field name="ten_sp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99N4yWuA8PwW2/G+8trXTBewoq4ZepEz9GQlkRc3ImV7yk3WGrFja3KaEVGK8a94ZYA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ytcp">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="Lookup" controller="Factor" reference="ten_yt%l" key="((ma_dvcs = '{$%c[ma_dvcs]}') or (exists(select 1 from options where name = 'm_gt_dvcs' and rtrim(ltrim(val)) = '0'))) and status = '1'" check="((ma_dvcs = '{$%c[ma_dvcs]}') or (exists(select 1 from options where name = 'm_gt_dvcs' and rtrim(ltrim(val)) = '0')))"/>
    </field>
    <field name="ten_yt%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
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
      <item value="110000: [ma_ytcp].Label, [ma_ytcp]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &CostingExternalFilterShowing;
    &XMLWhenFilterLoadingPrintRight;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK+vki0J1Lp5rAu2iaOiveOoWfiTU27KftFQozHWR+Hw1ACYGQjtHtq+9H/+h1muagtlBBSJvHMA8SOeCly2vvoQT0S9BcoFB+Glev3+6XPfNVhBAiI1ThtAftn1jmmm3OEHEmMrH5Q6W5bEjJn8GS1wKSBaFAjGvzNwA559Utgdjnp/yCDtaiBxOXlY5YVWVO</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKx5zU/IemPobMgthyfNBoZh5V0wbvlx6QAU7VrRjFpihjaTtbhXFxw3OF0vCZNVi3K5RmvRr5npSZvrcKewO3U9wxAr/ijV5lwjqZYE4PwSmoY2l092o7P0Eivt2SkcDqceMct7kpXW9SDubiME1hmuJASmH1xo/6mJzCdX4zq0ryzI9CJ6d8KOXhtD/clmRTxXBhgRkjlAl8O7Jgn2On5vcFjxdBDqnE4ue+jGdYDHbQX2rYvZvcafThYwun/Ts+2TbxBZN3EpOl8C2KYO7EKbdLBgsi2/M1qKIUkZeQKDRzcZndaZ6IfSJ3qvj3MzTNah1BBiljo/bAKy+gRzeBLFbq/WGtWWJzRg76Db2IHaE22iAGoPd81pErUlaM5EVoMflvrCMVOnbIOvWsLN9BqjY9YifLQvRCpCm0cO5Yyqf0QoLXl2/YKSXTW9V/pT2npgdbXwnI1nOWHuhsf/6JWim+Z6cmt7GOdVnW+h+zQTvIFW54ihlWbwrPv/K+X71bovEdIzsDewI0d89IP7KOKIyhoxE0Krcs6pE7pdCoKpFe7Il/Sg9GEc3ffPYVnN+Fy6cVPt2zpT8V0okDoQkTzMs5slIvmryVogpTv+/zIxFZiZwJFVZk64VTF/v9g9jNfuGOFI3i+FEvoWw4E7+ehQd8KQBoJPKtU2ZKIAqR9q3SYaBb6KMrwndg4rLm0hu+qGDCOYlBOiJcwWcYHs1PejceNM17isQXuvs0W7cgmpU5DpfbkHyVumKs1lxpYHRuEk6v6McZM23dDeFwtIpFwWEjyt29deTTQej56dUiJ4vdK5XqsExuONgZfnisDUdCnFTPX3GNxnJeVuEC3HVPh9gU55gq+IxT9VmdnCukvzwg==</Encrypted>]]>
      &CostingUnitFilter;
      &PrintRightScript;
    </text>
  </script>

  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>