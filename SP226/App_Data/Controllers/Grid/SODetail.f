<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SOGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
  <!ENTITY % SOApproval SYSTEM "..\Include\SOApproval.ent">
  %SOApproval;
]>

<grid table="d64$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="DXA" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c64$000000" prime="d64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    &SiteField;

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpmgf7hXqhIecWGlnfkL7l4VwaWkGMcXUMb1BLIknf5iNFNy3zf4Tw063BcLuPdE7w=</Encrypted>]]></clientScript>
    </field>
    <field name="gia_ban_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá bán nt" e="FC Sales Price"></header>
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

    <field name="ma_thue" width="80" aliasName="a">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7w4AFWAwQS26yo9pzYuhzkghzgz1yWWvv4ZnV/zjKFYik=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" readOnly="true" inactivate="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" width="100" align="left">
      <header v="Ngày giao" e="Delivery Date"></header>
    </field>

    <field name="gia_ban" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
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

    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" inactivate="true" clientDefault="0" width="80">
      <header v="Số lượng xuất" e="Issued Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" inactivate="true" clientDefault="0" width="80">
      <header v="Số lượng hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>

    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e="das"></header>
      <items style="Numeric"/>
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
    <field name="stt_rec_hd" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_bg" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0bg" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>

      <field name="so_luong"/>
      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>

      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
      <field name="thue_nt"/>
      <field name="ngay_giao"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>
      <field name="thue"/>

      <field name="sl_xuat"/>
      <field name="sl_hd"/>

      &XMLUserDefinedViews;

      <field name="he_so"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec_bg"/>
      <field name="stt_rec0bg"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS3aPW5Y1UH/gD/g9aJPYs07wSfnrFmGqZyptcO0qNGxEwtLyhe4+MNYT7zxJYyHHjCk+4uSz5QNd0OkN3nCxKTF3oicbTfg4aU550RT+Z9Pz8e2VV7yb2a8MkSZEiBRcCYi0/PB8MYbo3saC5TaKS6wugnV1LiM3s/UyVRSk35LQlV5bMsJ7MVYvumkTgxb4ocECsJj6/WnDIMPmmX8rGyNyroYS2Gr3bJsG+bRKcogJqAOfB19Dxy3/gsPICtKI9y9ieFm8ai4xJ9LmqIAzQdT9HJaUqlBRMxgw3E1uzGqIC9zvwR1fplS0xPGt4NCNIyVvGj/ZghjP5apEFpZH2cTPQniWW6w5AfzJqHNAo3oE78fZySClvUy0FQPjxyMQEBfcqW/ZXUD1zbadsHtFjHrdVOjX/3ohU6If1FeTg9/IvHDoAtbl8BeYsqNVXIUpHdxQFnqj9RDbe5ldHp/6vQaHyXYCWTmbHZPqJXa6FMo1dCdXe8D+XJSn3/dhvfr59Kn5DzgUUYpeFhm/bXMl7CjE9EhAuT0KDt3Ef18pxgSYcaRtbKVoqP08AaRYGrNl9Ye6tBGix5JD2LFiY8TKjoCShF9Se0CledJBlX8iwefBfXFdfxdTpRARpF2UaG7qr9Aa3GEHc/5bacQVKxFUK8Sxqz6rjbo391OCf4vh+omxgNctVrANedOPcYeeCmtNEriOtWuQ+WQvANO4qmONI/bkiUborC/HK1S+LC0tikQQZMj6TKeokDylYAtxqf+y39lJxUOYpi6qJAOmEAdgn33U8eY9boA1Cx9B/AJBSxIl3+CbaUQY/JROBfkdpTpo4qExf/khaVkc5rXuc4/iDK5CoyDtRRe7QjUHZjvh5NoQq27z0anF28di2h0CZu8oIfVmcjVub54dHhe8gW18aBEI0Gs5nzSFszKDqNV42F/Qax0FCckgZbFT9+lMoXhL/LlB1phVpP5rmyFlW3T4rp7xGiGR0FJzkDbuh8LvUbzOaX/eTb0Psc9u2KMV0khqfEVX0W3NWnc4KVNlQn/m+IrUhSDsRm1I/PpapNMpVo0EcOia7H72YCd2Nl3hrX4dvmCz6vMOCyMB6Rjn2iFGhjaxZRbDWVSHQ/MnJfiIwPIJ66BxLmYI+/QHGmdNlI/mQOcxl2VLFjilPLynN8fMGMRBEwKsXFCZ75sLv+ZubvAOw==</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGquFNDqn7QPyNVX4Cdd+5jnAG5URS88KCOLrKITzhQUICMvcvTZY4b21+/TDR229sA0coZ+Gug13lI/1mOwtPFbCAIM2APKLSFtNnNZwRJNy5B9ePUEuO4WOf2epZB9pJ+MD2WYuI9I+U+emmmoVVKtMxRnflwl4SMv2Pj4wACh92OdhgfLk+JrEUFUwx3zek8dB9ftKdCIioOQnrg4cJWAC8wTBeIdKhPNylfT7LBhdKXXxmjM+AoBvRxIk1Bt72lUvo+9E1AiqSThuJ9s24PYIUl1RY/0MFwhKN7Mso6Ylsp9YSlREMdguyQ/05MSd4MQ0wFqQ61t6ozbCcg02dbRva9b/7Eh1IMYHYGKWwKNoFYXDiePMPMXPN9yqu/7I/dhbPbXL/25nWFjekbIYeilIwBFBKw1AKJ+RixTtTgHQA/MiCERSzFsVzN+Rf6u9nt/1NTVrIHpTq1f+E6O8/0z6dbZAL9GT5MMlYBT+Pbh//i2GU8njq9dxttvqyZ4wgsK+EvKIqs1Kr/T6+saMCzk5jJ5M7pXsLGP+fFWfOTx1r5SoUgIeFiEFi+JuXfiMf+3zBxz4iw8iEJK1Z/DbvkWGRDOhJSrxZSMDHS9+CyfEAtY3kjuGwbFlnt03UyOtKrxcWJKCqN8ix6/LP6U4jC2vuaTvH1SVhxopywGptQA8YJ8hXlkGyHAyiWMoDrry/X3j5i4nBX3AC4xqpNEBr7P12m3mCxmH7Dgr9j9jEFApwFjcdsdx/+U4ZydtxK5yfdfY56jLlDnLmAGlaPm1qVww4OkUE7vefVpjLy4XPJk7++tV5y9IYdd37YnQ75ZHu/yVeH6HiZ7gUMNqckpaczHSB0jfn9QcXP8b/8fdFP//13OY74yXQIVIIMEdNHyq5cHRU0sytE1TXniwACDpcx1xI6wdJNs+4T+yfbnK+jYt/D5VLGnch68d22qj+vtPVp2f9lIdZuU4ufc2FO08OpfYGcw5HFvshZXSfk0C6g3+dc9aYe0ssSq0McKp+PB2b+nw7CRoYbAbzVsqKtcHIz41P/dLWLLukJCYEkEIpLHeA+VRrh4zBAleUkQL8OlX6rJ0RDAIYu//Lm+sf/lZr9JqVz8/rj7+ATyUxzZuR419LTp4RpYdbKDlkMegCUmo8ETYz39GH1Aeig2KhLwAbfz0syL4r4Mc/WrbXPE4VCgPas0vk5MSccoh2Rmm5V6I5lHYJrPH1Z1l8WS5ZTvcNmiLWbeXtthTw3MhMagFVUzY4=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5Jy61LbYAJVO6jjXh0wRWZGVdH/dEPT25h70Iebw/RPdTVcnDgD40rfGAgrq6BWLjRZ22QLFTPQHDV4XFuE2MvqHDBX+blWgKVh/p0c+HR6vnpYEk5xNQvAhBl6ul4y0tBL+40wMGW6jJ9QOVt3pI8Ql7j1HtptRkTuw2kUMb67cU=</Encrypted>]]>
      </text>
    </action>

    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4BNbn3EphSGawguvqW+UToFfEkbXxKa8dSj4XyqxFe2udVN6Q/3/v3r7rwqI1KYnVMocS+5uOLjcww+NWWpKCIC++LAndVSZD5XdchrHHaVzdOcy+izSWRZlCBTaX9z0VDSF/chaNGRefJCxTVt0h3/55Zhc40Q4ABZCExZc3YGzt7hNkTvmmN7kFEjE58jVYHch3QSPQ4YccAcHX6iZcXXWfjGMS79ardIycDEpUjDGnx19+ZJEVPBEO4/iVliO3qJmWFdVCkUUkBybaxSNAUTO6ZS5Y05EzUf1pYDVYcUI0019cRchIRFqPXm4dQTxk=</Encrypted>]]>
      </text>
    </action>
    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cJoDG9zD0J3ousr3/VxQmYm</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&9bBXgmS4IUqbn/cYhF1UTAVsc+089zXERUTisJ9E9zaYaZSkrj6C7oTGBWpE3jcAaTW4rpxABGpThXe76imHJGyb+FlyzS+s4oom9jS91dkRfxDkYSF8oUyTzHgSl78R0izOJlMJ1H2PW6FdDYIaQvABtDICj7b5Mf1QGeifLs2H8mzSQuV41q/SgF8zGirEoULP2/CziD39P4OT9LbF7w==</Encrypted>]]>
      </text>
    </action>
    <action id="Quantity">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysazj3IZX2OjrjWxHG3/JOE/lcGYOLBf1CQicZ+Vr9bPrPMOApE/kazencEns4t00VNk13sfPAJs0R62M1xOlmiUQp1SkrbZh/D0UBRzFq++XqASS4RgSbITx2yRzYehxzqbwjJOgDas3fRolcAVH7uiQXE7fb89D6Du6EBLhdLfdiQC+lA9fTOqinEWUMrOvVYc=</Encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yFzgQLaNkA9HgJ1+G4ONpdXNslwkYRN/nMr3CJqdA5oLxZ8s49UZhWl5YkSfhCVkX6udQO2rCRD300b3/FSXyPho=</Encrypted>]]>
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

    &SODetailRetrieve;

    <button command="Separate">
      <title v="-" e="-"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>