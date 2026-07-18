<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PIGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY % POApproval SYSTEM "..\Include\POApproval.ent">
  %POApproval;
]>

<grid table="d95$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PO2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c95$000000" prime="d95$" inquiry="i95$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Name"></header>
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

    <field name="ma_thue_nk" width="80" aliasName="a">
      <header v="Mã thuế nk" e="Import Tax Code"></header>
      <items style="AutoComplete" controller="ImportTax" reference="ten_thue_nk%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuenk.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpsvi8FUj2aF0imC5x3IuSy1l9efmYAb1QpwwrNPyJcGewmulCr7YWDWb7g6/ImJHU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_nk%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_nk" type="Decimal" readOnly="true" inactivate="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất nk" e="Import Tax Rate"></header>
    </field>
    <field name="nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nk nt" e="Import FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_thue_ttdb" width="80" aliasName="a">
      <header v="Mã thuế tiêu thụ đặc biệt" e="Excise Tax Code"></header>
      <items style="AutoComplete" controller="ExciseTax" reference="ten_thue_ttdb%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuettdb.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpss+Oa4ADZt98r83zIawi1I67oz3smi6kzNGoT4FkHSUpKs7S4JWUq6O5VwVroWtw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_ttdb%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_ttdb" type="Decimal" readOnly="true" inactivate="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất tiêu thụ đặc biệt" e="Excise Tax Rate"></header>
    </field>
    <field name="ttdb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế tiêu thụ đặc biệt nt" e="Excise FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_thue" width="80" aliasName="a">
      <header v="Mã thuế giá trị gia tăng" e="VAT Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7w4AFWAwQS26yo9pzYuhzkghzgz1yWWvv4ZnV/zjKFYik=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" readOnly="true" inactivate="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất giá trị gia tăng" e="VAT Rate"></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế giá trị gia tăng nt" e="FC VAT Amount"></header>
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
    <field name="nk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế nk" e="Import Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ttdb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế tiêu thụ đặc biệt" e="Excise Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế giá trị gia tăng" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_vt0" width="80" dataFormatString="@upperCaseFormat" clientDefault="Default" aliasName="a">
      <header v="Mã hàng của ncc" e="Supplier Item Code"></header>
      <items style="Mask"/>
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
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientViewFormat;" clientDefault="0">
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

      <field name="ma_thue_nk"/>
      <field name="ten_thue_nk%l"/>
      <field name="thue_suat_nk"/>
      <field name="nk_nt"/>
      <field name="ma_thue_ttdb"/>
      <field name="ten_thue_ttdb%l"/>
      <field name="thue_suat_ttdb"/>
      <field name="ttdb_nt"/>
      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
      <field name="thue_nt"/>

      <field name="ngay_giao"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="nk"/>
      <field name="ttdb"/>
      <field name="thue"/>

      <field name="ma_vt0"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS2LE83QGkV7z2DKu4jcjxFfvI7WoKwqHisescQMr425WkzP60kVFDgTZF/TTNJg2Kse1PwB2Z9AoYaRXeIRmaO7RpOa1HpX2U2a4/mojIFVGkIQ41AQfVXwmCUml7P0iD7PZ6zL1cPoZpZZw/VPm1Ull6xlYqQBZR90/iSGMsPF1mO2DBAN7a/Gy6tdnS9nY9vBVaIriY4AOxIC616tDHacWMxtaChaenFz8CM04+m/EUblIrFbvJneqLvrMiqOgI2Kp1eA8x6uPDklXJhSU8cDk2aGVckTyBKpvNAZzkry6XpOYpBR0qhDWPSQYruDcY/9QcAGPARuMMYqRUX1+HwUThyvKR0NfKbR2fQ0SHtE2LOX3kAbTGyeqDnB4EmftjJGA9/TS0QqqthDc5XSz08+qoYSs+Hz2jkFY8GKhr0sinTn5vMa7iTY72UeRykHLOlzSG8kw03TA+VcKWxxn3BwXG9uYpVscmEwCoM+LCErdPW7kLZoAO73MJarWiHiFdFl3CEGMSFF8SO4CwbjtJgdIGjjndrjEwtlgpgQoTv8fIWGwmL3PDtrRHs6hviMNrfv4tlWAr2Xi5O1D4JE+XhwxC+mFcVn6CK5CxCcOZrxg63Q1v3E/8O3gGgKyvzhFsjqqZC8Gj5r6ta59UJfZx514MnKeSuTKT9fNFdostcL59k0oVw2eTNEO6i3sT8cO15rhrB6AV3JAvqI485CaBu+5UKN7OphPNOKGyEx6sUfMQ94tJG4Vki/JwUvSZ4E3iSEHGd7GjQAy3BPm0kOM/2ILhA1z1UbEEDozoJbyLwJNtAU6hWRAbWwqDhhPM7ShDitGyhQ1v/ZAZUurPO6oNXj3f1br9sAtPVXCDES8e/Ugo4x6cCibt+7RVlnS5j73oIlkdsRPJBSrjFM8ZaYhDVR8rm7s4HyBGyBfOilYj9GZnFj8W5ylgogZGvOGzqWWgCxte+pLaoyxUDxI+ChKGD7cRvbxudoGFs2H8mkc2soDa3r7qbS14x2l1V07ecfBaaGT7FJkPcvB0H9JUUxjf2J3FLkDpwWvW7arAn/40q7JtAb3iHmPds2zWtqLtC2sMhEGsekAaa0b52BPyQvXLMeDJERjgRxWpc/Pp2l/EC3179i5JBh3YVgLtLjB6YaDD1RFM/oVAaAYATWLx3apJTfOqTleDkUf+IMQpCfT6p6vw6KdprlOe/QUT1irvhJvhp30ik1DfCHWeBNeLgRQWi3ytKRwp/s20otBYcYdQzrcntXfhOhAGi7N9DTraEzx9IzmEKWXYfCmhnTGEd6B+8FQmJ0yvcFpIU4xzYO8LNkADdvI0O505tVUbGK90d2MEUYFAgyYNEAHHr9jAWDhfoGTEJgeZf69Pp4mhRvOS7G5Q==</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNj0vO1BkgI62WrB7EBtBICufEED1TlyZTaj2WJQtbkJ24oF9qJZNicGUuwaXmHVe9qiFNin6r/1Dps3EWUXTy44m7tcswXLjhTc9O2Zq5NkRmQ0QHuTWl7VnKwGxWG3Dzz/83hWOuA1iehgjQ+/WH546IAQJFjuIeg6Dw7VTaMWgliVea6LZbh+dW7plifuDqs3y3QdRQ7t7QoJ+ERd2ipU8btSA+ScB0LBjwwnsh+SC2BgOomzsI3TenLUwpXHgP55NeBfd7cF1GVZXdrGVl6GnVpDf/vpYx8JnAdqVLZD8IqVXtaq6+vMj+3/KYL/CRURVX74VbxXQxFW5ubSj+kDQHi8ViABlf+nI82l9oCjJQhrH8DDyhQkXeDpPmoum/cE6e3E4Xxrk4jENflNaoLn/p+BlJUxTz4x+Cy1Zcxz2UkWi3tO+B26SFFcE7RGP3hPcsk1i7e+5Hm9yWEWYV6/dpWYgkbfdopsSseE2W0fwVaoZ9uN4kQTY/0EqcsU+6fBfA7P5jlXoa84NXzBEl9E2xDLXHh7dzVo87njPy5rnFSj3GPguDC6VwNP3gdDSRoJCFsOGulQkVdAhcBpI0vmnsJb4c5SGYGuwKAMCblpjg7KpRHH4YDc7bPU3Js2kx1Wd0zRC+e3BthLlAEl6AolWNPmonI+VaItEaKKbw2MpKTLpIUqmAqZ/BD/wV95pW+DyiDEMSCj9d3BicMcDpLW9yE2uoDEtyFOAr2VE/INDFL/PqScVTtHDa02CPUK1CVRaKBxkII90ztyDoNnFondA+wBlrRYM6oizUxWO8j8HzoB2PYg4DWjznSxdYDTPNbx8gKeUwAaSeGzK/p2AUrUaduWq/9f4IlYsqTvdvwo48U3lciy2b8WuQtN8nNivP+NwK+7N2/j9XQyzvtgDJLRoKKxWbdP51307jgdauVeCLPAKBADYHhkvJr8aQCYl/PqtvjhBHZ0DSkykErNVNFhobgui+inCOhbT2Fi0wOT5eZ87Xh87sV4E1Y0gNwF47d39bgLHsXZCaMNjS2tCVqE0tU0YCdXN05lTSUn/i6Ei6YdN0G+iDXJhAadB/QkgT9p4jC/ViXdlQXUaBFatS+FxXRlZznI8USKwDMIVIrs3mxv61ROvV0ZxDk1Fg0Y3cOs+tY9+javaggtCxhdcMPO4oEwXqUYuFvkr/sQgnTZ3</Encrypted>]]>
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
    <action id="ImportTaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4f1WyjAWyOYyF9NJfJwSA++vM9VmpoVBKpSadY7cxFUx4IT60JWgGg+RHcbuOVBgnUNU2bctv/28XpISZu/jMbOwnGMxmnNJVCc7uakp4InQ==</Encrypted>]]>
      </text>
    </action>

    <action id="ExciseTaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4o90wAzuvFP8EEKg4KoOMDL4S6GRQ3EFe0wMAWuKLUZDBvcAn//fuJvCuEy0Ox+DDGdQL966SgioNouila4+AnfRIxPN/3l0csX7HEyYYTtX4H1Lj+v3oel5H2eRB2Gyo=</Encrypted>]]>
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

    &PIDetailRetrieve;

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