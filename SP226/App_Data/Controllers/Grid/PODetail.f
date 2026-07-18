<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\POGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY % POApproval SYSTEM "..\Include\POApproval.ent">
  %POApproval;
]>

<grid table="d94$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PO1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c94$000000" prime="d94$" inquiry="i94$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
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
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" width="100" align="left">
      <header v="Ngày giao" e="Delivery Date"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_nhan" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" inactivate="true" clientDefault="0" width="80">
      <header v="Số lượng nhập" e="Receipt Quantity"></header>
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
      <header v="" e=""></header>
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
    <field name="stt_rec_nc" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0nc" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_kh" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0kh" width="0" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>

      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
      <field name="thue_nt"/>

      <field name="ngay_giao"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="thue"/>

      <field name="sl_nhan"/>
      <field name="sl_hd"/>

      &XMLUserDefinedViews;

      <field name="he_so"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec_nc"/>
      <field name="stt_rec0nc"/>
      <field name="stt_rec_kh"/>
      <field name="stt_rec0kh"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS2LE83QGkV7z2DKu4jcjxFfvI7WoKwqHisescQMr425WkzP60kVFDgTZF/TTNJg2Kse1PwB2Z9AoYaRXeIRmaO7RpOa1HpX2U2a4/mojIFVGkIQ41AQfVXwmCUml7P0iD7PZ6zL1cPoZpZZw/VPm1Uly8Tixz8KgVqGb6UGNv9bvnBAGjkpNrpO4ZzpcrwzqktuNHY/8qmhDnfpZH5LbcAstvgGGUYIco+Qo6yQKkHawMT7hYZ5JL9jbqqfaUG5yPmTWvfmxXvXIdcvOB2ImmUrOn9yznfm75PHeifPouqSBtRKxW3z9Ir2s1zTrPq9bBJpkS0WnB/5Ts2COYN/9XZ4tXEalkOmxa1nVWOA00Rg2B6LBRMFfqMRrIh3PdyMs92aeygp8K5TAJLVETt04Gu222AY9B46NxkANnH6bUrjxG6x1436kqspITV/mSB/ozTESWbg7zhMtE7QnDEtdfv7E3R7w+/eLxabaBELDOe3M/DnQRavBDX+uCKxGUV/hu5Xhbnrz5yNKuRJT0JpRIhzFtrLxatH5n4XAe78TX6SsDK1Lt2rao9img94bybYnRrda/q9wqf6I5XKjcjGMWxTi6Yk0VhUc+6M543BoOMJTbALAAiBOsA1KEDoDgZvULnTJj21+uMm1ECp58pB8fkLBg2HQUVsaFx9Pj0Sf6PJIlLG23p7MZsw9TWHGnHZsVLP8B4MAVwfbO0n39DkvGsbnXWH56yI8Z47ipc4LaTouyF9mtWKCsed476Pdr617V89whAjnG+iDPkivD9B3e3PsY+U+toRzKc8t0lWHq8u89Phtp562xhT98nJh57sjrsfaRozPY5H2qxcbBjzdLE6IZbGceD7S68iMGECC39sXNTKNnAx1ZDUgSb/TvEugXg8SS9xUVGSEWPdQXqrFQK4s4WVfVmMTh4Py7HCYyG6U+pxiHrC5y6aY19NAR1UNivBnOtrTr8MbpEsULQPpnWddmExdYIuGPnPec/TF+UHzPHP2q5JzgqF7HR9fgJJR7r4oI31MHaPCeiV3bjaB10OdKbIxyC6JleKLSC0j3mqyw==</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNj0vO1BkgI62WrB7EBtBICufEED1TlyZTaj2WJQtbkJ24oF9qJZNicGUuwaXmHVe9qiFNin6r/1Dps3EWUXTy44m7tcswXLjhTc9O2Zq5NkRmQ0QHuTWl7VnKwGxWG3Dzz/83hWOuA1iehgjQ+/WH546IAQJFjuIeg6Dw7VTaMWgliVea6LZbh+dW7plifuDqs3y3QdRQ7t7QoJ+ERd2ipU8btSA+ScB0LBjwwnsh+SC2BgOomzsI3TenLUwpXHgP55NeBfd7cF1GVZXdrGVl6GnVpDf/vpYx8JnAdqVLZD8flVVSAs93FNSXIphOufJku+kyPy7mnuGlf8uqDN3skFWs7gwyQ4tmVpwdLD0YyEMqGafLKGqpF2CNFBYbBF39m58qL8QRlCKhH/qbpAOzOnvqiMn9FGgAkL3GLQT40SLGhhI34U1O7wT/M5sXmfLja9v4GFTPZXaiLirpVf6LFH/aQnBpYIrwb5tXkaCaOmSXK+5kflkhXZ80eZIXFjXRaZd8dpt2Oh57pYS+c+Ev+yu0uPLk/weSMTYWe8uKewx9ZpHGvU+gW554EOdh00v+28HnczhxY2zgNWDFukq5PtFdoTXr4r36O+OsXIqj+EqWNv6gmhtnmQW5lh95VRzS9xr4utnRhoR9sqbkKjNCbGXhADzG6XWh3S3OPjp7AP8Qxh744OBew9zItkp5mS1s3oV8wMsYaloKr1ZTJ5arpy2ROovAX9K3nu3daexLUNw/AJO/PBZFDQQRGJJGvNDWCHaPAPje0vLXf1mW8mWXTzZoB/UHzWHe3Fb5lSVb3UngAouGG9BxrHfh55Z4zH8nUq45S9bWv9YLX8Nr47vwLgbRkZxUg4JPV9AcPqKgttDLQCznS3jdmS+JCE4opoykuTfjMsUUjfIrQgnmbY6xIilbXVebNOZrjuhFwOlJCnbrWnNTtCySDzVuikOlcWW4Hakwr3bmz5v0rhZg1QXdea75Goytr9UFwzb6Us0qEE7NItIXl2FlhDuPA3tGazIKw==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5JdU1STYtOv9EjgbjrqMkuR8x0uH2vccqK0lcwGAqpkkerM7SdK6VSI3EL08Xokg3C3T1e6PDpHA6O6W0Pwh0ZiA==</Encrypted>]]>
      </text>
    </action>
    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4BNbn3EphSGawguvqW+UToFfEkbXxKa8dSj4XyqxFe2udVN6Q/3/v3r7rwqI1KYnWofiXUjIIyggV4BzUSPWVb54rK2ivVhaD+uBsMf/Z/8McNT4UzuC0huIhPnfbHSKw=</Encrypted>]]>
      </text>
    </action>
    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/zLPw6Mud0un3nIGsk/zN8MPdaB9ruaEtpV6H/GKVEvJUCZYV71d5VWDdwixpHZMGnA7u6oNsYuHSmwY/qrxf3Q==</Encrypted>]]>
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

    &PODetailRetrieve;

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