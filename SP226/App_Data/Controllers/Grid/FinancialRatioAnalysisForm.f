<?xml version="1.0" encoding="utf-8"?>

<grid table="gltcpt01" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo chỉ tiêu chỉ số tài chính" e="Financial Ratio Declaration"></title>
  <subTitle v="Mẫu báo cáo: %s." e="Report Form: %s."></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="60" align="right" allowFilter="true" allowSorting="true">
      <header v="Stt" e="Number"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="dien_giai%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="dvt%l" width="100" allowFilter="true" allowSorting="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="cach_tinh" width="300" allowFilter="true" allowSorting="true">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="in_ck" width="60" align="right" allowFilter="true" allowSorting="true">
      <header v="In" e="Print"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="dien_giai%l"/>
      <field name="dvt%l"/>
      <field name="cach_tinh"/>
      <field name="in_ck"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/LoBZviloreISoXiuNrsxnQxz1nixKWWZTMuX0kWwFNf3r7XNPX9TByWwLXAuvs0A==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGuxaYt/8PT8sl0/HrTIKDFqPg60h1AU1lOZWTUOC83rus24FcYAhLiFo26TPPPnencDf4GwGFSXjcQZVUHZZETsKuh3cjQaQBvf+8Ib1N8fYvCnwCOFMtXWop+Ok0l9wOqHjTYitfoiE30GFwxIerW8NiQwaOV7De4fSNDhjQDSRvZeTVujXzUZdTWcDCcO6HVLfoUJTcEbhfiHom288dgAbOolzStat6ySZ5jOCKeUkOG8ueJ0du4DEmQWXaXMolBFiosiMR9HZhC1RN+39nDX/SnNbfod20ioqkdXZbJriO0GEKWUPE0UybiRaHX90NUloWZypONwBH9FvbadZse2</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>