<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
]>

<grid table="vmctdmky" code="ma_ky, nam, ky" order="ma_ky, nam, ky" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết danh mục kỳ hoạch định" e="Time Bucket Maintenance"></title>
  <subTitle v="Kỳ hoạch định: %s1, năm: %s2..." e="Time Bucket: %s1, Year: %s2..."></subTitle>

  <fields>
    <field name="ma_ky" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" type="Int32" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" type="Int32" isPrimaryKey="true" width="60" align="right" allowSorting="true" allowFilter="true">
      <header v="Kỳ" e="Bucket"></header>
    </field>
    <field name="so_ngay" type="Int32" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số ngày" e="Interval Days"></header>
    </field>
    <field name="ngay_ct1" width="0" type="DateTime" dataFormatString="@datetimeFormat" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ky"/>
      <field name="nam"/>
      <field name="ky"/>
      <field name="so_ngay"/>
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMfUP2kqIDZorB1uJerS8IpySYdnURQ/q5nqZb2rcm4m88aMfsdDGBEx45/Ydh4pEwDTFeeAlLuWpvBdJwsT/lE=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNSid6WPuJuZBfreJpvwpkKZMlXfGHI3IQN/ORkI62cB/ShdS459R83pdQ8edHwcXNIGVntl0VdyUFdTVYOFyoo=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRs73QFvYUsUOOwnFLI0lcdTCnlDmzsY2LnZoOrB3s0hiHXi7SH+vK6HT9SQlLlPHm72S8YRR+FVhfuq8bWVUW8Sn/gOBhK04Io+vHUbbLFaFaKlIMobxNfNNtYdavSqChK+kVrwKd9g2FAP3uyeqGh0wGGMVUyGVnW9XcEk7SxG2cIGDx8bTClw7/MLb9wL81P3KBe9Aqzl1gefCOQtaOVO4tN+nTBxX3AkW1bjBmE/zM2oYyUTC3qXHOtYccCh/A==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6HxhnS8rGXsILZQU7MG6tihTqkxU1cqCt+DhMnIAxvtuQ+N4njb0Oj78FsWbACiwY0eFsvcoRfLaSehrnSJgblNHEz3mPXV3lJiZ+zCxACf3q9rqIhJSnMgGKH0wHHa1pq7az0YK2Z7BsSH7TyqbdYnaOwHoZsbVUCxkNA4XDy/LOdggFlcoHPjgYPkdhnJg7BWgKUktLi+q7kaKQd0YtI=</Encrypted>]]>
    </text>
  </css>

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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Generate">
      <title v="Tạo kỳ hoạch định tự động$$90" e="Auto Generate Time Bucket$$120"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>