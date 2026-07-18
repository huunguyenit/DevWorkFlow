<?xml version="1.0" encoding="utf-8"?>

<grid table="vsysvoucherlocking" code="id, ma_ct" filter="((str(user_id) + ma_ct) in (select str(user_id) + ma_ct from dmctks2))" order="name, ma_ct" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khóa số liệu theo chứng từ" e="Voucher Locking"></title>
  <subTitle v="Cập nhật khóa số liệu theo chứng từ: %s1." e="Edit Voucher Locking. Voucher Code in: %s1."></subTitle>

  <fields>
    <field name="user_id" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên đầy đủ" e="Full Name"></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" align="center">
      <header v="Ngày khóa sổ" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="ngay_ks"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGcny99xG0LSpq8h29dPqoxM/QhZ/nCsYHfSG4oknHUri/sb9RX/4+wQlASJYYBVNsi0hJI6sYBqEJqB0sbng10=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDkGNnTV9TLNBdA3nHoPwpClMnOk9QDF7GgyQm+Ofp3+1fJgTg1MWBmqw/neD0+jsm9x0jj0ZUY/g/rHn3re7enFRl8rjT4JnIPDBgko+4cG</Encrypted>]]>
      </text>
    </command>
  </commands>


  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtaKynHGqgZqulXAmnTYmg1afBPaaheWnAWN72x0B9+xNipO6gOA4N/su5Bz2f+Qz+b3vFC78KvwV5qln3NDUFYcjHJdan4pQRGyLa6zjyzCpkaUZ1lHE2TkicttiGHtkG46/AAZZqS4CBIGkZfyXdlD8zUIKk9GTic7ry7pF0pJFK1NkZiv3wyd0s3RkpvXoXNZXY9e+VyONKY0XrrjqMopdj4raFs/nFjt+Ma5scKx7</Encrypted>]]>
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
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Advance">
      <title v="Khóa số liệu cho nhiều người sử dụng$$90" e="Advanced Locking$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3fElp0K940nn3d9fybjhg+xBjJZ9Q7osSE9ATdIymF0J3SFFPtpJvPs2gvrfn+yn0tHAz1PzaqJAnp6Uc/QlQ0YEWEK9zJzUF6BEYXdrEFmt3fzk9PNEJF5r9MiTL2D5YeZ91TUd49RgaAB/tHlmiMxx+YhcEVfpLvOAWHnljxubbWKXR0LNeDgyV1E3MWSSg==</Encrypted>]]>
    </text>
  </css>
</grid>