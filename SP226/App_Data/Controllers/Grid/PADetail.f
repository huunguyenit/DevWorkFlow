<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PAGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
]>

<grid table="d83$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PNE" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="m83$000000" prime="d83$000000" inquiry="i83$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
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
    <field name="ma_lo" width="80">
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
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk vật tư" e="Inventory Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
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
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCtb9YJrExnX+33mIFfqU1QHX3oIxjSSEKwiBdpVVAEmg7/Zel2N+9lQEBfos/3/HXK4wTHhe239cmPfXozWf/XgJFLZISVLbqIcdaVbndVZd5Tg6J5JNHW5RMfc9JaFgLbvieipA9xKvqvppOsVMiTcJ1FgtXC94trbVVAx04PcM8LcFsH7xvo8UzzGi4j523DAb18ChPHjHbvzGQY5mBPERkWerf3XMwJ3RJVtxT+j0Fz1KxNM0hPyG3IZSS/yDX02TTZv/7KuRw43HkHDsUH/NKTxDhgvr3NaJlMc6wJlqLBRDseHXS47IGnaY40PpFQrwEOl8h0Vl+yyQS6mOpp9EzTpgG3xuym1ZmbjvLyb/H1E2GHlf7YEPwrKaEiKjYZ+2FCZ2yOdfZ2Gs+6yPMnYjr2eCBhG66BOjIbxQrAvkUuz83FkDacRB83NP5qlseJUnXmh3MJipSrztXHkaYvJADiPj0KOEzoFs+m+ok2/lwfyaUdOQszGkPXuze/VC3CEiIKTG8JO4HLiw3ucBhuAR91mbVTJOpXzgAq7Zy8GB6ms262YmiPuBlfK6OxEfMdGei7pbiFhMCn5fyMP3ZDpOxphjy2GOvFFaQA+fMPz92s3OdOjnI+WND316cyD5HS4bVoQPKfyR750HZSZUkjzMJxgfWgv/2+qOxKpLRH6xn12vI716Y8ACq/WiSa+WHo9OD09vLriLl9CGOAp2X4+Zcnjp7WWsmtdc3QYWBxSriOn2cgmBR1KEQuMLhJysoeHv+9W0S5BEou5J8vvaiblTBZsw65q4jYR6fyLsdqEygRX3+szgB285X34zKqABdeLWyLXdTB8xffON7srb/pwGT/tTH34cRLMIoDLHqf5jxQbyYlU1iJmZ24nPamBTE=</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGqMnErfZUziPIhjKTahXBCH6NrBah11x4pCIhYD9ISt+hq1/UyEMeuxGVhTKe6+fru42YARd0rZoQPUbmY32rf90e/sT0plnbwCVil5fYDX0gkz10uv3coyeF8KZOWUgpsnK2nnLmztGlGve7SQLYMgyFbi8m5cB6y88/hNmKVhxEeKGZtyT4JLY2xI/xF9F0Id4DIjA4PdSUZryhUkHl9cHIRUqBkWv1nkaNd004GcWoaHVvitEweqlHUkKgJAYxU+fKXFwAtsDfQi+44WIgXloqIwqfXN0fVynW1OoxmI6jWjMPE9atLrhDemm1N+MQ5LI1z7LsoYMBsfdU8Jv4IWZT+qZ8+jsTtP25GXqoSXLIleMQut9i2DuYQQt9hyTiBWx0MFxOpoGECgCmrw1/0Yj2MMWQcgd6/fhftS8NMDRm6f/etlsp3wS3eP5jp/+TXZBOE2WOWYRPbO+d1Zu95wubjIZuoyaJttGe7DDqYD7WTnH3mK/C8rCKEtt3IuKWNc8FsMZrgJ+jSQRrNzcoMHF5Zt0xuaulCIZy9CKhxB/3h2SNDannmZ8niirP9w/Jox1SpXbhDj465BdYUY1DJmRAbyHIgg29I9x5IsrBiSaTZbxj7MNOyx48tv8a2DmmDxRVtYFVlBJNj8unJmflLU1tm1bVXQdODbk26yCfeZui6+5Nlx+z0MWL1m6cfUo7SSGg+i/8Vl2TXlVq2bbUAYtVtvGdYwBVJH82WqPEa3ceNo6ZPpqUQ66jHx6Q8BZ2kC8MZI4WpJGngDQYwDjEZrdcDs/ChU0Fv+7Ud1wrlHap3GFyvdex0AoAHWSQL44lIxFU86AsQ4PpcZw1wpoVeNMoxE5xDQsEzEfA681cIWmA=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

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
      <title v="Lấy số liệu từ hóa đơn$$90" e="Extract Data from Invoice$$120"></title>
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
</grid>