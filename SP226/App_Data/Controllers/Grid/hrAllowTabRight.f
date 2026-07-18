<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "@@admin = 1 and loai_quyen = '1'">
]>

<grid table="hrdmquyen" code="ma_quyen" order="ma_quyen" filter="&FilterCheckRight;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân quyền sử dụng" e="Access Control"></title>
  <subTitle v="Khai báo quyền chức năng" e="Defining Task Access Control"></subTitle>

  <fields>
    <field name="ma_quyen" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyền" e="Access Right"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyền" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
    </view>
  </views>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7OAIQwxM45KqQh4yja7vyFbLn1UOStfgc1m84CaliBQQrVwN/vVdVxI1jVYFoPG9Y2A==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Phân quyền (Ctrl + E)$$90" e="Toolbar.Edit"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>