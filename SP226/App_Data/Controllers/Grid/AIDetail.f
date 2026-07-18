<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\AIGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % DetailTaxAITran SYSTEM "..\Include\XML\DetailTaxAITran.ent">
  %DetailTaxAITran;
]>

<grid table="cthddc" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD5" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cthddc" prime="cthddc" inquiry="ihddc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="dien_giai" width="300" allowNulls="false">
      <header v="Tên hàng hóa, dịch vụ" e="Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    &DetailTaxFields;

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="dien_giai"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>

      &DetailTaxViewFC;

      <field name="gia"/>
      <field name="tien2"/>
      <field name="ck"/>

      &DetailTaxViewBC;

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANP+pl12wcpq/b05VIXZBplJ6RKGQ/i10U6VIkxiyGbBSP8+c+XYPM64Cxku4oV04FWyhD4ufyzHGiT37R6lbJEA==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&DetailTaxGridScattering;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC55SKKDzpM6nAJIR6M3DdlNMm8734gbnqrgAI5/KE2EfPUImyLjMjapVxspKpNEqeXkPehR8ICPiPEw+ItbSl0VMgvLnHZfUkw6E3SwQ59lgRg5L74z9jWHgP/FXSJWIMfmN/yin0PYe1o4WiGPccUGR6igMXx3jBh/hhiDM0v9nH/zRzIAIZAlsP8m3VjpbEq2Ew/PARqdAJrlMdL6nmx48Oz5wpSh/4j/TnNtXKvhAXusyWxdZIS2hHkV5g0MWksOcWkvXzaY6K4Jh2VVE/G6BG+l7BnwO20i0hyUjVkUN4+0dhg29pH2P75+EqBi3LNimNONlOQ9kctVbtvUMBJA==</Encrypted>]]>&DetailTaxFomula;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKuFeHW1vCzjYbbdxHCNbh+/Q1m7Gifp2UWvYusJu5M6Ea+nvuqFqj1FpLLE7tRl+K4x/2hnCVrTPITAXI2gxRqkuiU9O8KSR0luefcfVRaJDHg2qUIUbkJpls0x+hIIADy5PNxpBCRCtefjTqezscc1CWRVra2l+qyFEpheDzsCNB59MVpLrAttZb8P66ccwRjop3B38sVPNTOO6AcsYNHjlpZS7uw3GatZv73wh/CKtZe4trwvHKh08nLavUMk8mAFwEaoagUYGi24GrX1dRL3i/oY8WXiZMqid5vUmMZnaIBunVEZqfnZ+129X8uqBf9nc8jBkZrBeHBfz4o4cbD61b1iMe38f22CbpPZKIVPjHxJID5jP05pmhTx3ueuTEur0A3IX3vQ7aE+B8OPBsPIHcCP5ToKymwt91OlEdoZA6xixpb8JSFES3KcK4HyeBxHynHhDe1VPlyMVHb+c+kawq19Ttf4pbydB/9P3BK+qGWwL8ocmlVGgqiwzQ+YI6LfdB76WWSakTQftVzNTlHIwGxA1kQAFcivLM1tMPwANpeSEey8UNZYwHgmOf91nfWxoYj9l9J4A5DN8AEwxEYwtzBhosyltBPYWh0Dj0qaSix7kIubEEqTI2bMJ3KZw4b7Ic0vcj/5dK+8gzCm/rhkseWeikwDsSKoUEgdLEgl9aTDVosjA3P4FVXs2HvynTnk2BZkqwWk+wFV9kDlX0kmCH9j0DD54afEa461mLC</Encrypted>]]>&DetailTaxValidSalesPrice;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4a6Qr/64mTKl+bHk93z213QaWHMO4Wb6y6e5T+/0iJePVgkGOiqRPBfnsrqdiQUsmOkJUYiiNjaIDHFeDiAh4wAbNGe93c5bL7KSA+lBc9GUt0JHNYFIsvjUO0i1xjzVTg==</Encrypted>]]>&DetailTaxValidSalesAmount;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4c05nqWZa7HyIPmiOZRiYKnro2J7qciLambqJPRMNph0X9Q3WIsOxKhpx8kxXxgXxkxd5UI4+uRvbId3n647nzz5h2uKxOvpNVDyZcbdKtnXHBB8R6gbnoqmLtIUuzvmehYjSh2mPTY2HJ7/7XcZtMrgRzt6zY+vJQ0ezcXAXGRG</Encrypted>]]>&DetailTaxValidDiscount;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&DetailTaxOnchange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmboxd+mIxZOHQ7J1LJG+JAKfb5IByqe3d3K92Sj3OTukLMJxjMdD7i0IKzusM3MDOJsb4OKL+tqm0qiitDZA/METDp2RM2LamfnfZZZ2pLhKr6d4pYeiQd3KpsQ6B1+gLskgWraG63CD3Onb8Kd6zB8IwMBbyNJaMx72kvR7vEKZ41GescO2tFkKSMYU3Xai97UTZBktKcxYxN5hY4wAI00M0WxKgNAMMV4MAjAWdRBOxQvuqvfidxmLZwtOJLTOds=</Encrypted>]]>&DetailTaxGridAfterInsertRow;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKPZ5xWuze8ptVn0CDjmp1HdP0dOWOrmlXrYwfkTEIvI7Cu7U7FLQKHtZusyHDZlxMJKLpW9qlhvQaVHyNE1YhN/03iD4lVlquHwqdnJVuDmXBscEbIFBoDQPs+YDbOm46a5BfN+A24m4I4/h+9/mypDYzHyM8Hdg77/zpt1KPM</Encrypted>]]>&DetailTaxExecuteCommandCheckAuthority;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vy7q44igjOBa39qMgr+zWt6fmliGloill/EAbTLmlrGSBfVqyReflzMQx2zbGnb/AfErGJr8crYD31wnd5busJiU9LTXDtBOAzISAl64gec99j0DbxZNCBQLTqhy9j0gosozdRWC/195B9nasWPXoLxiUsRHKoJksLfzktqqdKfuEk8RbtVD0fjscvmMz6Bd8Fje6lwQFmL4XxlhRC6WJy2cyGH6ApApyavYnNOXS7UkA==</Encrypted>]]>&DetailTaxResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmboxd+mIxZOHQ7J1LJG+JAKfb5IByqe3d3K92Sj3OTukL6Od9CBUPtyowL7+AOau6CvRh7dCitG21UTe2Z47KIwY9C82hezeHMICSJatjgikg==</Encrypted>]]>&DetailTaxValidRowChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XhBfzIXfAYf3sbhatzJUfVEqcjm441KqUyB7Xlq6f8OH2BWEc79kHGOEsxiev3DY5FBeoIU+FACoLQkh6MxdCukQwWrX+rQ1V03OJjcGEg5</Encrypted>]]>&DetailTaxValidTaxChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XhBfzIXfAYf3sbhatzJUfU55a8DwqlmSdC5Gb9G8YosYSAWNCcv/352Nxrp1WIAdLqPS2iM3rTE7WvpZNa7iiIiwBoSPOzn2r4lDBd8SgP8J11sdrizRaS7KgY+e0j6SN5HNzLiW/rMhamIUIGj/wgduz0W5Gow0VL+hcgUP23I</Encrypted>]]>
    </text>
  </script>

  <response>
    &DetailTaxGetTaxRate;
    &DetailTaxGetTaxAccount;
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1e4g0R/mS3tWwDwTZBPF4eXdfkEcc9SuoMqSeeLkv4tc=</Encrypted>]]>&GridDetailQueryLoadingJoin;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNLeWL1tFO9gIOfVQTfzRLMk4eylVj8iq6U6X12CXu3PfPVOSBt7kOFsG7o5L3/JvmA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;

</grid>