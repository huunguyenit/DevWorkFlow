<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê thâm niên làm việc theo bộ phận" e="Work Seniority by Department"></title>
  <subTitle v="Ngày báo cáo: %d..." e="Report Date: %d..."></subTitle>
  <fields>
    <field name="bo_phan" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="cot0" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Cột 0" e="Column 0"></header>
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
      <field name="cot0"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1ididlwPEoNZDnrtoHbVixi9eqbkRg/RWyDCZ08o/BFVYhjl2bfDvniOq3jOmqU9IzjDGU4MhxrHFZ/eN9ji6lGR2MGZxE3HvSvZKCgRPDcn0c1gCSFc03cepNzqeRnHOsGeJ2mIy+oHkSmciE+te93MjpGnTOKgjEd++A8R1iYS/2+pdWute1VNS7jmgO7gx7KytUQZL3MP7DANk4cWDWhaW+Dx31v3NMTkDf5aublovynK0kDKSJgW2z2NnrYFwR+uRNa8CsZQXVDe6W2+5L5b+L1m3rc/K8DwXrNtxdm2/e4wKXAo1AWyklvWvoUXUE8G3c6wCgQhFVW4eIsuWULHg+NKZrcXh86C1UgCqPhujW3E/lDa6nd0bQuZowgptLfk2WISpMZY7ynHFamdAXLqYzW7YJbgPkUczuQQ4zPgKFA7c+WdVVj4FpJ3PAJ0jhBREqOpMvhER4gbN8cqp6TJ0SjUtLh1zthud+1MFZo6ay6x9Rr+QYx0z46JXMDlEE+oxOipgGL4C45NjhbMO7Tcs6gc1WgST/lJpOfBciyGrP9Ow2DgZgZXa6OEFzPuPYdJxNWc9cUq8lwKGqZmfvM/t</Encrypted>]]>
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