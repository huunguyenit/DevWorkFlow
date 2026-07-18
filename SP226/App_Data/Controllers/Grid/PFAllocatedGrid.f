<?xml version="1.0" encoding="utf-8"?>

<grid table="d73$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="d73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>

    <field name="cp_vc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="100" width="100" allowContain="true">
      <header v="Chi phí vận chuyển nt" e="FC Freight Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_bh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="100" width="100" allowContain="true">
      <header v="Chi phí bảo hiểm nt" e="FC Insurance Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="100" width="100" allowContain="true">
      <header v="Chi phí khác nt" e="FC Other Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true">
      <header v="Chi phí nt" e="FC Charges"></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_vc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chi phí vận chuyển" e="Freight Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_bh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chi phí bảo hiểm" e="Insurance Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_khac" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chi phí khác" e="Other Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>

    <field name="volume" type="Int32" dataFormatString ="@quantityViewFormat" clientDefault="0" width="100" readOnly="true" aliasName="b">
      <header v="Thể tích" e="Volume"></header>
      <items style="Numeric"/>
    </field>
    <field name="weight" type="Int32" dataFormatString ="@quantityViewFormat" clientDefault="0" width="100" readOnly="true" aliasName="b">
      <header v="Khối lượng" e="Weight"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="cp_vc_nt"/>
      <field name="cp_vc"/>

      <field name="cp_bh_nt"/>
      <field name="cp_bh"/>

      <field name="cp_khac_nt"/>
      <field name="cp_khac"/>

      <field name="cp_nt"/>
      <field name="cp"/>

      <field name="volume"/>
      <field name="weight"/>
      <field name="so_luong"/>
      <field name="tien3"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEI8RwOHjHfCBPwVMpD7n/QgfuwjgOCPxXV3labG6+dl9jvTvA5Mhb4KAMBRbQHUqFkoJ+GogzWWZ4WNj4zLLsU=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKVW4PsnArkaeRQzbBA/jyl3AFxoL1BlixukkAFvOTnIcDqqij32Kv1hK2mPVLS/cYk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtaflSO3wxV4lM2KUJWyCrb+9f4aMphoRAG+ozU/zY3eiCe6VNDxkNoh5/uILdFnuS8qvY5+zkZL951lA1kSB+8+5PMW6H9MQB0diC87Bnbj/OCg3BMRGqVeYvJ4GDWf0g2yaOVK9KXijWHhP9NqaGXmNDvorrihpMXOW3NuCkeyFV4yJgt50Cp9NOQGGRFEneLq3wZBsII8AXBxb/1b7Dm8X09Xi/EMGUgICX8MC+ejTrgE5O74aX1FnkvvmhQhVXB1ubOPg2adMKf3/JBX8d7zxUtNQ9SX3EahXeGJoRKeqTdYZ/4bHHS05gPNpAB+T+38eUyAAUiD+646GaJv/Ex2YdN3CxMwHLC+TcuIKIhImCMbLUa+qFIPk2abcgehMgtS26fELaW7zx7LUexicMtDTK0tMtyUcg7/NM7RqyxLPqc9vIxZ8EvAFgyaMiTxGOttuI3cyLc/goNJB3DtGZVW7i37itpa01nGeDef+5b3Meuk1SlRbv/zwxlvzYj82FPGSGT0Fpfj7p4NkE/pPPUBizGOJaYBtuVKfxUFDoLTaWTNLYUOxjnBEJznrBl+PqnqcXhr31I6fjYAZx/SZpdOCdrZs5KDLj2VpnUguBY5UyGK6iEM+70SPn3xeUfqZkdFr1q8MpUTDW2YKUIpMeliUnFq9RWOJG7UR4YwdokqFvSoR7cGrItd5RprRs34GK+wKbNiO/yrUO/8jQmHviaahzHWY29S8R1Zo9rztHwQ8NSdhRlkneh7OOxFHO7jX9UcJ6SCuhL8cTh7tABujCxmpFjEumXcqJYnrDU4zBpHUsNr8EpG7Owfu6IL3royT5TacTFYKLPCSIHkG4tvcONqwlntEBEt0ud9brTpanGUa+h5Tb/Bi0CiuD23289jVZxT7xgIUSMkVx6DARfuyZ3cpq4dUAxlx7rNieBy5eeyv</Encrypted>]]>
    </text>
  </script>


  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF7GuEGLaBKkxqo3N+afAKCuozrWUB+cKxln/EWZnex2bJln7treNOpbqijCJxBcPmOmQPLufefoQAZJrDNBjZfpdaJ/03Cgi3JVvmIV0Y2WqdU/us0mbEQ3yIFUunXybQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>