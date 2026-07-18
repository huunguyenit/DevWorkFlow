<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\Tag.txt">

  
  <!ENTITY TransferID "FastBusiness.Encryption.Begin$us12D/loR/PH36Y/kWCWUZkLV86gV9kB6vq8iQ1T3jIx9HdvNAA7Lye0gHVBI7MmFastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVY0fBgBRt//tZmQVPKJM02xmg8YazvflDLs2tPTU1BRCHo32seirVipKF7YbD2KE+kmxDyrT57tj1fs5PgAx1FTHHZmYDd8WCr6Lz1hgWBA5xnByb1B+evTgmVhiRaWLqMEir1I5CVVriauooqnwnc/ZSRiAdqt4n4DA6roqFWUNF+5PkwlC5918USqE/qmsIxJtJGnv9ifSYGdPRB2JVs0FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrnv" code="stt_rec" order="ma_nv" type="Voucher" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin thuế TNCN cho nhân viên" e="Employee PIT Information Input"></title>
  <subTitle v="Cập nhật thông tin mã số thuế, người phụ thuộc..." e="Input Tax Code, Dependant Information..."></subTitle>
  <partition table="hrnv" prime="hrnv" inquiry="hrnv" field="" expression="''" increase="" default=""/>

  <fields>
    <field name="tag" type="Boolean" width="60" external="true" defaultValue="0" aliasName="cast(0 as bit)">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int32" width="50" hidden="true" readOnly="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ho_ten" width="150" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Họ và tên" e="Employee Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_gt" width="60" hidden="true" readOnly="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" hidden="true" readOnly="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="ten_bp%l" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vtr%l" width="150" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Vị trí công việc" e="Position"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_ttnv%l" width="150" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tình trạng" e="Status"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
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
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZAfuhV88eNC/N5N7FSBhHhJBuqHCfS9ThomGHXl7ErJCHHvjjIb62vo7NcCnkR4/UpKKkVxWU3ONpfCs8BOrLsmBEA+1UfTk/xnrEVpKyRZ1PlWkgrG8tl9sL+fmvZnYHQ==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLawxGCuLySN0uwaFGfgsHiOS0eIo3fF9d36zQ9GUpzN4rKsrSyvnetMfbitrde4cSB1wFRhceqjGNhaX9CnhfBlTZHwuyiGKKP9/FwVGkci</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN5zf8chxzJIaUPW9138BJN707FxF85qTRJNRBsKh4Jbm9pcyW8LBlTz8krZAZq5xL56QjkTatIxUHxtyOXIRB743k64yhvVqyl5XTzDLMmo</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O53wY1o22kPsP7nOHmqmIRU3gpWl/yy5Nj/RyG3BPUYjcpW3rIh0kMkL3/snvFAcSui4MEX/N26BOVTM/dEJdRRSmFrpNGn6mHcCKtfTj+wGyvwi65YGn2ZA2cdL9RusrOYd6JAB7AK6DITUtlOSxFKRzlfxAGeFWlyQRWourBHWfswIZ7LWTEsTyrgi9nxgqBUFlDtZtJQq1HJRMW9kYUX90P+jW5KWR9k6XXUMKiL8qCdCpv3KJE1WaV8dbhEJEqB6+G52ClEDrl0AhJ0nufPuzvgTKz+uxU9nbns4WhUlKTqE08bbb9XgAaHDt/Ot9XSxdDotf2292N/CMQ6RcOJM37dCR+sAWOPfvquI54gsqUhFxqU+nRQcsjssaiNph7PWHrvbpbscJMgRrVBFZeal0GTSHEexrjOZyoQX2CSUyG/Mj264NwimSxaW5+YHci/OfChiLVCz2ZJCU5JCT1/892bFghll4cFp77ZiUv2naApxcQnokfowEsM1vdqdH3D73bhoST4PnERi0KqlrrRHVbtHK4K9Wrz7rqM1I2gq/WTt1FHoQWJm5MWga/j4D12lYNSoQM4HXGC+TJj9W6NShapY1gka5JBbhcTTcIjZgd9EJwP/5llv/I2yRzI5qFuKN20uLuGCXugvXq00TmVx0IyUlthYDZW3l/+H89Am9FeDL5QUCe/CyZz5+qk0dS98Bi5YBX+nYizOMBjLGBNxQEtwEsNynQUa8VAK3+0s38XrSIdtfoO9x8CprX4erzqj0ojkU3WataZW8z77tC2V9y3BsDJC6+1JBgPczHL55xjKPIAxH9RyXURj0+JGJtvbz6auFa/5oPeD/K9/1cODru84r9hM3S2lYPpKDpxwGaog6YUlOD3g30BZcOn8Ne5ujDxnPskxip0RMUrufOa6Nu3bPmMdT2MkuNbOOty02IP6MzQGdHgvQO6fxKPB1adU6KCcD6Arhg4w+IcLph5MFv/t3Z/BukkSGaolFU06g4PN8Wn5jOGDoeR0HprmEfU=</Encrypted>]]>
      &DowloadScript;
      &ScriptTagReport;
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
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS668g/FjT0b4Gz9mEPk/5J597XDWnVUwJvW8Frz+jnTFLXFY33AeI85mZAuoYwmtfhRW7VZtveeoQsQ8wDNZTOvtfqBnaE4k0bQbxlPd7aVgMW/rmqJC5LP9PoBtumhkxGM8LRVDlcbmlOQ/D8NxzrS9BPHNM9xpvZOmGegSyEOR+KEYjiSmIsXHRF2yn6Gv0/gMbxXr9zziTMZTVm+DNLonBY1zxSxmGiJ0svsm4LdN5tOSuRa8Ek9yZ9/VAlDd0tGrhLdri/j7PF5hvoQnbnes9WypS9dWtX/r8KJjyIt1XXfkZcvdShnlGY2qsfSkhwviZJ+rZAZYr+zdcoR9FQ2az2QFjf+j49NWS0LAsY25Q6d2sT8McY0RfJ8z88lhZB806ky6YVgxes0T0ZYvKs63/qg2JvNai+M+UNA9P0lXEfSgrrfpZGYkdVpl1EcLOxX3NOeLMlwX7bLbH5TGJIihaUk+yJStWSEWx32USTrKDiAKWXVcDr0axJtg6KEcwjjuaVGhv84t9KMS664Xb2ggzJgmXTUrKMVMhifprVJqPaik2JpC2vbDLq5GH8jk+Z0fSMPdcDlW+kWbBge2ygbiafsJTfjBCWQhRB9hahekxuNgETEGJFmav23xSLZ3QSESbZd7RL5FQLIHCpuT8iUmzTuMh2/E4BWtzseI58egv+Cx/CmIi3/QhQZQ+RdqlUu61mA0WUUZUXnWRFigSIwFF0pu7XS5EfHdRzbwRagst3icFMMcIirm2nrKCprSdNgtMNAsnSiFfe/rN//3T80nQpap1M79ST4M7DFL2bDOj36AE5+bsDty43EGwQCJcStSMFxg2vW8PW6e0Jz75fyZMYCENcCWON4gK1THZphcFAAialVrbwKbmnDcCaj+PB+/NzS2qbbso3m5ao/GCZNu2ETiOGdqNuxEMz68cKwnyT9tpfDFyQ04N4XynMmQ98nAqCK/Nvp56pBlN0eCvspAy8Ew05WenJUD4rhEqvy4feryqj4NS3zrpm5H9cG4aM8w8CHPVJ+4ZzXNjE60Zi5iVHR8niCxqLuYUxLrtiZe/fibrioitK2jLKv2ht2ncaTEF9bOuex4bJaF9E029dwxfr7NJojMJp0ehL2WMLejgBDWLaccMn/hKKKGO2/oM2XCMxDI6xNGeHfCBR2CIECid6f2/6Ho7MSgIfgSpA+txDrSCGlAj/o2H9jgActUK02SAIPeL5CjEuZIuI1RyUwM1oXrM/sHB3XSFFqpaGwIUE14KEN2h1T2hhmebEVOl06T+oBUjuNRMcssFvnNzPS3BhGEIU+PTk/4sNdt/DfGIeKdCAJmTh/2Ewyz8daPE7pE=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5+pSt/Yi8+yeanVq7My1E/swxdE19XNFzmtUBxzHkN2MbA5CxvR3+cLIAx3Cqy4SkAoap/FqXg95A4TdDg+ZVzBrMvN90s6X2XF+6Y7L9vkztSlmHKOR3Ou/ke1yP/yBAK7DGU0kRhj4YTyHjgR6p2w==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="OfficalPITInput">
      <title v="Cập nhật thông tin thuế TNCN cho nhân viên$$90" e="Update Employee’s PIT Information$$120"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>
    <button command="-">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>