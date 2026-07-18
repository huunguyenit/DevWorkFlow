<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "SFCReasonGroupList">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYl51ytf8J+v3H4uYyOCsQ7c9uJusqF2kCeNbYDnS9u7lfWUUqS5SbPyJShDxpLNsFnXb4sulJ+LhW3TKKJM+97utp3isDoMhDzdCo1cz/ZjY6WBp5LUmzI9yhQTO0lmhF4msMeQK1NfecVOWGSbF+jG93fwowWQ2G8Ok39ymGvRTQDsD7vN/DM+oTWPGcJ4N4=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="sfdmnlydo" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm lý do" e="Reason Group List"></title>
  <subTitle v="Cập nhật nhóm lý do: thêm, sửa, xóa..." e="Add, Edit, Delete Reason Group..."></subTitle>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pTxKncLC6eTCXkobbISN2PLI99vFQiiT0SBThNqWkmNKLOSJNbISCChHZDEEB/5TpJclUfgatW1OFnrVN3YdmbxTW4JrniSSAMWcGRIC4iujVVYC05SJGa4IwpX/tJ955tMHM3men2RcHzcxBIyl5ET</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG8PJkXTolyVU1cDSbfH1emiV0TV8vJmXUhkvLKPTwTsz4x/1q8OMssDnf1+0RquKBnZ6fTjfIdrH0ibIsfybQ4aOVcjp+dTS5h5X6GxeykR</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtb7wM1KtXc4BbeIpelzDrS7mjCSQdALeyCLyo0t54Zus4Ydq7DVr270sK+j8l9RaRkN9ifosECXtE6oorJp+MpE9IoH9spIAf7MA8EH+ONW6vxve8nRexIemZs4CYPscoMzfpDCrPdnSlrerDno6teTqy1xEniIEL6CYYwZAKngH8vK2gMllGA65uUvefzZRIytz2f/hrXXmDI86MrXLfEcg2qwRzm2fks9sGU10BYyZKdVkM33asTsXSzNq5rktt4F15pN+nwsrfEnnLBd1fILQCM2D4gVD0OyKNTrPBkfWqKq6JJVzyLPZBgGw2xCNoovWPtfiCmG56w+oHzHGVyrjWOsqUPt/xrh8HLei21U9Ey3zd28fhaAKmfg0P86y7fv8u1fHy6+1IO59bZyxN0y5+GBfZBnACRdV24FjVCqjlwPSfvWr4BC7geQ7txtqCfDfQS5AyavqRtX3n8M240OXbIIFZZ3Sdn+4wxY/OZW/5B/iamGgr1xPLeiQsQvGfw==</Encrypted>]]>
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