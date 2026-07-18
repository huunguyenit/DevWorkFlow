<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CRRoutingMaintenance">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaysckA+t6Lpi2yIumM+eMEwzvjoow3y1ARvI0m1lc3CNNRxytL4DkrrPPaCNr/xs8i+rk3PkgDTs/GNmULQWZW6uFjL0khDaEmizjG4+ZaMsil+C4LRLjDjWZWgKsb7HW0pqK2Bl4IKPmOwNwBq2D+7uJv6ut/7658BaVCuyJAgjuUhXq4l7id/djIuz7a4y34rQwMmVmwAmWlqoy65A0FFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="phrt" code="stt_rec" order="ma_lo_trinh" type="Voucher" id="SF3" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo quy trình sản xuất" e="Routing Maintenance"></title>
  <subTitle v="Khai báo quy trình sản xuất: thêm, sửa, xóa..." e="Add New, Edit, Delete Routing Maintenance..."></subTitle>
  <partition table="phrt" prime="phrt" inquiry="irt" field="" expression="''" increase="" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo_trinh" width="100" allowFilter="&GridVoucherAllowFilter;" aliasName="a">
      <header v="Mã quy trình" e="Routing Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_lo_trinh%l" width="300" allowFilter="&GridVoucherAllowFilter;" aliasName="a">
      <header v="Tên quy trình" e="Routing Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_lo_trinh"/>
      <field name="ten_lo_trinh%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYRAKeazDApo+vRv2Z0HPtHWAf4DUYYCtrjnCMeXaXkaTNl7t11HB20hnmFpdKKVBZSRvjyoBo6cL83VXrb8XlvOlTMX9E+HsQcld9ffEKBAXESOx+NulAHfXBVtjCHPOQg==</Encrypted>]]>
        &CommandWhenVoucherAfterInit;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+WrPuBxPenbNLtif76jLRHSk6VlGyiyQlfCkdwscQl/V61DXpLZpGrGWfkgRXtuo3Wk/C1YyzSugO2OEPOXRtzc6yCJR4AgzwrO9IzB7S54ynrOxa7Cn+W+RnYh5/9zDSQCWvb0d3v9mKCjoIx7/pPVdwRXqPxg7Vjnr0F4Qgo2C8u3hZJnLFwFMaqV70+f7a7V2cnyBT3zM+L0sls115/ds/g23N3ysIy/aqMQKu1x5sFsrbG14CaBakBW2TcvmnnICXmw+MY8iilQcIF7bcZtse60kNllO40q/Mty2/BX29pwbEEBgUhlYEvdbWwbiqeO5aWnVdS16BawbPHV05/7NRJwWUAdpNyQnMoUqFTASV8mEVV0UZ1QUrDlAw+ADNW9d2YvjAAes6Dz48x1as1Ey/dPeC+ncR16l+4V8hU9GyRCjPxDEh37t25cxziVyqYjLm45hVMgEn5txuOS9BA3LWY85E1q229Hjylym6uiS58ej2NYoixtyh/c/F3r6e</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSHyCuWQdmLNZRf19Z2Va00rV6QK7Wnp7CCca1xdwa7LToai0aNDAc+oX4dWQeHfUNX37iDp+Q/5NZ1Zd0OC8tKbkSfxajcX7cCBMKyXfFEeWQsMAz0x04zDkhgGnBXHI6d5+Op68g/HwA6+Lpk3NYUl6toiNtr/4rFYPGTTpymiBD2SqfGcpRDXYrCLUIa9zE/4Cdj+qsMT27TBZV/X6lb</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssRnq9m+Yg+ZVIAkTEZCcTnRdbJcEN1Yk6IKN1GV29+NECWQi28XuJPDBAafzN2MWRl30Dbe6jP6XCCGHAHCmDNQY/czg6USozB6aORQcDLqnHgunAwjtzGZAXsPT4eztuzzPF0th+DACVFmrfSxM4GoDlBM3SFmIVt8dsReB9iT/ts57Wckl8kSJPVRFkHI5k6kscHfQHAbpGU7UwPoc7YJwxeMAnTLU2V2+REGTTwrAA1gZoee+NAL0KsQzWx0uWTRqRQYO9dYQTj2boX/ASPACBO7Bz8f8zgcdKQK6wAB7b0g3qM87MqG1GQPbBoIark=</Encrypted>]]>
      </text>
    </query>
  </queries>

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

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>