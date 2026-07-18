<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\ARGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
  <!ENTITY % ValidFormula SYSTEM "..\Include\ValidFormula.ent">
  %ValidFormula;
]>

<grid table="d21$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c21$000000" prime="d21$" inquiry="i21$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_dt" width="100" allowNulls="false" aliasName="a">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên tài khoản" e="Account Description"></header>
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

    <field name="tl_ck" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50">
      <header v="Tỷ lệ chiết khấu (%)" e="Discount Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_ck" width="80" aliasName="a">
      <header v="Tk chiết khấu" e="Discount Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ck%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ck_nt] != 0" field="ck_nt"/>
    </field>
    <field name="ten_tk_ck%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ma_thue" width="80" allowNulls="false">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7w4AFWAwQS26yo9pzYuhzkghzgz1yWWvv4ZnV/zjKFYik=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="50">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
    <field name="tk_thue" width="80" allowNulls="false">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7wQRIre2G6m8lJCLlDdwFkV/yU5bq4Taj04OwGRPhyeog=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh2" width="80" onDemand="true">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <handle key="[tk_cn]"/>
    </field>
    <field name="tk_cn" type="Decimal"  readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0" aliasName="c">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai" width="300" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
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
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

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
      <field name="tk_dt"/>
      <field name="ten_tk%l"/>

      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt2"/>

      <field name="tl_ck"/>
      <field name="ck_nt"/>
      <field name="tk_ck"/>
      <field name="ten_tk_ck%l"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>
      <field name="ten_tk_thue%l"/>
      <field name="thue_nt"/>
      <field name="ma_kh2"/>

      <field name="dien_giai"/>
      <field name="tk_cn"/>
      <field name="ten_kh%l"/>
      <field name="gia"/>
      <field name="tien2"/>

      <field name="ck"/>
      <field name="thue"/>

      &XMLUserDefinedViews;

      <field name="ten_thue%l"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1++DOikvGRLi64+GfSz1j4wRhjy08Csm+mEvX8yk4rer8GGgqVuSycAKuHOwvHqNrea5S5H5CdHW5+RIJ5BzTTPAtM5/ufDAl7Zk8s3mE+NurJ87sxlDtcYMnPb+5rest+Omug1dV5eIE3RD7R2SsRWOWV9BRmvsNi+xBemLAWe72MHakQC70kyk8eayOD0dc5wYr6d+wNFKudvLbEJ/jfcdDG8fZXFbDj67JBAV2yqAs23o50xhPOUp6r0o6ir7kTIIl5nrTBdp/v1n0n+UncGzsyGlirlSAnJZ6RlYjYqnvrZlcvjqyrBWFfQCaPhvA1a6f+NhZSG7Xir1TUT54OBcI7t0ED52TfzORr4f5M3VdSExVX25vmzJBdYUdgBYj79Ld7rTq7voeU0yn9qTvnTnTtct6JAyV37ZRXs0/pbY8FVXDtMNzGxMJvmnEM+zvgzLJffMk1C5i8rp+yQGV8=</Encrypted>]]>&AmountFormula;<![CDATA[<Encrypted>&ANHEiKqthwbsi+Na3F+vkpgaVPUoFEx+EMnecxuCia1Uq+oOVsHT89rSC5hHspC8</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/ghczbVOBPRwf1LYd+9YtJQHUieW+tEy684JH2Jeoh+wAlkGtb/hPuebcl1oNCq33Zb0g2EAqUE5R6pAjLXE/CmMsHlwhF8Q3AGgC0hPsRVJMhpYDQzcd4dxRxOFWlojA==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetTaxRate;

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcelMjUXjbsN66gI6cf7w0AxNedibGxE/xHU+oo5RmSTxzFygLBjuVkDfVn7wIxz3sGcSjzh8S3crd0maZFYO2Og==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Ess6uZqH5tqFp4r6d1NWOH1+ZH2aXSD7DgpPonAku3GBnf6lT1vx4Pw7wuRCesFFZG31yjo5TDKBHMdZ7hhi2JD9uO5QfTndnECQHAR5aeNe3A==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;

</grid>