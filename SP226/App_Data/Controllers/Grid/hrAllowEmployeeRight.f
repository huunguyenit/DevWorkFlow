<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@admin = 1">
]>

<grid table="vhrquyennv" code="stt_rec" order="stt_rec, ma_nv" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo quyền nhân viên" e="Defining Employee Access Right"></title>
  <subTitle v="Cập nhật quyền truy cập cho nhân viên" e="Employee Access Right Maintenance"></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="bo_phan" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="name2" width="100" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="bo_phan"/>
      <field name="name2"/>
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