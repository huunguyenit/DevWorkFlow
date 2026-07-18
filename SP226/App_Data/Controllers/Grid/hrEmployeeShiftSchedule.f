<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrEmployeeShiftSchedule">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZnsNViThFE/nYVKe6B+HmaRbm3yIF5pDtFQ7RwbwgJgzYnU8xP38BnPw1U3R6ghhOA6kMBzl9RENgwyNsdHEUl0x204oDYJ3BJrrHKTvHpjRSEtF7IjqX6VWofBuBzwZ2scXbB4jgBsjzkqQEt66YKYU25Ij56peugePbNFLdk0w==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrca$000000" code="stt_rec_nv" order="ma_nv" type="Voucher" id="H01" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đăng ký ca làm việc cho nhân viên" e="Employee Working Shift Schedule"></title>
  <subTitle v="Tháng %s1, năm %s2, bộ phận: %s3..." e="Month %s1, Year %s2, Department: %s3..."></subTitle>
  <partition table="hrca$000000" prime="hrca$" field="stt_rec_nv" expression="''" default=""/>

  <fields>
    <field name="stt_rec_nv" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" external="true" defaultValue="''" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ho_ten" width="150" external="true" defaultValue="''" allowFilter="&GridVoucherAllowFilter;">
      <header v="Họ và tên" e="Employee Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" external="true" defaultValue="''" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n01" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="1" e="1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n02" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="2" e="2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n03" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="3" e="3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n04" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="4" e="4"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n05" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="5" e="5"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n06" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="6" e="6"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n07" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="7" e="7"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n08" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="8" e="8"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n09" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="9" e="9"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n10" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="10" e="10"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n11" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="11" e="11"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n12" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="12" e="12"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n13" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="13" e="13"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n14" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="14" e="14"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n15" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="15" e="15"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n16" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="16" e="16"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n17" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="17" e="17"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n18" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="18" e="18"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n19" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="19" e="19"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n20" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="20" e="20"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n21" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="21" e="21"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n22" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="22" e="22"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n23" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="23" e="23"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n24" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="24" e="24"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n25" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="25" e="25"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n26" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="26" e="26"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n27" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="27" e="27"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n28" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="28" e="28"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n29" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="29" e="29"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n30" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="30" e="30"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n31" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="31" e="31"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec_nv"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_bp%l"/>
      <field name="n01"/>
      <field name="n02"/>
      <field name="n03"/>
      <field name="n04"/>
      <field name="n05"/>
      <field name="n06"/>
      <field name="n07"/>
      <field name="n08"/>
      <field name="n09"/>
      <field name="n10"/>
      <field name="n11"/>
      <field name="n12"/>
      <field name="n13"/>
      <field name="n14"/>
      <field name="n15"/>
      <field name="n16"/>
      <field name="n17"/>
      <field name="n18"/>
      <field name="n19"/>
      <field name="n20"/>
      <field name="n21"/>
      <field name="n22"/>
      <field name="n23"/>
      <field name="n24"/>
      <field name="n25"/>
      <field name="n26"/>
      <field name="n27"/>
      <field name="n28"/>
      <field name="n29"/>
      <field name="n30"/>
      <field name="n31"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZI8cXorka+A7vqMTYd4tXT3qIHnXDrP3GlJisQ+ioD+3mPIU04TlIedusUq+S5qdJIQ05gmWB0Y7h10nkRIkKX3PuD7VaTNduOohBlv/0q+tjJR6OvEuT4tUDX9U8sAqcg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcD9L9AhYdVfdm6SzV7hCrrdr21WSOMraATBRfUgkPuYWxuyo0I2RtY6ikfviYLX6jYEaUhEBx9j1Ot/FTJQNbzcCQ7DHpEdBcS93M8bce2Gr</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtU99vIh/InNg50FsfHqbpjUAld7HCg6uGi2icYQeCLwS8Bdc+/ARFEQvGDIMgKhBcogLE0dXHtTIoIGL+xkLEJrzEZNfy5fxS0KFQo6G0NBFg/5vgvJgwp5dmPg6VpA9pHX7KKIGNZOjf3CLcJxlvd61ppRMEwdcFps41IC2rTF5echLlHY7mUEtvY6rG/BpR0TXwtLRhbROfYToAEL4q6yDqbdu36Zf7DolzcUFr65m6qTqwRzU2QUlm8KnWyUiDqqSgtt1bhCldmvc8EZpeUvodRKNjJUhiPOApBtJHfuAwPsOXscwCm81I7jjPdzlfSRBos4ndjXlXxzJ1m3zt+LKOAvJsbzlwXjjFOi/Mf0elIr6OJlL4iZ8IHtlm45G33WwXdO46GxOZjRyUbP6rr0OotCUYGHtB2lXgEJC1ZMhPA/9hJiSt6VD9XjYULyxadgHYl7Hi+3tdRkhhGi6WErHK/oIBHSKZTuBdkMM0fMHZh6CpvvksZ1YK9wewX43vFsVwEXDIB7fNtSJpw7GLZ1nIv6Ayr8gQNXzgu1ElCKUoDy4iezpzR7JLaAXIFpirw1TJ/J3T40VHUzqcgGaVrO29gcGVkUwjAMQEs+6BzplC0wio1vhU4kvUBI7M/jD4Je3EkgQiYtrTIvfn+qV7cu393ETq19qjMZGsYM7BiOrad3cNfy8nn2Op1bqeq82ZPsCbcXnjvQQPusFcc2aDCH5GkoylaRNBCJFg/g9tPeXXj2cm5b3a8P/FMowt1zL9unWdA8krB4RKT+WskPyxjnvNN2TjuXO9/ckKyWLOGLEezHupSPVvQ6acGceKekcWl1UduXy1XS67ZUUExVsmsliSDw5lcIuaNj4JDbrY7g2h5Zes5KSCQlEx/NPYV8U9aU4QpYluiA3Ddx0JGFCXi/Sgw6hQ7DnmC1S1+1HAXr5orQ85N4GykEm1/PDbmBAFzZSe9zvKMAtD2IQsaqOJMZIyLGhm8X9zXzHKwG1m9GdhvaLWYaET51ciPdzLzz5tcht/Fkr+2BZJwmD3E+IWp4PYTO+p6RHM6iBATPkn/CbvPcco8etI4yr7rc/2Ny/yeH3YUku+Ns2AHg7Xp/YkAAGzzuo0bB5HmQ8SXCx4iCMJGcVtziaiVrEWmSLRpDcoyFYvWGTyAGjF9KX2tyIDUjpJgMC4nWmaL4jUbbYfcyuRpp/Oo2Zx+LClvyIXxZDgZcngpkmzAg4bUCk+BuzL9rgzaS+NBvZWaLxkRjuDRPjhCT788z5taNLBCkCYfCHZH7ME7gFC4iXcg8vPHgcVhtGcspY7ZL/Xg5HZGearILtuDWpbz0l0qwdbY76XAFY7Y5ujVbsRrig0+ieNIHvZVtsHZLXzMz3IcYEeWKVKp27M2vCi4d1DvP60k6TNz2tNdeKhGwjanKDtRAIn0YltRY=</Encrypted>]]>
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
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS668g/FjT0b4Gz9mEPk/5J597eEwlEkzoXGO7gVbszy5eU0ZZmqYEzPHlzx6lA/K9Av+gj6q4fifo00PAyP39zLIui9nZMR3uSEUcHbAueODo9fzTehLq3wxUC6F9476wybqoPzfcHFOofmRI6IOSlmoJ8NSznQbBmy/VRZNPkvZrOVPjbG6f0rwu6X7sWSqmyHjW5gcehWNCfGoVponTr1+Lj6FZSwkt96VZW5RlJAMVMgC1ZxRT64nALdcgjulQNKshkC0iVLbD1gvI1gUakEUcJEvlpo7HFWv8XeBikWfxZxC8GW/fDga9BaudTRoAR8hGQe272fOm+NzSeMs0yqFyFDDz4y6kV4HPKbFyCsQyeHNk7Cg/WkrKFM/GMoW9WFwtlPUVlGYDaiaZAeqRsZxjnYJ3wR7f7Iva/SpXQYxLMylEqOuylO7BgzyleSKE9nTBWpIC3X9SWSXROqS0q7h+ROGUexo9vRQLI4pnYGWKTPO2br655kgD9GJQHvqJ4T21O8U1+pdxhflVdiY8yf2SqEIikwY0b/LuKJ2kAt37wSuDnanP842msQzsIfIkH8hHCNu7fU6/xPkk1Ygx6pPooni5176Pj2ZLmnM4dwuaRh5G/A7+3PGYu0Ey7hvLwwxbpQRF+MTFS2rxNGo2kBZDRoftbJxkWVvPz38TM3nQlBhcrQgX3PfxcPEkbwMkGxlbcPmIqXSeLmhuXBd2mN6ZNZfUDTebYa5BF/Xs+/8FpqBl7yVwYTEjtUYm6SFEuy/kRSvGaTxSX2ztFrHgYKNwCwSgx4e1R+XDDuCEceRqk/g1PxqS/DjZnrqj9HQePXGroMqWX5Qfwbz6O1W/HUTSnKsQ0Vd79M3aw1cBbFLujUcnA2SsGi5a8wAQNAPNABU=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLUEzkDLkMF4zmDlLJpmaFpKzbnpxQeRsBJnDR4XetPBoD0h9qKNgMv08jgxiG7jwD0sxfOH/htyq6jJW2Aoy8R+roYH2/eXBJJgk4ZhO8Wo8YWVaxBJxFDd/ACkN703huDjF8Yxhbr3xOKnmkvvuaW9FEv96eBYdv0ImV7iDzQd1iBfb7Tr31m8/WQS5076d1UbG0nW2LEfvb1+6QA4xTAZN6H8PaYplm42kEycEu8lFlQHDUggL+/SdZNWMK0Q55LkgqCxf7Y/ApzVn/oQ7XQCgC/UvqKjYxVFA68UqUToIC441KYfknDzUPQp4H6gsxQ1I6nXf/TrmHTjZ4W4vap3icZA7TFbk8Hl+P6cgtuis=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Khai báo (Ctrl + E)$$90" e="Toolbar.Edit"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa đăng ký ca của nhân viên đã nghỉ$$90" e="Delete shift schedule of the leaved employees$Delete...$90"></title>
    </button>
    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="CopyRow">
      <title v="Sao chép theo nhân viên$$120" e="Copy by Employee$$120"></title>
    </button>
    <button command="CopyColumn">
      <title v="Sao chép theo ngày$$75" e="Copy by Date$$75"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>