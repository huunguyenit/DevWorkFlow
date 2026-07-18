<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "SFCEmployeeList">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbRX/yUd1PKRn1JM0DD6T7v127QWjAaAkOAgLm//2TkiViBuXSWTm62KuAUgogeVEqANAJ5fo+vdUgrWLyqVty6G4MPswITMF5g7ZCCtyyPbz+HyVroGes8HX6r/nRw7Zkwh09kjTX7Zjpmc5MUkgzs12y8DoF5ZzZnwSUqLLSfGg==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="sfdmnc" code="ma_nc" order="ma_nc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhân công" e="Labor List"></title>
  <subTitle v="Cập nhật nhân công: thêm, sửa, xóa..." e="Add, Edit, Delete Labor..."></subTitle>

  <fields>
    <field name="ma_nc" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" dataFormatString="@@upperCaseFormat">
      <header v="Mã nhân công" e="Labor Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_nc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhân công" e="Labor Name"></header>
    </field>
    <field name="ma_px" width="100" allowSorting="true" allowFilter="true" dataFormatString="@@upperCaseFormat">
      <header v="Mã phân xưởng" e="Shop Code"></header>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nc"/>
      <field name="ten_nc%l"/>
      <field name="ma_px"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pTDM5tKBvF4Xsnjp3kle2We9ZdLFw6PEtH4Y77TW2fCbMzmG4qXILGckIULRaQ9SWnT9tdmytYUpWAJ7uduxaSbQBjE94rROGg55Z1CfWij9wTGlvIdgeAjlilRb9rrpYNTix9Dol69mFsZqc/nZUJI</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG8PJkXTolyVU1cDSbfH1enTvVyNXtCiElKg0KBv6E/Fbi/c1FIrJ5zrCxmuvnhAKV9dB7xDg3jt3JmnRmd52CKyY+MINq6YgjyWT9DWUXqU</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYjuH9D6s9MzXzNb4nnLJzJt8yBpkkNCjQy03rWfALqw1HW48qbymZ7PzpqKultAuMZl4Yu+3/icwJcRnd4PuhjMA7x58N1ZlalOY6l2jDEULziCNYdwQDt93f9IshxH71qQeI7qOSeG+HPNDCWO5TX7xkKhUwiWUhPtB+CyimnFEbjPao9DsETIGNBIw4+wylBqk6PvyzGYIxPXGgnwRdf7ONKk2hGsohpgZ+YO2oubXk5ODtfXG5AZ9nxSIUUgeWM1MtwozS1q7KMpr+oIeYcdQs39ZFQqPOx5qqYr1kxhNtL3cmCk09ZdFGct8JytYe7ucnVIggL2H4VRRzjgBuia8D4G9ecq503W5qjIPVsvnVhMCpJPHdvuss03A10DSPPkwqp8bVwmCoNW+SiHAl6P1oz2ZRQ97QVIYhZbp1Kk7smLF023N9dIl46D0J7UPsf9YbYGLX/3lNxCDcpQxNAqJ1/Mm5l4m87RLsjxIsL0hmveR+XEjwyxqwm0qTDqL/8sOlsGnhpH4dy06KLmPL5PM8RpjCh5Hac11DSu7YJZ</Encrypted>]]>
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