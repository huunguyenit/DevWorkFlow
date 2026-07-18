<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "SFCEmployeeGroupList">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVay6NXtB83pFDIsoKCjxQTNXBWvSbt6tKN5JFdNI4uWbNnAeJoYW+YckzhfjzJWa2jWOW9Ae1fcbCV8XWVy6xM+UYFexuFbwclHbXeDTSlcc3n/QU2/sslCOcUBcE4fY0RUVz9Rk8M9nXkBgOIzh9bMBZVpf6wEnfPhncfnzwP3GW0GiPe77XTmy4tmxcI57Ck=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="sfdmnhomnc" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm nhân công" e="Labor Group List"></title>
  <subTitle v="Cập nhật nhóm nhân công: thêm, sửa, xóa..." e="Add, Edit, Delete Labor Group..."></subTitle>

  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ma_px" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phân xưởng" e="Shop Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
      <field name="ma_px"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pTDM5tKBvF4Xsnjp3kle2WebiAkjnpTw19tVXea6+deL6V0ch/GjEQ+yg2xMyyF3qFpSOH+kKqhsZJdAaOZQMAwKY0Ym2LxsysPG6xqp4tDtYhPFLommk6O78AGLwIjvmme5eWui0+0RdIcbJItaceJ</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG8PJkXTolyVU1cDSbfH1enybCBXPUeQ4jpHshaHAWFu8ErQWvITCmVHcF3Oya15o+DKEXpS/+gRYWhI/kQlozNJt9T/+rk8fHXVwjrVcZ46</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYjuH9D6s9MzXzNb4nnLJzI9pWCZ58pUjpZ1l/RaEHVocltgPpMnbgq57DR08feBlEYIGbBid3vZ222aTVCM9JPiwPe4gclsv20qiSq7o3asPvVVwPFPwKN+OVWOdrWAJ9jmB6ouAL+BBOR7nB4czIgfeZ45de3MzMkjx2fzgYGiEA7FunIVn5T1JSK/5KKJyf6fY02ZI0gL6h7tYPHEa/5VJVkEe0BlsXglTqzzeZg+W2AJK7DYJ1p0iV0dAU93on71HblT9OKnoNRwlb87gMdUHrRfoR5woWR73VPRHclBxZNhQ/+sWVo/jjxnVOAmS7woDPTQnd3HVtkkHBghYh+fbnFk2fgMYG2tWijKnaRfE/uO86Mb3bfnPgkZguwqekCcgSWFg+X1WhD3+zLwQdeV51D0Y3j+3VBRs/IquvCVYmIotXLyJqWJ8cC6x5X6n5ux6nECGiH1c1Ym8pSOVzDyB76d4hvAczLT4sXML3XEPSEk/orlL6vk/VPyn64ADEKExjIYn+ehaSQu/FwUATH35Soei6hBT/J+rrH32cZz</Encrypted>]]>
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