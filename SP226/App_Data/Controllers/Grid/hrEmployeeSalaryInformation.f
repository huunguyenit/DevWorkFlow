<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  
  <!ENTITY TransferID "FastBusiness.Encryption.Begin$us12D/loR/PH36Y/kWCWUYHA6jECBEIj0iKpPwmTTld49OfXgGbbtaQWCaQ6vQLaFastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYfYateFNJlWQn21BOKWQ/ApY9v+8Qpjv2Y6OViIzO4UvQ+kyJJZhMS3/dSoHrOKPj4pBHrYs4IEtWaeBE/h+vYawU8lOq4IAYxRjkuSk/mai3sMEltH0cv7z3A8KtWU6CF5wf29yQuKv1yHXM/cFOjoLOrUDxrnQzHkRMOK5liORbARt0muE+HbPwvEMkNKkE=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">

  <!ENTITY ExtensionTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+5MdwVcqFNd9aK91Iq98YyzB8OHv+MeSfnYO1df5Zt9yrzutTY1x90URzSza68TXpZTuosRvx0EQa6b4Q+NRDgduN0H/S0hIhQsHvM5XU+5CvtT90AAR9Ox4SldC7ejwq6zPLgnJuDxxR61sW1GusM0Vw5/1V1MiE6uL4vqf4Avtxe+D/6BtVesS5vK9E4kT3vEkDWMGaZYU1+RpWPw5p52P+RPcmI2YLNcgJY/0JgkfG1Dn3pOTqI0GWpQ4kZsLhTFyE9MoXnOi+Gk4vhEL0QsODNf5wW9CoUK/EAskq3MKZwZvIh9oPD8oLlHYg5FcF7zPNeMnvAQyK0BJbNmQkuOnPc3SXeCktweh8M9JtC0QFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFEDWTCvPLFUYiCQ4IUQB/vC2IBu9x3fWD7R4w7DxGpksH2QjPaJnA80dJt1oN0g/9Odmxr0BENvS+GlikXhEUE8=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>


<grid table="hrnv" code="stt_rec" order="ma_nv" type="Voucher" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin lương nhân viên" e="Employee Salary Information Input"></title>
  <subTitle v="Cập nhật thông tin lương, tài khoản ngân hàng..." e="Input Employee Salary Information, Bank Account..."></subTitle>
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
        &CreateTicket;
        &ExtensionTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZFe0jU6I5uQPF2ISkTJ4ksoiinXAwnrJOCoWoLUxXxzTBIm/JXpldDbODw5yzqGxUc624acuLiaGr/s4zXPO2sC9X2zCbMNLAtzjhsHhFZkaVTKbwrsvEy5PPB9ZXhA2hczG264hJl3Xc2tPGToIuQw=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN5zf8chxzJIaUPW9138BJNliYRoWSf0iwPPxtNySjOIudWhIbfiXMK4Cm889QO0ZGdLXUJv+yXnmYXfHf6QKbil0PckAe1FxFvLgcR+7/Tq</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O51LC7Jt2Lt27O/ton2ghW0NtiUplo701KhiD+w9oODUZAyJOiJmpFK+l9A7DhuQM0xB5IbcgppUwjo82qvCpArjMF5oNj8ZeuMZqoAvAxFV3eLu1wqnw4QZxxogcllm6aKeONXz5gG0zEzJywfY2PS0PyxVzbC/7u+fq2VUMjy2gY/pF4qqaqIo9PGz3DBKlLfDnPfT1cGXN7mks4BqHgHXo9jqjlbTzgV9xtx1MXSbfhQ701Q3XQkUQvJB7C3uD03Q+Rb4VdT7iBK0eJMvGfWsMWf8QrYY2Qdocmyk/3WXw6wK3s9DIrLBbsGXOUEEqRilzeBzCKwqeouBJ/Fdcco2oxUArdH+1zVfb6N40mFWpO/T//fcnFjEkzDqBdHEjPZXlnHyV108iZoutYD3RRxsWqQUajDHnQKQrXkcj+Q84ID727rWi4YI7D9DMoplbf4Ele+Jg0TpaxqQ7rTf3WAnWJmHYM2f3GUozowPa8g1ES2lckJCFJ+YZ536oZfRyPQ5ARjt4DyGBhFbSyhA2wCW1I+jpNcaWoxP+zJTdYxJzMoJIZONahMTkfTDlkTJYHwnffcz6wI1B+LEaXIQ4GSbQ5fUIgJ4m6+W1gLYuzUeVtgsVauiD25I54Ww5Wwnyugs9L0bKdVLSTwMz6vP1RQ5Spe/cchmE8cG3CsS07heGKr3r/fbjDL7E4zOTZRhIpg=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5c4jWKFwUgNmLXjd4BPpAHd3B3pUWAdPDaJL/jB58k/c7hNRd360Wv6ql+D6LmzYt/f+7UH56r7nvMjsxlY1k7INPTMUCBSrkaaoXPkFkJe3HROM5xlbb3SWzVH0SJs+111VHoR28dWUnj0NNHKNaYk54nBBW2o4ddkjO2qCfVnRhrubiLllLPkRVwQoWWCziCEm7JxS8ZrBCgLEUqWST96CHpuEcA9V2RBs/fkfiDN0S/Sc1AGmtAi5O7dkX8uiWLk4SaqIf3+TzEOP4hF/2jg=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    <action id="Allowance">
      <text>
        &ExtensionTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIrLij+h1pylSlIg+PhKoESy1BUXQCY1UaCgbi90ShD2LLDFa7DxoyyaHiUZVa2H4Q==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS668g/FjT0b4Gz9mEPk/5J597XDWnVUwJvW8Frz+jnTFLXFY33AeI85mZAuoYwmtfhRW7VZtveeoQsQ8wDNZTOvtfqBnaE4k0bQbxlPd7aVgMW/rmqJC5LP9PoBtumhkxGM8LRVDlcbmlOQ/D8NxzrS9BPHNM9xpvZOmGegSyEOR+KEYjiSmIsXHRF2yn6Gv0/gMbxXr9zziTMZTVm+DNLonBY1zxSxmGiJ0svsm4LdN5tOSuRa8Ek9yZ9/VAlDd0tGrhLdri/j7PF5hvoQnbnes9WypS9dWtX/r8KJjyIt1XXfkZcvdShnlGY2qsfSkhwviZJ+rZAZYr+zdcoR9FQ2az4mT08uMbWS19CPHa364Cp85oOjXzsLkpfdcUUtXx8mVYy8HEjSvyjOnAgp69y4huJQC4HxQBhLF2OFSh1M8mCoQ9HOWJ4OIxtDuEK0UqM1hpqayyrz+DEFj1NdbeJpqzq9NjvdoIP16zcRXAqeYdOkIYIDf7fPJvmJHorpwQb1W4wuC6Nixna+oEJuSDCEwE83W3XXbKR56grGTM8ML9BT4niwC2OAPBp0eif/V65VbScg5ydqASZi4FrVwsSLx52QCHPjX6fLbv9ZJvESRGCYYms/uh7OjYk3DMX1gCiorvYQYIoP+NntzPNw0r9XF5ZK/h1yTBErjC4AT5WC9E9DYCsSeCY9Bcp+kSIiXZDZcedG57JtuuC1YiR7w3E90L8/CvyOxVhpsBtgPAIzWTmRyb7OjEWpAW0oZoR+OxFH53L6M4EshjgPObDizLKgYo6TLveU3exu4P0ZRe2Tdl28bsq8tTNpjz3dstqxOFn60VP36ZVjSicbGyR9JoT7WS1lK1kzXYElmHE6gDzUOtdA3ZUxKEAqpKslFsNjO4YyDHmlmf3PLcPTVM9/Bsof9yYAwHssP3SCPKzh4Nz1O+YabcdE+X+uJNvVu/toyQLJMMV4mk+4OkyfiHMJBBLV3+WPMH+y4+smlS5D8UiP+UQbpR79DKluoECmkclEawJUydfVCn+kx0es9Cj7dgCfWLUdskTdMK07QbTqwcln7JR5nomvzHMOO048UQppxHQvUrxX9b14cr7GLkOVp5TRDR0rxM53i7RC2TiGW6NPlLYDs8UDcc/3RTokoTph5edNCrzf80U+3Qur6m0ecPk1clAtdqiwCD/H5qRGUiJZkjrUXxl2fY9SvqrOIC/eykNqQ=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+GlJuEScEXidUSxTF739QcfM6zFsOSlYxp7s6UXtUNVrKBlqS+54xnoDj9TZIGXORzwNRN+d0RspT87JmRJn1wb5mFXnxgg5cV0pZtPXVLnGrRnaFg79/5ljF2VwHE1y3nHhiPjVJlnMr0Bm6xirfbcpDPjEHlvLKFU0qffhUT02jP0tNAel7mMI/0aLDeJwm4kzfnNEtq03J9I+PxisfSvRgqzTxF+9CacByfdPjbDCVoJJGI8oaR/+BDHfWQZcw==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp...$Lấy dữ liệu...$150" e="Import Data from File...$Import Data...$150"></title>
      <menuItems>
        <menuItem commandArgument="110">
          <header v="Thông tin lương"  e="Salary information"/>
        </menuItem>
        <menuItem commandArgument="120">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="130">
          <header v="Thông tin phụ cấp chi tiết"  e="Allowance Information"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Download">
      <title v="Tải tệp mẫu...$$150" e="Download Template File...$Download Template...$150"/>
      <menuItems>
        <menuItem commandArgument="210">
          <header v="Thông tin lương"  e="Salary information"/>
        </menuItem>
        <menuItem commandArgument="120">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="230">
          <header v="Thông tin phụ cấp chi tiết"  e="Allowance Information"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>