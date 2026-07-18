<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 and user_yn &lt;&gt; 0 and id not in(select id from @@table where admin = 1) or ((dbo.ff_ExactInlist(name,(select restrict_users from userinfo2 where id = @@userID)) = 1) and exists(select 1 from @@appDatabaseName..sysunitrights where r_access=1)))">
]>

<grid table="userinfo2" code="name, id" order="name, id" filter="&FilterCheckAccessUnit;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Người sử dụng" e="Users"></title>
  <subTitle v="Cập nhật phân quyền truy cập cho người sử dụng" e="User Right Maintenance"></subTitle>

  <fields>
    <field name="id" type="Int32" align="left" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Id"></header>
    </field>
    <field name="name" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đầy đủ" e="Full name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="comment%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEveoLQj/mrSB33tYvuBkUbXZgHMSjLS+GSMd8AZdzOOg+Vp8DlRPxMo/fQ5jfhXaKI/ABV2Qky5RlEwHogB2XI=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGT4fS9SO5MTl2CowIw7X5YstNOndEadlxMkWjaLBuj+POahJ8gnV8qRdSIQ2xASRK8BK0ShWySIsdC6QrCA5a6enuLRtYQij0FrXPY/x07/</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZvBOdWD481co2dUPf82+pSZbvSt7urjoG/33oZIqHdkcXe/Z1/qccGlfZjRJ93qqPulOQxYVTqOKpNrLqXmgGVpxRWLZ02KtD66U/bZ318zJACJ1mpBH1U9T+LqMbxI09qRRNDV0LgX7PRMHfmML+aJDbmyhKvWjWW/YGveTFQIwq9kNkgmNG6V1yszOtGTsNDuzd+mRWdXlwtwIhPFAl3rO+FqbkbAUJXPvPa9ZiErt0PquMTGvw4SIRiOEE0HzRCexGnuaUC91fCrJaBfCWk=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7OOnN2wWWBzMJ98Dw8AKyxHQ0uryi5kcBw0frzIb9SnJ/YEJIXZoiz4XYz8KF7F0+NAFRWpK1Uk17AHcsZdjio3C5vcqkftVU/dtEjj/KyVWLkIsEM8i8vRQGULwn5wympg==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Phân quyền (Ctrl + E)$$90" e="Toolbar.Edit"></title>
    </button>
    <button command="CopyUserRight">
      <title v="Sao chép$$75" e="Copy$"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>