<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "GNApprovalRoles">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZLKnzKlAh/bmA8TsOLhT2T3l25McoIr4rtiNtyw2vvubvzsCRL7MLhbKYJECSGtqGUCrlGGqwM4GHaNL4i37lWYqHxhfS4WMEx78KR2eQDqU4dFn+CuWN7nOrJUi6FPpczjgiwxk3bNIWBJPS5qn0Il/rvEq+qshn98e2QWAGSCA==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="gndmquyen" code="loai_duyet, ma_quyen" order="ma_quyen" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo quyền duyệt" e="Approval Roles"></title>
  <subTitle v="Chức năng: %c." e="Function: %c."></subTitle>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyền" e="Code"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyền" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6gh/THcOEGfsgfNaUxA3DEzHVUhWA5cUWvY2xqctAJ0IbyVGPqMV5hg6Anz1YKZ0qf13cGwfa/4zA4XvbzYcQkBVgP6HTn+3fpLQ6QyEoNOh6tzR+2M0meQyRqDqLUDGU+Or03UqkWCyvQZZ7V7M7FbNkaHnvRxV8Cc8Z+3pX0NvSc+iaiW7VCBMUH4NYKTTiYA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7546jBpjv9xHaTkKG06b7TFMWErIPjMiBTZsfP97BgyXU/+tqOIaQhENAUZG6/VB4gpvKnexU2QS60/pUBJZMSN4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfseWNWLICRqU3bdgbYC5r8ERK+c/OntrbUfyKsdhPo78EGX/EwsS6yKUWKn8uiEtoBdEG2A58FUhkbwBXVZ+TKbepel3tIfaFuegjJvkLf6ccSFNQedXz2jnaNJPKDILKo8xw0I6yDAr+SWPgD2s7ixZw1hVdPwh7pJzTyXriGaoYiNphrw5/44ECL34JbAscC2E5fThVZSKaOh4APrK2Z84MgcgKGVNaY2kOy18L6atZnfLTcImSYznJu+AThS3/3q5gKsj795MhekIs1tVVfe4PwccLrdB/P6gxqHwSYpKva6qtznnH/M9KPI4lcj0gLscu8lB6WKFaSFr3UIYSzIjc7HCWJp9yqzuZC0JNpbMYxvDUT1appgT5H1nZHn1qQ4MZDkBca9gCVVE4oYVvZjsz9B865iO2HJdoq/DWuWugOVhvIPGr3uTHAcu+btfiUG/I5ApJbWAF0p3+oFbeWTef65kkq28Q+jISmX0zv6qnb0a7u/FZh7HpNDvhxPaw==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

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

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>