<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or (@@table.id in (select id from @@sysDatabaseName..userinfo2 where dbo.ff_ExactInlist(name, (select restrict_users from @@sysDatabaseName..userinfo2 where id = @@userID and restrict_yn = '1')) = 1)))">
]>

<grid table="vsysunitlimits" code="name" order="name, id" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Giới hạn quyền truy cập theo đơn vị cơ sở" e="Limit Access Right by Unit"></title>
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
      <header v="Sửa " e="Edit"></header>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyppI6q7kmcjFLYDZ0lk5WCq8D3sdgu8H3HlVKzVsXpFlqsP04FATgX2MsEgxo2eCibcf2V6swhHIsAoXSVJIUU2t0zGn2UIzfd147crF9r8Lh1TESkupIt6Si79S/gvYcwUfzz9t0B39GRAym8IqV/NEzhQcLXIm70WFhNTOm+YNLfoIcfhpoQ5U1t7dFWfX2irXHdTEnZYELVOTK4/kceDOCOhi6HLo+JxSc5jjWZRK22UVm/EF0Gu8/GYYZgtCRNjdIQXzwc+xPGnEJoUOjoa</Encrypted>]]>
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