<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "SFCEmployeeGroupDeclaration">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVay6NXtB83pFDIsoKCjxQTNlo7KSsFZJAWlqdnhXvgGWVNTdSpkei3XC7VNT/bc/+kBjJ5bDb5GT0UxT2kW2KaMaOjEBrSfYg5T9tli3LKxPjEAQZZC8PO/YETTVBzBHSfmq8fzJFEmRwJV5hHXGGI+xABZSD+mllcL0zXKrcVRrB8EWS8hAQbyYuB7Rc7+7OQ=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vsfkbnhnc" code="ma_nh, ngay_hl, ma_ca" order="ma_nh, ngay_hl, ma_ca" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo nhóm nhân công" e="Labor Group Detail"></title>
  <subTitle v="Khai báo nhóm nhân công: thêm, sửa, xóa..." e="Add, Edit, Delete Labor Group Detail..."></subTitle>

  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="ma_ca" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ca" e="Shift Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
      <field name="ngay_hl"/>
      <field name="ma_ca"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pTDM5tKBvF4Xsnjp3kle2WefjQhBoDXO4YvSbmwFw5LQRi2kaNJiH4pfVi+QtEEyLnDOQfvYUI7k1l+jseBXMZ2K2i/8R+dkz2j0lBmLhr8oQnRZ3M95Vi7WyCj5afkzoeLPxujwKv+E5FZtKRKVxsvn8MkrWdRxJy2RcT3iV/bMtfNydvA4mpoAfmrmQ0YFh8M9UjSnBUfHE3Y+s2AGSiSs/6ce0EqgAnQdeW9MC345xh6ExB2eBapCugf3HE7bo6cCMl9J9GIWQXiuXuezkF1BuOCeCWau28ngWp7nBlHTwrlArxLNOGkn25BNej4LQpMVUHTMs6CA9qKNS3PV8zu</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG8PJkXTolyVU1cDSbfH1emRP1aQxqo0fNe6rBicAGOzAwIpXv9nGAsNoQgAeIumcv2qZVz760DSnF42tzGYlj2VaqfJ0sFPTVrOQIUdXwme</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYjuH9D6s9MzXzNb4nnLJzIrsp5q8pqwDxUi+wHLEs8tjv6qE5UthAQXmVoCjCTsUCEBvNI31y5/zMkVVNIdRhSK38I4T/uRAM+ws03GSZ+eTHddsOKks9kMczuDfKBzr8czTIGIfhc8+o7PvljGLnjRed9vTerKpFYp3El+TNpPmZaLHrTzu38X55n6jg45P3cJCqgOgH8H4znVRlpKYcLpn4PhXWNrOsJvtErBNhWGZkAEUNsli13HLEFX3r//d7jM+M+n0qcEKEzFRh+fjsYM72HCVqG39EVSN5oNdMYfms2tEEZrMXrpVnSoz/tYJ1D8qU0BExf5qxU+KjxGecu8v4fGoUslHtqPZjQucqqJunsDrsebBfojYsJnsfSJXrUmiBZ0e0YoGATH4Nh9eG88TTVm2/w/1TDd0mr47RysJ63jwL3RRijhGJOHctqfECl3F2U4ts13Z255fJdfFWdPmNwRu3pejshsJJMhuha/zq8hZiIpq9zkByBju9XyREPWAwM2mF32NqQXkRJPQ+qaDRJ+AkjFEjKLicbM4axD</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
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
    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
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