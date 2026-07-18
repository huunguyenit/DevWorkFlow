<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
]>

<grid table="vdmkysohddt" code="ma_kn" order="ma_kn" filter="@@admin = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hình thức ký số theo kết nối" e="Method of identifying authorized users by connection"></title>
  <subTitle v="Cập nhật khai báo: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="ma_kn" width="100" allowSorting="true" allowFilter="true" isPrimaryKey="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_kn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="kieu_ky_so" width="60" allowFilter="true" allowSorting="true" align="right">
      <header v="Hình thức ký số" e="Method"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kn"/>
      <field name="ten_kn%l"/>
      <field name="kieu_ky_so"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf15S/Q1BGtG9fWu11F6IhAdcQqbDOQE33Ggs3vDvgG8AhXlFDIHt4R7sEhhdS3TNp2u6JYmM7mo6UoxC/lzSaM9MqqlxUl/3TkhBSrFuyCIH/Y4SlhFXWINcz7ytnsDzZml7A6L/tZynrqbSNZ2HyA4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/T+ohysXiytw3f1/TtL0Jc6cajaZN+Xdsp4th7Vc5In4dM8zh48ibAk3ZYu+IETV7BitKr9y/uxZHBiNgqXHH2U0o5bF8kJYC9DMhcDxljd</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70EfktusYlXcBbVo798JjUrbfuebfwMOMQycgoCnTgK0KVzl9IGOhgkyJFtLm/e+BnrJ+vGHTfYhyYBJHwfuzetMzxRFv79YATk/RUzmhk39Nm5oc04G/qEq+oNzvYxT3QkDiHkteGq67KL+hhtP1u/VJS8YA3bqG+C+arOKdApiLJPcQ8ZT0dM5fTtPODfJlRd0W7hl8O34ChQckajrZZqyuREqT+OWJh/T4KHru6wA1ZZ4VIxykfDqei5ATSmuz6YxMqNZR9M7VQvpXvA2c0odsY1f3QnQk8dLk7vMbEf72</encrypted>]]>
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