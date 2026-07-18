<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SQGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d61$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SQ1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c61$000000" prime="d61$" inquiry="i61$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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

    <field name="ma_kho" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1' and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQoRbPVQE6+r2A8MDeUmKvjQZyo5o/pYSPQ/t0kJsqjyNis/JPAoe1yyC/M/bCd92gg=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpmgf7hXqhIecWGlnfkL7l4VwaWkGMcXUMb1BLIknf5iNFNy3zf4Tw063BcLuPdE7w=</Encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>

    <field name="gia_ban_nt" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá chuẩn nt" e="FC Base Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá báo nt" e="FC Quoted Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_thue" width="80" aliasName="a">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7w4AFWAwQS26yo9pzYuhzkghzgz1yWWvv4ZnV/zjKFYik=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" readOnly="true" inactivate="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất" e="Tax Amount"></header>
    </field>
    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Ngày giao" e="Due Date"></header>
    </field>

    <field name="gia_ban" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá chuẩn" e="Base Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá báo" e="Quoted Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
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
      <field name="so_luong"/>

      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>

      <field name="ck_nt"/>
      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="ngay_giao"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>

      <field name="ck"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDDjxJ7XcthIgIk79tFCABYmWzL35Vct24V8R3LqD3vDT3s3i1+qZznfFMO3WSFOD7oVq7g0PTjchrNudFn5octh3KAX907und2z8xL7U1hKOBtTDbA3AZTLO//5iioBLr8ShOeXu6fEhWjSaVWxNjwy9bjMuW/b040AlbC18kLXUeIrVJLPxll7qwlEZ2PtdasXxmKZNEpU7cV+KOUhjZz4MQc4ym9MzcO4W8+zITa3cwdGD9xAcN4xwN+dyGMnGLGGlGhC7J8VfXIAZQmJfqB8ABbAT1NuR8BwJ/7dxOQPEMmSpYJjEtxHnZfAPFYKNsj3+pSdcYla+6nrglkins1UJG37e2YVaF1klDOREo3BYBgcWG3ZUDJ5urlnDFZC94HC0MXcNc6E5OQy0rc/diPMglx6VirnwX6qiyK4I4Vk2m8Heojad9IDbUgPMa+bTwUMVaNq15ATlouOCE9H1OiXIC/D2qdlhdMYftuQIbPIWHy6zss9P0CTLs/yAtupKrDQ1I64jcEj1wet+QJI2odly61OFR9c0FFh9t/F4KqBZNOyKOr6esx1hf6Fxj8/mEQdtIe+46iIld1ZtawJD06p27+j9XtgpeJiOws1flRwFDaOozB6IpcNL+G+Q8e7QJcpcvN50/8wIjLhq21okXBOjMY+aoY8BjC1jlZBw79Jlul5cAz62xlRnDT3hiVM2tMy0gWY1AMkhBkMcMl0UhBi68yu3auam8/7yETrvaHkcwWJdkkNBWVBqeEeHyAj3A6xeRpBLD4fwyfi3DHPrx7FibMUuOzo0T3ytglYA1Ni2zobkPiqKXJgRoQvnM7NAw3c3Me5kdnFNApH9e8yOvLgnvKeI9EjHKa0D4DkscGFIFzXXPOY5QpZJVYa4vr7s+8j40VKxb5e0otlZAvUwVJQal0rdmMrmNwSGaVfRn8asCLtSC7ZU9E8YRQYR9dmm1+OCjrLVOh6OSgw2OeVISZqyH14u8e49Ku9HZ4tMEYO9hpSonNuAxrA8YbcdT8JFU7tqj9PVQM+iKmol6TFsfWqO37JlYWiZS5B6g18t2zluTO9+wXnJUAQdC4Ym13hBIStBJP3+BrZYMdx8su/ADBXJp902dKfeyonQX/13J3/jUipVQBx5YBh3LpO72xBvdtWnRbTx/jKptFN2h+fjhKamQDhiXfQzrZwZlKxI+lOz/UcrWhbLOWdIYVENbh9z/3eg15wtGSXw/jXGTuTY1kpxdxVD3d54nZAkS9/fv2P0QfcBp9cMneIxML8vSTsS1DMUVDV+lux1+glVFstcBwsH1UsjStPL47zQs6kgfczdNFZf67Nc+MmScv+ZJhJvu7Ln5ytn0V6Q+Zd3fm9tbaq9LCUOpH017DcTyR7BKwWupnpjyX2SwTuH/+5aqUvxjA+fLJ+i2fKiykjt+OgGBgyw0SExRdJe629e3859+VEnX/ck/dviLwQ88p8RLuB5esWDxn6VWT8SOdWGmPAUOLiki6wgqq9D60KZgOEocuW7gjwSj3z+3G21DO7H1gXDLwjSCPoS7LiOjDlOvEj83CCfxoJg66hdLLpGjvZeVN1NFhsd5AxGkTvyGKJDCMRlfe7f/RA4c3m6VeBHvdl/YqH2oG/4KV/WeptB1+qKt5v0hh5tS4TPl9ZAnRJ6LdLPtZNlSQnZPx+grPvcON/7fgF3M03iVWjv1lvBBCRzVh10nFb4OOkhKzuxbvdVdHGvjD2T+Ez0r6HM1OjaCkVRlgGCmtxxPvCiIcez23t2GKRgQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cLk1tzjI10xZsjnkvcez8b3</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e5g3wJw1x6BZ7s16MkJ7684LqYvKJTsnPRVk6p6e6T2CS5tlwD3lFgLX50IlbtBtfADnsIdAXxMREZVrTnkS41jBCd7t8zaKmsmpb0MOHqnYXiSRk3rcJNSckHNmCDi9heEr9ss92E9cDOy5me6cyRCp5lPFJFndc92y8vfI3+1Mw==</Encrypted>]]>
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

  &XMLStandardDetailToolbar;

</grid>