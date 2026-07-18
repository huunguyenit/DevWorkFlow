<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xóa đăng ký ca của nhân viên đã nghỉ" e="Delete shift schedule of the leaved employees"></title>

  <fields>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" hidden="true" readOnly="true">
      <header v="Nghỉ trước ngày" e="Leaved before date"></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
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
      <item value="1100111: [tu_ngay].Label, [tu_ngay], [bp_ref], [bac_ql], [den_ngay]"/>
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ayAV92tiSayqPXdlHU4Z/5DkJT7c/Sb0IifYhl6lDerm+T+UndhaF12P4rO22K95MaV/kZyQvBp/37LGYctzCvtJk6KE4MbRXD1BH9jFJm6Mp5KXCZmxDlU5NZ/TeJQg2aWlrIX0eLH7gHDYBZXBLk=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTO9Z9cP03VVVDev5S4sgb0l5P3mkkWHG3gNeKgm5NAGzZmhTk38DUf8HoG9XdKqA0GffYTgM+DlnoBVs3k9SLvhUH7rgiYqqBs361YUNPkoZWmspcKfLmcEyZBcxl62QYcYt4j5owB+isx2vPCPMR5qHWZHQ+iQHo8PlEKkETTLMqkWb3rXrv1o0KERFrTgRcUOF83Ts7fJxdJ/UmQM8ccp+RkKuSFcMumX7dfwySJj3LqDbR5lZEXTyFLphkpGkUhueLwWIcYxLQDpIgHZR38dbbqzHUeWKhEgfm7Q2Sx3f1o70w8/JlBsWNUqeauPxkvwbPUhQQc/GE5NS7M3U5+ecqR2BaUCnLBy4vCfl9Xf24ixi4d8ZeF2HMrlEEmsvq7OuM8mPw12VZaO8T5XaDume4pMvM7xv+3jB6rYsFEb</Encrypted>]]>
    </text>
  </script>
</dir>