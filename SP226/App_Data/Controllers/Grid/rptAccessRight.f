<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết phân quyền" e="Access Right Report"></title>
  <subTitle v="%s..." e="%s..."></subTitle>
  <pivot rowField="id" columnField="xcolumn" dataFields="xpivot" indexTable="2" indexColumn="1" indexHeader="2" indexView="5"/>
  <fields>
    <field name="id" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" allowFilter="true" allowSorting="true">
      <header v="&lt;span id = 'idf_detail1'&gt;Mã&lt;/span&gt;" e="&lt;span id = 'idf_detail1'&gt;Code&lt;/span&gt;"></header>
    </field>
    <field name="description" width="300" allowFilter="true" allowSorting="true">
      <header v="&lt;span id = 'idf_detail2'&gt;Mã&lt;/span&gt;" e="&lt;span id = 'idf_detail2'&gt;Code&lt;/span&gt;"></header>
    </field>
    <field name="name2" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="description2" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên kho" e="Site Name"></header>
    </field>
    <field name="xpivot" width="100" align="center" allowFilter="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="description"/>
      <field name="name2"/>
      <field name="description2"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP0bkthnP/18RdyvkvZGKOcJ+y03+G2V91OTuBLxSR2U/UJTEraImxZuwtJ2CLX/6cKHsAB3MwxGLXEyY9YyyZke60FMrvuAIbqgl6x5lhrAI1gdwCtO6EelWA77t88mAdvWlgUq+iR5DT/pHc6xruBmbx0G5ihcq0wmjtWwUa+wIt5RbZtAOPplBIftrNi0wV+VOYDR7/HoWg9B2ny2sUBAc8p6rAqgpbyIiAkpND0P0JmrjrXDQeFVHOay5FxRoXHyJxZLbaPcqxXdtavHU7gtJLiXdiipLxxNH0IKmSzYJeqEqL3j0flnIqkUyDPYwLwNQWSD4hUmDehdM9ZefHImWYTm6QDiVl677gXDLrhm4Il+3GWQv7igb2fy3flLyUksFE072GhlTMaExg9DuOWn+wd4KKngLJz9igGwd9BXp05kxG/h5KYaoaW5BINAtQ5xu7kbGGBp7nIwz5dKl1lWwVCnjCqosh+ow19UemejdXXNPCGldDv4OmBRv4pXG6LmphKN5P9Xxt5aE+TuNf8arl2vV+oENDkOfGxitvG+am5EfFuk29bQSzuZwJnOv29Ke7QUI+/U0+3DuM962lJukCTTIENvAYfGJJlXNnKfNk=</Encrypted>]]>

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