<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY UnitTag "dmtk">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;
  <!ENTITY k "tk">
  <!ENTITY Tag "vdmcltg">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdmcltg" code="stt_rec" order="stt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bút toán chênh lệch tỷ giá" e="Exchange Rate Transaction"></title>
  <subTitle v="Kỳ %s1 năm %s2, mã nt %s3 - tỷ giá %s4." e="Period %s1 year %s2, currency code %s3 - exchange rate %s4."></subTitle>
  <partition table="vdmcltg" prime="vdmcltg" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="100" allowFilter="&GridListAllowFilter.Number;" align="right" readOnly="true">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="ten_bt" isPrimaryKey="true" width="300" allowFilter="true" readOnly="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" width="100" allowFilter="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_cltg" width="120" allowSorting="true" allowFilter="true">
      <header v="Tk chênh lệch" e="Difference Acct."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk"/>
      <field name="tk_cltg"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/LoBZviloreISoXiuNrsxnQxz1nixKWWZTMuX0kWwFNf3r7XNPX9TByWwLXAuvs0A==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrbLgAPGaCuzvBahu528iCkDAfn5m2M2SeBXHdQL9cgSizGMKFNDGi7kk3OPlHt8YFcs9h9ByoJSgqur3fhcrkxb+tCySJzafwR6tlcEQv5waLUilmz0w3cP0eqGJQRitZflCNl8+LWbA1ZIP3PWv9euEkvSMl0nn35nvKhh883QHrPjrJVPJiVIxrFCqwE85a8XHOeHodLb7uPJconQbX3xqHJTAspxRjX1nK4/AtpWGn2fjqWIXnvsV0xKXH8RGrD7Lyzl+Wawnqqmi6JEieNom0EoSDGlfQgHPBOhK9KK9O/YCuDvApBiir4ZPIBf1wcn4d8Q5O6OS+ZlkIlRUtkCt9Oag83ReLheau9P6vTgjLSgnndR4vf5qQurYcs9yj82/XWwx7w2DShlLMBuDXlAjkW9bn/JwT3HyoLWPaq2kY4UcLo2U3GoyGizfsLngz2XTm6CjsN+m6q0zf34wFS6UiXSzUeERRToIk9/iGZRZzosyBQhAsnIq5zHJvc2aZT4BU8ERB5iHi7xkYLZcsGVvvMkT64WAs5STsOvh3yvq7un1buProco4joDGc8Q3NOM6gLyTJiWMSEXGqcPV0SIKOpnbMqZbr3qWfJ7KbQhgfPX/AivBkI5zIidJV2rd3kPQe/a4akrgm5z9YG3qpQQ/cOD+A2+jyswC9SFiSZSRWmAICuFvgw6AG94btRzJ8WYQs/Owx65DGiGMioZtBQNGsBGpp+Flz4TGZsT4TxOejeHx48NZ6JfTVP4qCUkJYUst2qxoxMx94SJslUVlzOl78ZTIw7wSAFv7Twj9WcQrGQblSC5TSECeN8vZEVuD+E6A1W3cujlLHDIPSfsu9XZXnjFhuJquU0tWNCe9idGjU7Ze0AH/j5K8U+K7ynmx+jU+qFO20Cm0ijUBNqb75aEGBY0LGndfNe0dV1U2liBm5ZCh/HK7hYIoqj2ffPZwodvk6cPom7jTKaXxDTiFi9</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <response>

    <action id="Create">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7vdilncsbmngdIp676sv4vs23PJxxTj7tDp/xHJJeAaS8kSM+lmmUS4tFcdgiRqJmGkiKYEe005wor2sI+Gq4IwGnxfcxv0wu3FIwblm7uvHub9dG7Nxgwxo5d7G5IRpQMQaGy2PD80/Kx0gusSuKOo1tmpOuNP7ZJdRfM5OX3Uo0NS7jSlfbm7peNsmck54NVQmJX22pgJLk8QFmy//7yHI8J1iHQxFoBxwwGhbIFUJZuaaAlEGRVv2yiMqiCQW+wTE/z1cAGVVbFIvYj6WXI=</Encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7vdilncsbmngdIp676sv4tV4CHS6DyLK0r6sjid8en5ubq5XXWLxrl6hckHc1rQMA+cfPJ3o/LtQnydQhjEn6Cwxn9226ovVgzHAYqNOJmR+K1my0m92brjfOfbDZxEbofAHtAMVpjmKyXediW2Hy96S/uQRCNOR0RoUsJwyF9Jm6Eo5KQ147Lam6gEK1yqzboZse5uegSkHTLExw3fZvwrUbWDol6KtIzTCstpOwzidCbZyiS7Rs5rWXdQZ0IDPndrQHfaH7J/d+QqfrVnBXo=</Encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0yDnd20gomSbR9AbNlOnx4X9dVo5CpDKAbfgm/+/sYw3sNOztloOZNr7WCmK8/IyEbCPhQ5UL7PVU1QuN/CUKnzr6LoqPKC2zIjH7SHZv9JMqB7+TPKXwieGTsrT0nJLSjT8qnmWitjK/KtNhtJ0ZcGbWGWrU/FebLHjINmX11KrpnG0KUEyBPVMrN1q5ehV0xX4dQ7gLixS4zkA+8W/olcPquApPDVyCbw6rXVCpJP</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Create">
      <title v="Tạo bút toán$$120" e="Create$"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa bút toán$$120" e="Delete$"></title>
    </button>

    <button command="Search">
      <title v="Chọn kỳ$Chọn..." e="Filter$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>