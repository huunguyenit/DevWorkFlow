<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="dmphanhe" code="loai_phan_he,ma_phan_he" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>
  <fields>
    <field name="ma_phan_he" onDemand="true">
      <header v="Mã phân hệ" e="Module"></header>
      <items style="AutoComplete" controller="Module" reference="ten_phan_he%l" key="loai_phan_he = '0' and wedition &lt;&gt; '9' and status = '1'" check="loai_phan_he = '0' and wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_phan_he%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_phan_he].Label, [ma_phan_he], [ten_phan_he%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/ITb1SeAHvMLhmvPMjy8CRlbFa4N3yzwWBjPdl8yXTFQNum5fti0Tck8zoU9Z/b0xzJrf3bypauFmrafKT5X7Q0gajjMobAdaYXaLhksZotfw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPbokxCzJ8/S6IKQblxdcApXIoj6+cwatWHKNo2EqBme7/ikmSBazjgxLLMEvyCXmrs6CSuzbFEa9fH6Uj5JK+D/TKoyvgpjpVOS00PKA7iD7x8Vbw79BFTz1gmRpjwZLDX4++HcecR+1y892W6f6phoe0SAE7r6DmheIZrPeYPq+QaywZ5nm+eGGyoWDskeaDDiz9bWYNY4CN0A7D8actqGMb50Ce5XsAbmIilbIkr8fT0kJ5EF5sUdqMZHoy+JNhQww2WfYuAiOb6ZBmlV9M/xRNLDCMlkYhWBR2QllR934DC4mGCLd0XNzPXbyWKCDblXaw5JJLHiq2kUOSGLHgBixJBSaytr8pLkff3sM6SEtn6cBj5ZaFc5mdCks90fpiHVn1L2jdtPdsx4S80HQXDgowJtkF4Ssp/0tYpc5zAaG6Mnz21ZgqdTSoTcnBquErJMl9sgCaDlX2oNTiJCG8WdGbeZZQP6uQAG8SyTb/UAc4mtLy7pY/SKA+Rbs+yAgg</Encrypted>]]>
    </text>
  </script>
</dir>