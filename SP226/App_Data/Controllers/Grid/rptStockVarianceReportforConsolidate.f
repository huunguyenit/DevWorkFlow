<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kiểm tra đối chiếu số liệu" e="Stock Variance Report for Consolidate"></title>
  <subTitle v="Số yêu cầu: %s..." e="Voucher No.: %s..."></subTitle>
  <fields>
    <field name="stt_rec" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Vị trí" e="Location"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_lo" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Lô" e="Lot"></header>
    </field>

    <field name="ton_bd" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl ban đầu" e="Opening Stock"></header>
    </field>
    <field name="ton_ss" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl sổ sách" e="Book Q'ty"></header>
    </field>
    <field name="dvt_kk" width="50" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt kiểm kê" e="Counting UOM"></header>
    </field>
    <field name="sl_kk" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl kiểm kê" e="Stocktaking Q'ty"></header>
    </field>
    <field name="sl_qd" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl quy đổi" e="Conversion Q'ty"></header>
    </field>

    <field name="chenh_lech" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Chênh lệch" e="Variance"></header>
    </field>

    <field name="kk_lai" type="Boolean" width="60" filterSource="Tag">
      <header v="Kiểm lại" e="Recount"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJZKvmQI0R2WMMMmFOZYFZQU/Sjtq8RSfnKyygaHdGgVh</Encrypted>]]></clientScript>
    </field>
    <field name="isEnable" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
      <field name="ma_lo"/>
      <field name="ton_bd"/>
      <field name="ton_ss"/>
      <field name="dvt_kk"/>
      <field name="sl_kk"/>
      <field name="sl_qd"/>
      <field name="chenh_lech"/>
      <field name="kk_lai"/>
      <field name="isEnable"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFefDAXyBoU0Wk68TZM34/PbjlIrqh4xdhFn9GcqwP4IFCafOPBViBQVUbhJq7/bFSH6y65Ek89u5V2vPQKIv/2RZPQ6sUero/Lx/NLkmom/UQw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8gnji8jHeiq1j9U2o40jb3n6QaUZwpzm47bPXa66PHdgemK/3FqO5Ic8tS96U7du2hA9XDdf2dphE1KIc9GGxWHLfvzdXaYi/KNcpFSGcs01g==</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT7/nGume2F+EL1hbf/gfmF8mUFjCl8kLcw1RJTz1su/Jh8zgGy7H1/J0UyD/y34HwVk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtSoO1jm5cHGuRFque5Og2Gxxc7areRFdsSSeCeqilfctIsgx4A16X6rlQj3ulsXPYl4jMzGs5Urwz9M4Udh3QdFBPISd/T6GZptsmgA8GFa++DYzgVBUvRJVL9mWch5RoKL92geRXLDLjOReuF5q9gzBS1/ji/FxyqaxAcF+ZTRjUlItj/8nElRN+tNLOIDfoo86+hPqEfE0aAwnD9hkW+Z4fLxpvPJbWQgHLt405Q1ylwG9gF7IRl13jkiMok6d/qZkI+fsBPyzmHBVSw85stIzsBcNqFwlm1w2LMYQeZlwRUkc4Avzxxem4/uHHk+k/HOaH8+YuqboQnyDLzazQaEjEK/zT1F4df2amdPw4zOXBvYhSF5SjwBkc8iV5B0pFGJc3aCqRoTGmQ9/qQwQY5VMzhO0Eq/kw2MqsGHxoqxRt3881vmmfEEPOOQ/rHLEYpuymgVRV6rlDWP1Ko95wfpz0fPc5GuXVKFadpjuGYzQtOY3kssnoeWkjTxhAEy9WognXvykYIK4OVTYisymgAhre+0mgG/U+pdiryjZm22tmxA7L8Zp7POXO4Qot8aM4BmPldpAse5j7Tx8FSBoZOb45JbwLCxDWoLbxfhMEe55ADL3advNTosLXtWvjr/gjzKKNME6zYSrnOOaYF0DvMML6vVS2teRkVtr6czsK7bctR3GhhRPVMSAUY4lxIdvb9KTZibiQ3U3ZDJhyKtoGa1XNWXUrbNcYOCASZ50Cz/4UZJbNwlxb3fQU+boau1u8Kgtyu/nHD82cUu9ZJR2mSToXWo66/zGeSaA9760yB8I1fRZLeHpkEGAVdbfDiG0AoeHLbto/q20ndi2agLz8wxp3R7LwBPfTIsa9Z3qRwGaLtXd++/a3N9TYmBZgMBt8YkWgirGctV4eDrj9BqPZHZDk0Vndtcf9WSBj7NU/YYL04cgdt2KCzPArwlKkJj3SPKt9M+JcOCStP8aKxW1jb4ik95MNc99yK4DLWuJc/r3MORLhJTN4kjQDKgvmK/Igs1ikEb0TaR4zSO+Ptwm5s+zSoLTJp+qU6rs715uLe6Ijifa5qyoY6HBdxeggFvAbBIrY4o1NSEE/1NrbLysrQflIt3ivk4511kVtyJFS53rnQTBz0ewJ8cUI9BemOz9SLmXhBk/prGhdgwFAYIfQFrmf+KWOrFmFv0nqP8PKKJG4a/dyJsZ86sds7Sch4jC0ESDFGckYOuZWMqHXmV79QXx4JGRG3talLSTTxrVSjDpSLQokolVumDtCe2fSvJZzy3sLIs+Z/0tuypo2Q5i/MPo8a7st5pt+Pd07jzJqw9ILdnxVt7FeYV3Z5ey8MDVgZlUwgzRct/6HEn3myCsNRi1qrxJWPfSXhCfm5YVhLLAw5/Im6f5gGIUjP1ZsimIpasC5ksKxSSI35HByDu41yz5wSb9jxhVlnOvSCKBhsGWnbmS5zdkLG2yMfXbzsRwPmm7FcR0N21wlZWJkpXN1mAZJrL0j13hbzfnu8+FJhBJMFy0q6ThDTIQWWrTY/sQHXxAPXyIyK89w99gqFYkiuOuqNYoPXew/c7IvzfIqjD7Cn0E65enF9rJUDDU4TC9MJ3EzmD9xzmmXGwZZW48IVWwe03JkuoMUwjyaRMh897+mPBBz4RwhEbtoMb8ahZG8bLVcl7zFlcwd6kEP8NlsVAtcFB9GIKp4Od7QooXOhLr/Vw2qCmKux4DVNwYQDQ27+CtjsN5Wh7ilb5virMaWx2OQaA+Gak+a7trg6Eqnh4AV9XV4gURYT8QAibUYxbQUs69+oh/9XzNKodeNSn9sYaLSXXu88oI6U7HhgL9Zlz7QZU9qm2amcCjk8/eZeKs5l4u52kRJ9+Tqu4Db9sFNdEgkQ1Rxs4Esemcc5PMzLqatlaN7GRFZPRAHyOV/Oj+mN6cu2FIW2YuX3FzPh9mp3cJfJP6xazFkl4+OpTiGtiudFEl9Ppuyfa0S5wj/+F2uEJR2IPugihEWLdDAg7MgE/Jh8wjspcjc/Kg/mtFHHU9qKt3Kr5vOCemJzmjIixM5nxVuSw+XZ3psgdO5PjpdqkksgzblUYbMpVXe/Xqz4K6lQdoNHWWokYva78M+3BLiO5jOz0odnX44y6ukDSRSSpETQQ7NLLrVTKHENT9mz6cWwrLYJkgjGoCqTjX5roetghE+WvIjogtbnhIs620bJg=</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <response>
    <action id ="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDY5NtOubDbnKclmgLLot1lnBnAwl9PQMFqB6dn5WS0aHOYwOXdbtEXJ8X1DzzAHYI+Ykk7t/9PP+E6D/19n33R2lZdb1Ac51xXWgFoc4lYVJLeS4ARO/kHpso9Y0G5mNhEJy/tEiTIGEgsa0i4nF50ze8azLTHMG1Ly1KSbJmUUtzsecg11+NXeU7freAvRsrH4ErBH7p8/1WPMNhBg/tdoV3LVNczI8t8ZdKyTdOu22IKk5GBu3t2EwIfKwega6xPIhG1OmSmGV41XukI9cNnV6WaUAlJaJOgz/mVzeK3CdN0LmYfbdVLUWvRWHmKhJsd6yXfyVLnRLvjNuV6VdTIAA3PAVxzGTKP7rKXK8eTGRn5YH6M23VFzPGdGK3n5g8chFf5bNfnqrgRmIFj4q57rjiZeIcBvMc3WZguQvOhfwlQcaNEbPeExQmQ5HhKPgGEGv/T32TkFKRKtlroGcvbwBFSyRk6SekkF/c3wyvrmZtkXQAjxHhcA8jL+vvvbKLIOWA+vFl1QmCwurvfXoJs9oJ0HdgrBfxJeifikJMhXLd7gs0xRdC1jc8UBZbvRmAk5pHxeMPOEwfaILzGbzpQ1X/4TGcVGq3k75I4btyR7BUT0qFC/+Zr17c6AHa65Txkg8hvmbgEobGDw7NmZ6F9P2x/tt6ayBUPQPgW2dV/PX9Qir/ejsKrfBrMFre5Qx3eYSnOgQHHAE4Ykyyfc7KnPnu4/AjS0qsuWPce24XaczI1m/yCAlIuoSyYTjz7uXRHVNZ3XnHdXUrA9uVVhEUU</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwNJb7NU+Jv72TBsR/SB74QH6a//Flg9ThtbAxKXedJeJ88OOstDPP2iUxte5HWOgS5N0ocLtsUBsyksWya6czYAqcC4Ty1PsWfAbD7nx6BbdT5oP4PG1ywZeSpUtF0byH9Td8lM5B5epOtQZbwVaYUSs+ajXbFhF9g0UON721ZY</Encrypted>]]>
    </text>
  </css>
  <toolbar>
    <button command="Save">
      <title v="Lưu dữ liệu$$90" e="Save$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>