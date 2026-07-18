<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê thời gian thử việc theo bộ phận" e="Employee's Probation Period by Department"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <fields>
    <field name="bo_phan" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="cot1" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 1" e="Column 1"></header>
    </field>
    <field name="cot2" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 2" e="Column 2"></header>
    </field>
    <field name="cot3" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 3" e="Column 3"></header>
    </field>
    <field name="cot4" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 4" e="Column 4"></header>
    </field>
    <field name="cot5" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 5" e="Column 5"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="bo_phan"/>
      <field name="ten_bp"/>
      <field name="cot1"/>
      <field name="cot2"/>
      <field name="cot3"/>
      <field name="cot4"/>
      <field name="cot5"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idiCiETL1rorfzQVTwOYaPzFus/+XudcOebrQSXmYa6aofaPnV6C/6aSyhJUS+Qxdctgb4zFEt1YWFkre71HlHriaVp62xcJQTtgRVUlWKTzqlA66F7HEcCXCqmVrsZ+pbdGMYH/V7y9kPy+B3eok3gui44xfRXhnoVD6lahi7diqrmRjy+VkCj4CcdHn5fY7+tWSuyiX+vWOeUUNQ85wtotjvHPyTQdT8NYBiCRIFUASTuHPlSJJP/Rebc03/bcd423K7DozCHIKkrj9byDiY4hxfLZJfvhqfM6ZtIPWej+8Z9YQoO/uCsibA8ocSv3GvwbDEsAcZS/363Wv1KdWlmFYkpbhMYgI5kaKM6yfdvF5/Rdgafw/JJ+UOeYyplrLSn8XcJ88vWT5aT1zSuyAVKX0sBmQqd59qz10/PMaY3lmB10yrZbIQ5j83cV1Tx5EfrjZ6yCUS1OAS+k2qNseTHyByQoYhDH7qYyjiLPi+h9sjz9nlN6Zd2JjXVe7kHqexJics4lzLQc2IA65J1cQbikPLQwGEIaXjjC+3b5RujqyQ==</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>