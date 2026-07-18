<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 and user_yn &lt;&gt; 0 or ((dbo.ff_ExactInlist(name,(select rtrim(name) + ',' + isnull(restrict_users, '') from userinfo2 where id = @@userID)) = 1)))">
]>

<grid table="userinfo2" code="name" order="name, id" filter="&FilterCheckAccessUnit;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo người sử dụng" e="User Maintenance"></title>
  <subTitle v="Cập nhật thông tin người sử dụng: thêm, sửa, xóa..." e="Add, Edit, Delete User..."></subTitle>

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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOqUr2A7uGo01ul+Ia5TiiJYSRXP/tsDFly0xaJj3MgVt5AWMR0q4q50gKSi/cJE3H7y5CgpdWYKQoAlZEpveGDsq8JPUnBSLHRfoU6fz5jGhu+AYIeU4UMOn8fSOXZI9sjiLMasys19gL4F/S+rNFPw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw0r+aDZxD7/z8Jv5YIeUV+yrujaK8TGH9uYCBPgc/6DW/Wdw7F1MLI0VQSYwR+C54b5vCNLC+beiCMixp3ddxI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OVZ/lGi73Z3+ZRKkfj1/5sYHnnjtjRjkJBk4BUCZRmnrmIo9TdfwirnIaYqZzxNk8du51yT5Cil3ZIpkiQM2eUu5d/i8icmTrTgGIgdjO9hfyHvm6kDp/lWpGeoYoMnU2TRfCoO91P2twrZYNsK1tyQv4JwukAAD/DDbWremnOiE9QY0/6evUlxS+c4+ClFptly3nbCUHwu83TQRBbS8JrppxZ6LsvnCkzJCrO4QLm2F+Uk1sHhsBckAZfJbDI82q6StdW4XST4Hdqf7nHtFCxHzJpMnagDfGBjRNoBa0e3osjC4MsSn9w4gUx+dHGMAILNkr4wgpJp8fNDXjQYCL6sUeziWiinNCB/j2n9E/8G81o2WQyxbz6opWT4WxLqjeQaFCefCxDpC/YhOnBIeNdaCNC2IjGcUzerRfpudXbO41ha68TED3N3lpm9j/pyOVi5Eh3Ju8MluMQkbss/y71zD/Xmlww0zjTruSMWHxR7dciiS9cFZACkRZ4P6/+6s9kVId0cuJb5eD5+D7RIGgBtqzpvwxlIa9kHTE5CRP1ecv1oa+dx4Cnwl31rcF/ubw==</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>