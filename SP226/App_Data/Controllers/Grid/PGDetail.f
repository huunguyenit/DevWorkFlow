<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PGGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY AutoLotForm "PGLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
]>

<grid table="d78$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PNG" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c78$000000" prime="d78$" inquiry="i78$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="status = '1'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &SiteField;

    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" aliasName="a" allowNulls="false">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="px_gia_dd" type="Boolean" width="50" defaultValue="0">
      <header v="Giá đích danh" e="Specific Cost"></header>
      <handle key="[gia_ton] != 3" field="gia_ton"/>
    </field>
    <field name="ma_nx" width="80" aliasName="a" allowNulls="false">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqNyM5e+K+001uXmlQsdSL1kAo6YZwlRBV9yRofKISY6aF2Y2g9wKbSulYMfro4K9k=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpxt" width="80" allowNulls="false" >
      <header v="Tk chi phí xuất thẳng" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpxt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpxt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0" >
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_dh" hidden="true" width="0" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" hidden="true" width="0" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" hidden="true" width="0" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" hidden="true" width="0" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="dh_so" width="80" inactivate="true" readOnly="true" align="right">
      <header v="Đơn hàng" e="Import Purchase Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="pn_so" width="80" inactivate="true" readOnly="true" align="right">
      <header v="Phiếu nhập" e="Purchase Receipt"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>

      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="so_luong"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="px_gia_dd"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_cpxt"/>
      <field name="ten_tk_cpxt%l"/>

      <field name="gia0"/>
      <field name="tien0"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>
      <field name="pn_so"/>
      <field name="pn_ln"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCOrDD9kOHJY6WWflw5LBHjCRXQ4GOtVObK3XAj2YHsUPvUMkFP4/CiUDAtZ4zUpU6k0eKkiI1c/lQm6QA8T3vKgWepmW/9Ht6bXn6wv8FfNJRkrk00DUurXlG+u870Hu99gShSOO4a+nxo/hwOhqka3MujISXx86httynATxFYwDjy/1Yr5VOFJc3gU/M6mI7Hvm8ooYrzTVjwdnNsH6NG58Coa2h2k+Oo9rGUH9spRH9TGtiX0b8jBPigRJPvNhUB9LtEEhpHUIPlbaWRQBg1g0y0++rdXpx4DAMNmG+wBIfJNSrNTZ24gh10K55s4AmapFWuLWHhZtfRUJM3ylFc+Iz3Gkdv0a7dupGI6URkgDNIrs8mY+/vQsxVlswIyyz73eEL7GtfLdX1dAnEl1m7ofYnShxqvRo3OpE3Su/FX/9lUZ5bPZv2PiPKlW8fnDBXhO/NAZk6+yF2kjUTBKVsi5qtvjE1twmB6lWn9IFYjpdU77cXx7q4+n8IoJvQ3FTMtnYJ3KFiPqfIIpzgX5ZMFm71rf808dN6PwNIUh5euXR+AbHk2whld/myZ5QpA30Qfv/halnUl3A+aNFm3Iq/kW8K74Oz3jenfBiSWUTTrE+axzNZ9TmRRHq6NDiyCuuUepJ6aISzx+czFiflp7Ism1Pt8Kq7KYyIXb89qof8T7pGM0zmJrze2L8eKsc7joGOfun8hxv1x0sGjgUKCK2xZxEkZ7VUgBtwlWLFT9u43W16p1gZbhvJL3/cQLacEsxlguI/KwoW3ezZKPPoT9FBbdos5TqsQCX2Kcb2Z1tpdGtJo9I5Y/Pgf0QoS7Zt8hdjryxbhNVRlq5o3PjSeSyo+jOAC4VkFKI6SX0xQnbdbdbLOcSoGOzVXrsT9KlLhbhleVQh4yXD9ivTUqQtkXrtwjJ0hYmLwXQ989NhW3mcVg==</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGquFNDqn7QPyNVX4Cdd+5jnKURhe3uxW1yYApBcTb03PEP9DIhputQN7Bx/vsVT8IOZzgU44qhkdkjj6vDAH58COE2oP9kf7Ver8VYEADuP3QM5zoM3kxB4Nys1JPvlfiLn3lSMgtYjwHaV43K0qYKmonPnBtcBU38Qu5+WNBk9/KtHAsEFVcEbpTirxqJpW+VfX0BpzuxWkOqGU2GJ+TdepR18GcaRmf5i+Khefhz2aFRZbiDBPU/CWFRxaQiAAKV7ozynqaVHJN3wAaKzf4cDyYHf2j3LpZ2DJjz7SVWvp6IBaxzpSXEci5TqiUji2pI8slmZaElysjNFKw9jpHMQqoWxwNUHULMrRdBFgLNKkKcXS5mo24LGyI7eatvqOw2/U1oOmYAqunNktyANy/JY0sinKTAxZTwRT81zYi4rmueB2nJSz56lkO+cumi9TFzcc+cyET4I+RMxJUz9w6Sc5qcw9zwuU/zcbgWyFe28PmxyhHqk2bWlg63bCMCubK6Gq489yA3xrEjRnf0dTz11Q==</Encrypted>]]>&AutoLotGrid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKuJ0FknDVln2sNxA9f0z23bZkf5uv7zLpBUDCFSf3Zqkwhm9cCcaz69DVAArpbAMy8vZbdj2wd2WwhDQx4EHuOD19gF4aphEEMKpJ04DzhN0AFE268fuGuQCBHQiyT3A2b1A/b1ILsV8ME82q6p5exiwUQ+RU126YKDipwJBhjTlKEdhfzLkObGlTHF6MEIijveS8NDzeANTXkpOS6a6GvMnt8ZDac1MnOW421H3ByjYGEgayptSak+uyWKrrkAtfswVfoMh/UArgMK9ybitYrhWM+O5OnkVwB3L8radPF+SMi7F6JgNxcKD7sO8AwgcBOqtudHMzSuWfn9rLRrSFAQneuRW6TK7ZZ66j8XgPmsHNSTFHoXvPSHxDF5vOG7Q4Y6Qtf0lzuz7xwkooClqC5/Mw6MtGargaL/FZLQRNI//yPOLXG7qb2IEPNnaI3fkNy+vP/1ddW8v9jSsBt5eM8FpPYydy/Cjtsgfxw3hlOawJi4mkXOr32ww6IMQJ2nkjovGGbi6/r85cWEf+AXWW9l34rMBRjrLZgR29eyGMYjR1AjJsXFfgDIP2FiFwPVqy4StBDcO9hBgNw163+fBVzh0Jr5c56HYiz5JRhA+G7JH</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;
    &XMLGetReason;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5JHe/YHrgOM2dUsMAnjUttSXJW9CKhzcEsLM+WTkk4ymGQmn0ybH14yuvf4cWzr68M8rG4cHuYcaX5GuvmJ0ZzWtDf4Jgr5h1eKIg3yHkUPi8=</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cLk1tzjI10xZsjnkvcez8b3</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e5g3wJw1x6BZ7s16MkJ7684oSnwgJ/gElVGb/q/FHcvQSayiA9zU/k6Fmzkezn8UTW+aBExJ9n2584pyBKjb8G0dt99rLOWPwcUazJzvj+bHA==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10" urlImage="../images/Menu/PurchaseOrder.png">
          <header v="Lấy số liệu từ đơn hàng" e="Extract Data from Purchase Order"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Lấy số liệu từ phiếu nhập" e="Extract Data from Receipt"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Lot">
      <title v="Cập nhật lô$$90" e="Lot Maintenance$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  &CssCreateLot;
</grid>