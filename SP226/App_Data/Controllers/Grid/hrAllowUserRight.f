<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessRight "(@@admin = 1 or ((patindex('&#37;,' + rtrim(name) + ',&#37;', (select ',' + replace(restrict_users, ' ', '') + ',' from userinfo2 where id = @@userID and restrict_yn = '1')) &lt;&gt; 0) and ma_quyen in (select ma_quyen from hrquyennsd where user_id = @@userID))) and user_yn = 1">
]>

<grid table="vhrquyennsd" code="ma_quyen, user_id" order="ma_quyen, user_id" filter="&FilterCheckAccessRight;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân quyền người sử dụng" e="User Access Control"></title>
  <subTitle v="Mã quyền: %s1 - %s2." e="Right: %s1 - %s2."></subTitle>

  <fields>
    <field name="user_id" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Mã quyền" e="Access Right"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowFilter="true">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="name" width="100" allowFilter="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="300" allowFilter="true">
      <header v="Tên đầy đủ" e="Full Name"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
      <field name="name"/>
      <field name="comment%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLio6S42idr0f5LevM4MJn5ZmBjY4eoWTSGu5vjln5wAhOn/JhfeA+l02S1srPLw0T/MAKk5c2j8P63lZ+tvKM8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKWj72cEbyMCxRFPkt2kVJ/frENP9Yf/rZxrbxlEjOYQpLP9ObXJMnDLg83ICIoKVs19Dvndj5QRWK202ERpD2jM</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ4fLwUxwT+DtighJ9pN9HMW/uvVVgZlcJ0Db9AKR4j/QTbZ6IMp/IHG78mVaVepAaTnZOWnNlDp7EcHJOyhqe+nT9wZntF0i8wqGpaotdavsBtlXE4kQzfQW1VNqxSFE9eVDehqIe6sL/4nPgjykklrbzdJkuC9fgXre067ofQn6Xci/uU3YAOEA10f3n65ZDrt2jZpR1UpKogPVXTQoZMF6QWKYBMFU0M5qZgT1q+JbQt27TrSauJ0QCGgr8xgq4xmPknit9CBLwheyhN1/u4K</Encrypted>]]>
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