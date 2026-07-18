<?xml version="1.0" encoding="utf-8"?>

<grid table="dmdvcs" code="ma_dvcs" filter="@@admin = 1" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đơn vị cơ sở" e="Unit"></title>
  <subTitle v="Khai báo ẩn chức năng theo đơn vị cơ sở..." e="Menu Hide Definition by Unit..."></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đơn vị" e="Code"></header>
    </field>
    <field name="ten_dvcs%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ten_dvcs%l"/>
    </view>
  </views>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLD/0tEU2x1w+6TBAK8b/TvvVYUCF/Mn6lWy6hUttxIN8/G+/s79MXLNi7UDKBg4736QGfF05Xka6qZEDfdjJBR9PG9ijY+LEZxTMthH45u7fQvBJq+Vr50jBIuMWsoor+p6VHeEjh3/aeOVx/IhqlBQ==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Giới hạn (Ctrl + E)$$120" e="Toolbar.Edit"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>