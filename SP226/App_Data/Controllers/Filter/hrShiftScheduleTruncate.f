<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xóa đăng ký ca của nhân viên đã nghỉ" e="Delete shift schedule of the leaved employees"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Nghỉ trước ngày" e="Leaved before date"></header>
    </field>

    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Kiểu xóa" e="Type"></header>
      <footer v="1 - Chỉ nhân viên chưa đăng ký ca, 2 - Tất cả" e="1 - Only employees was not declared, 2 - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="thang" type="Decimal" dataFormatString="#0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="employeeID" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0, 0, 0"/>
      <item value="11001111: [tu_ngay].Label, [tu_ngay], [thang], [nam], [bp_ref], [bac_ql]"/>
      <item value="111000111: [type].Label, [type], [type].Description, [ma_bp], [ma_nv], [ma_vtr]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOBGQxplIskMPgOhB8uEIXhpr0vM1Qu3XTy/zdRf0d3xcvM1sZgbE6palfUfBfTfSHXEr+LLzsLIEcbFoNDflwBEwf/QCmmbDoecjtYX+KP3</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUMGaUb9sqzhcvJsBEUvrgYwp+gjnnmtyMzxWVwGVvmMYmAkPCOQH5u5R9OHfYfCSNlwVn5CD787sa78bSODqlx2pJXPI9VyxzxGODvpc1n</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMt1oHfmSZ/Mwp4FHr/BqIzDXiKkA6uivQfWyGAHqk0x+xIJK86DuRPSppBsufjIFeb65YQSw0QyLy9GvHK14OftcYuYR+TmPXcQZOi460KK</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzHmZvj0M7cS1JXRwu4wt3S64R/YR2j+30eLYBm234faBXRlHrWMyqvFpMXM7NNKs+y6pI1Hp0lyGP6larE3yQWU7Htyo3SJV+4SGJ5vKtjDmzBZJ+UmhY6DqLn8BxzmpRDKbH6tM8st1AhQhtOZ+lRpJaesu96B3so6EPYR13CO8lUmAF9z9DQhwFalT2Kc/yqonEgtLtWXPD0xRJhMeMtCGUVzdkE5LXo9IF3tONqx54Sk8NM5mCczBD4Mboit/g==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTO9Z9cP03VVVDev5S4sgb0l5P3mkkWHG3gNeKgm5NAGzZmhTk38DUf8HoG9XdKqA0GffYTgM+DlnoBVs3k9SLvhUH7rgiYqqBs361YUNPkoZWmspcKfLmcEyZBcxl62QYcYt4j5owB+isx2vPCPMR5qHWZHQ+iQHo8PlEKkETTLMqkWb3rXrv1o0KERFrTgRcedjONceUwP2GwZcUYvF80GFPnfq46GtL42QCHrI44A7M+gKGU93xum1x6fW8CwG3hxpjWyGTzYeDBrmlHi/ior5wOa5bcmyjb9eZyoP6dwCotqRVIrzLMXwN2uVjfpz9x/EYjZbBYd+u5BthmBmlxwFWnr0Vkp7b+WhAgm/+OKUunI5qOJQealXqKVGt+kWNJDIEbsFfHahiJV0D5AyBzZ8ZL9cnrLVFauZLOwUsMUeEGbXTXwXBGKWsZNx0CxRP73GJwfxxAH4Ulv439PAGE=</Encrypted>]]>
    </text>
  </script>
</dir>