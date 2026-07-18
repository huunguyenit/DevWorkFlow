<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrEmployeeShiftScheduleByDay">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZnsNViThFE/nYVKe6B+Hmafo7OoweqKmsexi78eTb0byJEIG3HWVduDFDKyy9TjIYsbkWMni43Mz4HKCQgbb4vBwkKwWehL/3oLGli7EIfnqB0ckbLIYHscd2tXr7C8+fVUFjeYXDUvd2HAYc/m4w2RfBBlG6ornX6wyXD/nuQnV9tsOT8pw6Jn8fphmfyssMiSQUc0A0uynDwtafK6OCJFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrca$000000" code="stt_rec_nv" order="ma_nv" type="Voucher" id="H01" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đăng ký ca làm việc cho nhân viên theo thời gian" e="Employee Working Shift Schedule by day"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2, bộ phận: %s1..." e="Date from %d1 to %d2, Department: %s1..."></subTitle>
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
    <field name="n32" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="32" e="32"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n33" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="33" e="33"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n34" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="34" e="34"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n35" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="35" e="35"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n36" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="36" e="36"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n37" width="50" hidden="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="37" e="37"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n38" width="50" hidden="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="38" e="38"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n39" width="50" hidden="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="39" e="39"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="n40" width="50" hidden="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="40" e="40"></header>
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
      <field name="n32"/>
      <field name="n33"/>
      <field name="n34"/>
      <field name="n35"/>
      <field name="n36"/>
      <field name="n37"/>
      <field name="n38"/>
      <field name="n39"/>
      <field name="n40"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZI8cXorka+A7vqMTYd4tXT1ImEiypmMvUhoHEY+6wdYiufb4ynlvYtUJc1OYDC5n8opBvivs9lUQNoIuSsHOeVudw4N0sy9wxA9cBV7zOu9aLKCwPSbkIJC5VzfzVnXfVbSel6reOizzoxTyGqmwXi4=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtU99vIh/InNg50FsfHqbpjUAld7HCg6uGi2icYQeCLwS8Bdc+/ARFEQvGDIMgKhBcogLE0dXHtTIoIGL+xkLEJrzEZNfy5fxS0KFQo6G0NBFg/5vgvJgwp5dmPg6VpA9pHX7KKIGNZOjf3CLcJxlvd61ppRMEwdcFps41IC2rTF5I6VTFNIY8Xqb2R6WYqGzSIldfLFV3EUU6gIeVx5XgrRsDYKFwHLXtOB6ft12nPWxqYwUUCYBJHTpLxhbIG+kzqgKB2DbRpHc/9RjLLV+ekzkzVCyGRUmuZ0858gdKKyESNacbxOZxWEa+35fAFHIuyZkrQEkwnmcGTyg1nZpPikLps3FuwVa/wkLLawHSBbIGtp7ShHVX6IClcMijEpdVqhC0ZERRjUZilMyOPwJPvWf6Zhtvxct/MRGFGKWprpuwnKhma9L1LQKtw6Ncm52jiUV4YzpODdE6EerlinfFnSy9zvFS+sVaFqcsjcQVJsiEdgow5fc8YvCsGD0bQxdI1IB2naoBWAU+vv7rt7oWltSIgax51oBPg7I+lq0gdNv0NpScwHQqSzvW4fcCNe/ekCa81C1/MKoT2L45isJVlKn6U0Tg68myKbHIhiBqZaGzeBV917BZTVkDxjO/RxripPDxTP/7ActRPeNIudN1eS9OMXLRsPC35BDAuhGx5xdHtb26FmWD03soJJ41XlYzWV4UkBpOxHolTMaI27kp930kxuTfWpR6dGtRtL09O2HXVre/70AOAtX+mxDbEERyqY8PhquRTYwBimZ3yMeEL0wP8xmE/teICuW5uK6D/IY9cfMXWXG3JH12tl4qMjAQjDC8se5XawsL8nNfpHBOhcyJO0Vfs+mxdkvg6nc+i9B+ObtI/syOXaBI1Kv2WGoh5gUYM4rxZnW43OGgCrzx3z2Br5XX8furTrbCr4Xeh6cuFPnG7eTf1Vk9UlRmYUAZZbcNcHWSQ1NOZO5yV6HYzCuCiwqhot4ik4rLKnwPGly23g9jSBp4GHa652sWuhhL+g++CO75Jffclw+vktD86XKcLXyWqjrKTs6zYz7m2h55xDcjJndWvxL9i91J10yGgeNKyGKfDLpeVKqHW6S9z2sQ/RbKVyM/YC9AvEV10IxSpKSNEcAx7ba+WMoQsV+zyijXa4afEcDBnEiP0V7M5xSQbtKVv9FtyRmrOsWD1qY4KUINn04Fg8j+ojpdTwmYu+BYDNfq/d8/1FxcP8WhkJPd+Fz5xj/0iiY4awUt/HR/ELf2L9DNoGT+lzat9ju+82Jy7m9SRlfgPFlSYAB8utVwdVvuFBcT97L5vLzGWdXWGStPH5vBe51V25tpL6Fwj8GC4GL5Aj209n4u8ybAPaf0P4goKeY9+1AVX2zI5cZyutQ8EpwtHoH2BA966Sncd9SFVhlaMzmC5OttC5qI+zTCgG3E8fCw0V86l5EXRloNHErL5s8ygo+9FpuUhTGzybIxKlSf4gdlG+rPUSj8xzPFA+EqPj1y82VJTydoaN3NSw9XPGKbrel8NCoH1VW5LGpqI0FSlkrxgmXuAQrfDtpEHvCd2VC5fWUw8SSiv3I1eKC/zxbrw8YU0SFYfP1MIupZo0C3SZj/q4+hN7LGEXSGodavhIVR7C9YMaAxjfkdxaE2sDp3mUebga2CLWnKeV0rm36gJKmIF3oMhKJSX2u63lur5k3vBdiG8Anlpk4nSE8ZhpeVf2Cw2vYfWHvNc6L0tRgoEwRwZjaFOAkF0HD4NiZ0B53f2kQJ2T1cMEvMYJ1L4/MeTm/K5OYcMVRKWTnjj4PkfdC5rk2eaD6b5ct3JSj1+ksOXMvM9oCCfn4</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS668g/FjT0b4Gz9mEPk/5J597eEwlEkzoXGO7gVbszy5eU0ZZmqYEzPHlzx6lA/K9Av+gj6q4fifo00PAyP39zLIuznmh2RzHA0hX2mZS58/16vi/1zZ6T5uFBIWgdm+wX7/REiCYkbshzvOjkjZ5QfuiiJqvnDy1vm6ZWdMwQeOycwMnnPmEnJcoJ5ZYv8gV3rVjlUspWuBJFZOzCGolorlwVCnR0HvbVIAoDehNt/5wAfFk+KLsezal6tYKH3UCgrr0xLJib195tXUXsqoOPvPM0iPJnE8Urh5J5Tr1SXk8Snr+rr64tOn0tFYYwdTn8nHSXZ/1tW//XcVGWRVG5TTlLAUWhv6hbeOFaOoBADXKcgBGwWZvjJNG5cVjx9ar1Fq3//TEWKVS9CB9A6rdQhqC+H6nVY9pDN0G5DgsQeJZGbxML7wMnE623y/eBB3xvm6GHxR/Rhb6S4sqm5Us75XESmMDI+oIrP0dQV8DIcv8gtBv0wsNsrioyCh7I9ya6xyNg406RVmywN3DmHdtwbVP1cOLZUGQ5yfOp+HEQdNIMLOwGOF5PtJdZbGuonqVk8CmEPl9AJQ4SWAWY8pSwCLiRiF2DcFGWhH8XDxbX1Ykjb5gd/qAv1Q9GVdePn0APNqmqQPDXpG9fd7mTi9U76WnAhNBnj5wUqUg/pCdwjh0Wg48JqTVTTOejWkCOgtPt+RN2URdyD87qJLudBogfXiIYBLyih1IRtsssDx/bf6B2a0PtycOosH4B0Gj4wSG/IFnZCa+C3pTViW/zKGGZaE15C4sHvncrJJit7dWEqXw6YjcC5CBVhmvofvGCgFy0zVUfihHwbKT1eZT2dDRUoMgh9nkCfvNIQOZcNDHbHKxNpF0PiX4o1zr3pIDivZJUkc=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLUEzkDLkMF4zmDlLJpmaFpKzbnpxQeRsBJnDR4XetPBoD0h9qKNgMv08jgxiG7jwD0sxfOH/htyq6jJW2Aoy8R+roYH2/eXBJJgk4ZhO8Wo8YWVaxBJxFDd/ACkN703huDjF8Yxhbr3xOKnmkvvuaW9FEv96eBYdv0ImV7iDzQd1iBfb7Tr31m8/WQS5076d1UbG0nW2LEfvb1+6QA4xTAZN6H8PaYplm42kEycEu8lFlQHDUggL+/SdZNWMK0Q55LkgqCxf7Y/ApzVn/oQ7XQCgC/UvqKjYxVFA68UqUToIC441KYfknDzUPQp4H6gsxD2x3BjRSBmTqaUL08Ove+osoio7W2y20BNwthlBdxXA=</Encrypted>]]>
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