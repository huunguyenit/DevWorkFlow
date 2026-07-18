<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
]>

<grid table="vdmkieuphhddt" code="ma_kn" order="ma_kn" filter="@@admin = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo kiểu phát hành hóa đơn theo kết nối" e="Release Type by Connection Declaration"></title>
  <subTitle v="Cập nhật khai báo: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="ma_kn" width="100" allowSorting="true" allowFilter="true" isPrimaryKey="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_kn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="kieu_ph" width="60" allowFilter="true" allowSorting="true" align="right">
      <header v="Kiểu phát hành" e="Type"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kn"/>
      <field name="ten_kn%l"/>
      <field name="kieu_ph"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf15S/Q1BGtG9fWu11F6IhAd3jC+kZSeJuUAha0MBq07ZMB4h4IOMlDXDEhtcoY6uwRNbg6pO0oneSSzQ1eRJ6ewN724fw9uS55GaDcBw7KSf1sXILj6hXoKLTN2U3g/BeA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/lJPbWuDcAQruEQIg6OGY/6cKpRSuNtnNJ4DhpygXHFGafNeejDO3VU2iArKeEiB2H6QGhdV0Mxlo2/mnD08TY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D0kXF7wkO5RNOC3aovBLgup1EeVLz/MvvMyNsFWjLSbCUUJ5cCNZ1ILA5T0cB8/gKo5JC/OKMSzYzaB36tpxRvNQAMnasw+p+cVwjWSh9O5r8aDBaAKZ+J41lExpBBXmQrPVOi1O/36GzW3nH0uo51ldTQPDM/nNdve5xlb4rBbdgzkhbBRdRKbZrWR6LjcjE79og140ZLnfEd0/uP3ySbp5t9o+NeTZDfxDCIyzCxUklt0f+c/qG2fkXqPM1TopOXv6qOaC3AFB5r4RQrcgnwWSaHP8JE+HVR0f6EkgzEy</encrypted>]]>
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