<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  
  <!ENTITY FilterCheckRight "FastBusiness.Encryption.Begin$J7oOmt/lk39OE/rcpPzEenWpXiLUB0ejZBnUFsqVZhr/bi7t+cBogv5vXOIyZJjP5ZqVp0Cmu2i52wjD1ttloMwWCgza3vZyfdhEpgyPwDK+H2tLmNAfuVOa6PD0hjqYCCveudVonsKZjB8CFTqg+lUL3RBYRWEiMwk4XuXNkR4wnUI0FBu7eTFsvuLxDRFOyf744h7fM1qdv21vBhu/Mw==FastBusiness.Encryption.End">
  <!ENTITY TransferID "FastBusiness.Encryption.Begin$us12D/loR/PH36Y/kWCWUQt2iLzayGahhee96dgAxTw5Vc+2O4qF02jvliy4wc4ZVGWS1/YpJxtguvmdLTU4Lg==FastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaJlftYzT0qSZpxoUs/kAZc1Gw6KPHY1fVqCbEC0pyotSGKlv1ebrzITao9asamvMrAjMcTUMS8aPJywjT52uAorIkoqzgqOB45VZwPOJAhaLgXOsAWI3EfHbrvx5xEHUGaofk8oeBlWS6YRZj4Wel8dKQdGLS8EFI2S+znEAvTOKeRhjEXELCmu6sNQr0EzOQdJGXKr61C6bgP3+o7/tkM7UitUnWNoowH+LTt3bpDwQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrnv" code="stt_rec" order="ma_nv" type="Voucher" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin bảo hiểm, công đoàn" e="Employee Insurance and Union Due Information Input"></title>
  <subTitle v="Cập nhật thông tin bảo hiểm xã hội, y tế, thất nghiệp, kinh phí công đoàn..." e="Input Social Insurance, Health Insurance, Unemployment Insurance and Union Due Information..."></subTitle>
  <partition table="hrnv" prime="hrnv" inquiry="hrnv" field="" expression="''" increase="" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int32" width="50" hidden="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ho_ten" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Họ và tên" e="Employee Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_gt" width="60" hidden="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" hidden="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vtr%l" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Vị trí công việc" e="Position"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_ttnv%l" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tình trạng" e="Status"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_gt"/>
      <field name="ngay_sinh"/>
      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>
      <field name="ten_ttnv%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZA7GcfOJeqAT0YihTjYDG3fIMLpIJuhYUkD+zwRfupww0GAVdh7dONUIAtxKtCnZUWzTFvSTTDTD7bYzLP6hNdjJ2OTzy8AU+xrqW8dEXPreyEhc4mKVOjUM8wAZoDOkZhU4yn/stOkkB1u2wW2U+BU=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN5zf8chxzJIaUPW9138BJP7MdcFcn3PKoCw0gOi9rqCz8Y0cDNtCdne93PYb70ADVDhYixlHf3CngZ4wiwtbFgZN9LIWJjJnUaag7eXDbUn</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O51Kb44gmW558k2Or3cj+Z9PvDPHcTrds+qH//WbPKeDF3DLn/XZAqdF5IHyUmZVrvgjsgLJ6dmXUmmYT6J4j3A83hPv0xpXXJMNM2i20+S0H9osMNDsOzp2iqpMkH6R9yKbufySNg03T6dPBO+2GnOaH88idSuVsY8DD/aDfXKV6KDgSNsP9p4VNvhmwUvAcR3WybRoZm8GGKo+nW8eikFJ13ktCFyEjgH+mFDSRRRidqAmBqo0Np7H70k0B43XnKdmAPqBrJ2cvwRvwMDG4akO8F/qo5F6jSGWpXvFhJ9Gc5MbpGtUxvzQZEHZ/iEj0ThKntFNypoIL1GfozDs0BQKAtBA1hLKKsAFu8XiD4bI1ctxNtY/Sk7dhM/vpOEOQm4dzfzWqgxmZJTIxIY9YlrHuLMhhBf0AiHR7B+itZ+ziOTkN1cNbfxpnee4XcgX1WnjriSh9awQu1uldmSTmmxqwE7hOONcs9V9lKEIWLiIaBCE7J35RZWzmJfuq8fFtXygMlXMLJ97l6kVpiIrmfDccDM4iZwgtl5Dmb+DjaCh7Q==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS668g/FjT0b4Gz9mEPk/5J597XDWnVUwJvW8Frz+jnTFLXFY33AeI85mZAuoYwmtfhRW7VZtveeoQsQ8wDNZTOvtfqBnaE4k0bQbxlPd7aVgMW/rmqJC5LP9PoBtumhkxGM8LRVDlcbmlOQ/D8NxzrS9BPHNM9xpvZOmGegSyEOR+KEYjiSmIsXHRF2yn6Gv0/gMbxXr9zziTMZTVm+DNLonBY1zxSxmGiJ0svsm4LdN5tOSuRa8Ek9yZ9/VAlDd0tGrhLdri/j7PF5hvoQnbnes9WypS9dWtX/r8KJjyIt1XXfkZcvdShnlGY2qsfSkhwviZJ+rZAZYr+zdcoR9FQ2az4mT08uMbWS19CPHa364Cp85oOjXzsLkpfdcUUtXx8mVYy8HEjSvyjOnAgp69y4huJQC4HxQBhLF2OFSh1M8mCoQ9HOWJ4OIxtDuEK0UqM1hpqayyrz+DEFj1NdbeJpqzq9NjvdoIP16zcRXAqeYdOkIYIDf7fPJvmJHorpwQb1W4wuC6Nixna+oEJuSDCEwE83W3XXbKR56grGTM8ML9BT4niwC2OAPBp0eif/V65VbScg5ydqASZi4FrVwsSLx52QCHPjX6fLbv9ZJvESRGCYYms/uh7OjYk3DMX1gCiorvYQYIoP+NntzPNw0r9XF5ZK/h1yTBErjC4AT5WC9E9DYCsSeCY9Bcp+kSIiXZDZcedG57JtuuC1YiR7w3E90L8/CvyOxVhpsBtgPAIzWTmRyb7OjEWpAW0oZoR+OxFH53L6M4EshjgPObDizLKgYo6TLveU3exu4P0ZRe2Tdl28bsq8tTNpjz3dstqxOFn60VP36ZVjSicbGyR9JoT7WSZbwtc855iZ53mB7esxwJPvYFGbRULqo3ypFyMRFK6Zk3Nbk+MTGbtTB5DYUAi5xVeKdAQg3L3mwO1k1LgyvDE2KnukdcpmDYcdZXqHAPPN1gxWFdSK54SkeUBKUYXNtb2r+quDu3c3HwUoF/b/63N9NAda2txj0kn7/UCiyDLvMVsHL5dnaAAOOxPkRmfWThHXx3susJ9CkXrpNtmsAyObBlVgU13j1dZU5b70522bQesSMDGPsA7eYAVxWx3z36G8uMxM4+RjxZfa8CwDI/aZO1xW6PT6hQrFYmiiarqUdySJTzCmkMLVJHCwYgjDlCOd2tOke3LAe9s200h1pNVw==</Encrypted>]]>
      </text>
    </query>
  </queries>

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
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>