<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or (@@table.id in (select id from @@sysDatabaseName..userinfo2 where dbo.ff_ExactInlist(name, (select restrict_users from @@sysDatabaseName..userinfo2 where id = @@userID and restrict_yn = '1')) = 1)))">
]>

<grid table="vsysunitrights" code="name" order="name, id" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật phân quyền truy cập theo đơn vị cơ sở" e="Access Right by Unit"></title>
  <subTitle v="Mã đơn vị cơ sở: %s1 - %s2." e="Unit: %s1 - %s2."></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="id" width="50" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="user_yn" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" dataFormatString="X" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
    <field name="r_new" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Mới" e="New"></header>
    </field>
    <field name="r_edit" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Sửa" e="Edit"></header>
    </field>
    <field name="r_del" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Xóa" e="Delete"></header>
    </field>
    <field name="r_access" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Truy cập" e="Access"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="id"/>
      <field name="user_yn"/>
      <field name="name"/>
      <field name="comment"/>
      <field name="r_new"/>
      <field name="r_edit"/>
      <field name="r_del"/>
      <field name="r_access"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiB1qYWeJMBilQH4XQPOED5NjHgM0tRez6oBmUEocaKMDeCam2H4e/UE/GCKSl3QjOQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNUBrsXOTrexuecQHR5XLyfd3kHcx9PBC5W/ZcNTQHpTpkISQyXMhNQlRuLd4dfJ0AUUF/EsLSDBKP87WxEYYm4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5vBP6hl7OFpBAQPJ4BKB4s45trXyDqgluRqFzhzHgU9P+A9XSGBLLvvhWPrlykXcRmqokQ01DQ2GWCZxvb83AKPAtSZCX+rzxRkjKQNaIuNwY0SO8/FO7LEcsdWsH1lDciI1EuXAIklxXFaTrlgbJsgLGqxordQJR9DaIU8SwNrl2t52scbrptnb3kLtxRM+ZbNzMQJg0bnzlxfv1nmd4UNGrscLxmxJ63/MkxF0XuqqZOgl7fXfcoBisLrcQVNUoJUZq65fV3Vncbn/bls5Cj1UjxIYmD1IOTSSrcnxPUAH/XHPg+UqyTN/1JbbIEGHz2NU0eERyeDXFi0Io+LufKxjmRwRXByf5lZniczfPfvuA==</encrypted>]]>
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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>