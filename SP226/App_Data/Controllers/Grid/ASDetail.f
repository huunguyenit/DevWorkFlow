<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\ASGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLTaxGridDetailFields SYSTEM "..\Include\XML\TaxGridDetailFields.txt">
  <!ENTITY XMLTaxGridBeginViews SYSTEM "..\Include\XML\TaxGridBeginViews.txt">
  <!ENTITY XMLTaxGridEndViews SYSTEM "..\Include\XML\TaxGridEndViews.txt">
  <!ENTITY XMLTaxGridDetailResponse SYSTEM "..\Include\XML\TaxGridDetailResponse.txt">

  <!ENTITY ScriptTaxGridDetailCheck SYSTEM "..\Include\Javascript\TaxGridDetailCheck.txt">
  <!ENTITY ScriptTaxGridDetailDeclareArray SYSTEM "..\Include\Javascript\TaxGridDetailDeclareArray.txt">
  <!ENTITY ScriptTaxGridDetailValid SYSTEM "..\Include\Javascript\TaxGridDetailValid.txt">
  <!ENTITY ScriptTaxGridDetailResponse SYSTEM "..\Include\Javascript\TaxGridDetailResponse.txt">
  <!ENTITY ScriptTaxGridDetailFunction SYSTEM "..\Include\Javascript\TaxGridDetailFunctions.txt">

  <!ENTITY ScriptTaxGridDetailAccountTypeRequest "AccountTypeTax">
  <!ENTITY TaxGridDetailInvoiceTypeTaxSupplier "">

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d32$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PN2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c32$000000" prime="d32$" inquiry="i32$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_no" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQr7q65ud0uonqe3IJGK8Eb9GWkFcfdQwLrja0ekgYrKJbyVBFmMV63oS4jGPzfEcgc=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>
    <field name="ma_kh_i" onDemand="true" width="80" allowNulls="true" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_i%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_i%l" readOnly="false" external="true" defaultValue="''" inactivate="true" width="300" aliasName="isnull(c.ten_kh, '')">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="dien_giai" clientDefault="Default" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLTaxGridDetailFields;

    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
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
      <field name="tk_no"/>
      <field name="ten_tk_no%l"/>
      <field name="ma_kh_i"/>
      <field name="ten_kh_i%l"/>
      <field name="tien_nt"/>
      <field name="dien_giai"/>

      &XMLTaxGridBeginViews;
      <field name="tien"/>
      &XMLTaxGridEndViews;
      <field name="tk_cn"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbPs3P9K5Y+XULO/oJbfc57BB1xGnusZZZlkvf/JskCbaz6VqXVVlG/IxWEuUNoazi</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC55SKKDzpM6nAJIR6M3DdlNMm8734gbnqrgAI5/KE2EfPUImyLjMjapVxspKpNEqeXkPehR8ICPiPEw+ItbSl0VMgvLnHZfUkw6E3SwQ59lgjpCKCR3Ep+b5iyiRzN7rqieroEciUaFmAEMNaJu8g5559VX4ZkXBFeA2OXKnw5B/tH2mXiJ+SeZByhMlU//4V</Encrypted>]]>&ScriptTaxGridDetailDeclareArray;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YJA74wLS4URNjbLtN9rGF/A6nMyQ21YPC80gWYnUzvfKQkLnKq6pQ3BANqeedk4ZIEOu7Ux7w7dS4zmsd++aSklnvtTDvGZblbRiXSY7nRs+Fpllk5PBeZ9MFlQmWBXOGM0cSCtxBBmRCpbgJ3DdLsm5Hhivi/tlQ245cNdHsqlqv6HpEO97WdFicDgBQhMDmDMvaerqXyJoTeuwKknzpg+GxdH/416+oe560pNdaPuZ9E1wG8B50jlr/ycJ99VLVac4oWZ7OVnKNirXV4UIbYsIaMtqWnmjH9pSDID2wLGpBajV2/8BigzqIvdYazYdvKF4xQM9h1oWvjB756G9/l64KAtciI58mWTRcCWtVe5w1G+BLy2ttCMdG8ICwmx5lJeQ5qwSEZL9L8Rbbzzdr5t+ahSo1a7u2aH19oehqt/RIy6USoJ3/yvyC/QIkX51lCb0vGtADiChpdw0d0lNRkDnLT7em2K0lKIHtjkWlh46h8SJTFpg0jz0UdSJe1Pn3Vz7rIbvR+4iaAvDWUGTe+UtSSQLXXiFbaPYyWcC+IBlzWtpSs0/L01QVke/7k3gtK/zQ0jpuKUXtkSvdgSWo4=</Encrypted>]]>&ScriptTaxGridDetailValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmboxd+mIxZOHQ7J1LJG+JAKfb5IByqe3d3K92Sj3OTukLMJxjMdD7i0IKzusM3MDOJsb4OKL+tqm0qiitDZA/METDp2RM2LamfnfZZZ2pLhKr6d4pYeiQd3KpsQ6B1+gLskgWraG63CD3Onb8Kd6zB8IwMBbyNJaMx72kvR7vEKZ41GescO2tFkKSMYU3Xai97UTZBktKcxYxN5hY4wAI00OcPJ+ozVbCDsJKAJ26EdsTcJ60PIOLK6EDpZgL99JoZAV7A62W13vgWSVV+8VXm4GowKtLjsLVU5ZCPnxO3rPOyTQudr1pqgng5xDD21blA=</Encrypted>]]>&ScriptTaxGridDetailCheck;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dSjo0Daom/kB1u9+2bw9MjiePCIDM91zA6VqODqW7KShp8uZ52Pf8iSHa26ITc7giveBLoeMIF6ZIL2hvpEpUDx8++0bplrY1e/7TOyFg6kX6caaQHEuLX9T4BOODQSAHGaLEZHPOpNS5E0ohYZaz+ldJ7TQavQpONkKI7Tm/pF2ffeoyh1tn+MwukyCimT5Of0THv2iVsF2WM8/tXaoSpsyKV2LegcYiX/jR4LiKDxAIIIZ83imA7oN0q5fEaFr4Nl5pRnR99m1NX1t6mdx+3h20A8Z06k5xz9ODR+xUVI327+G8GnEw73KB3NxMFVCOIyvWu8nMiOtYwzi9Csq0WGglZNeL0jlCughW+GhjUMaAmBkeHSb26YhRx9TDzSXFHhW2Bn5hOAURkf1pWGY8xWezeaZAUbTRaZ+x917IjuCwXeWjaBGV/pFKCht6ovL02eVP954Dgzs8nNJi9frbbQ6uBSV2I+ZwBgWBt0OjIBWO9n0PWFUIQFMCnt+gXMxdc9Hv2uIN0JaTfmfitSh0LLyrbNm7+kVL5tGa/o3WPg</Encrypted>]]>&ScriptTaxGridDetailResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmav/95C5tG8XWR0bIhZZlBLnzYFy7olPVY4NugR6I6rRg==</Encrypted>]]>&ScriptTaxGridDetailFunction;
    </text>
  </script>

  <response>
    <action id="GetAccountType">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcT4UG3My/C3BdnAahdfYvQZYh4UARMD/3c+6/6FTQ6pDfbbr4uoHFd8+nASXZISEbHSZ3iVLfTW/8IB3am6gECA==</Encrypted>]]>
      </text>
    </action>

    &XMLTaxGridDetailResponse;
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Esv159aSrxY/X5+6fN28dZknDRKGWaMUFSLKR6Uyi0QOu1vRqh+hiKS1TUvvnD6LjhASK4D24Vp87OTTqHcoIW5oSnJ0N/S0rCuwAdM7/ybJbDXGdAcWgadfnMB91qsaKfc=</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;

</grid>