<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid table="vtkhddtnsd" code="ma_kn, user_id" order="ma_kn, user_id" filter="@@admin = 1 or user_id = @@userID" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tài khoản kết nối theo người sử dụng" e="Account Management by User"></title>
  <subTitle v="Cập nhật khai báo: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Full Name"></header>
    </field>

    <field name="ma_kn" width="100" allowSorting="true" allowFilter="true" isPrimaryKey="true">
      <header v="Tài khoản kết nối" e="Account"></header>
    </field>
    <field name="user_hddt" width="100" allowFilter="true" allowSorting="true">
      <header v="Tài khoản" e="System User"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="ma_kn"/>
      <field name="user_hddt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf15S/Q1BGtG9fWu11F6IhAdezNXs1j7Zhu4XcVEy/jRxurghozIQgo3yJTfxib27BdLD0hPUESg1osq3M3+2EXXBAFJ8f1qMEIABSwEEOC7/FGOcUJy64zErUx5ysY4m7Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/T+ohysXiytw3f1/TtL0JfOhSI2dY0ut8q5wOB79B8DWv6csFI6yqclAmJs+hlFSHCgqUMEBFHaDEAr3X+ARSk=</encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FyMw68en61GZmQbec3NonvW1PPSRfWInhukDiYFkZg7P8veo2b4NYoIVLsjECg3yv5fH5UPSM0Gr7M6Iy+fXmCaw/5LWLht0nVvXjP+NzacLFWmFnvmzZcBEJ34EjAgOw/HA45Yw+by/J4564TZhM/4C9EkEeWuj6bwHeAiLds7cBe2IfU8T9p2zbc/sAd+CrWy8LUvHau+pfwSc7r8zwlCN1B69E76y987+PXDigtw8GkuaS0kRFjuA8cFqfwUECUmYG+Ih5vjkJuMjdnU7O15zIyQahDuqeQ+eDYJXr1IINvPVBdRi0iqLbjM37FgXFdJ1gzxCozq5lg8ZXqV9c4=</encrypted>]]>
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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="--">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>