<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PSGrid.ent">
  %UserDefinedFields;

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptWhenTransactionEmptyField SYSTEM "..\Include\Javascript\WhenTransactionEmptyField.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">

  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">

  <!ENTITY Type "2">
  <!ENTITY Tag "">
  <!ENTITY Ext "70">
]>

<grid table="d86$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PXC" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c86$000000" prime="d86$" inquiry="i86$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQooA054J+wew50DMntVAonAbqYhTTcCO+LPvypIOqklUz5gWARmqH6KMad4CB8YD7Y=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpl1MgJeW5LDnfl3Uwo+zcYb/mbSpl+HKDk0RRwQNroW0RcBA3Reyy1JEJLQm4Dth8=</Encrypted>]]></clientScript>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="80" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="(e.ton13 - isnull(d.so_luong0, 0)) / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="80" aliasName="a" allowNulls="false">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100"	allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="pn_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Phiếu nhập" e="Purchase Receipt"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="hd_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="kt_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Kiểm định" e="QC"></header>
    </field>
    <field name="kt_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLWHReferenceFields;
    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_kt" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0kt" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="xaction" hidden="true" width="0">
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

      <field name="ton13"/>

      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia"/>
      <field name="tien"/>

      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>

      <field name="kt_so"/>
      <field name="kt_ln"/>

      &XMLWHReferenceView;
      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>

      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>

      <field name="stt_rec_kt"/>
      <field name="stt_rec0kt"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>

      <field name="xaction"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxG/CjusW+0cNvRfXd0+Bh0OMxrDy+3xtnucpLBOhB/cJ8EbllE68/G5K8X1hz4pmZu2fSEG+SH+L9jKwcBtfdYAblmE5s7wfeDrYMIkmgTGTRqTrHnX5CRD8U0QqOj+1NEGKsI51gKjqby/A9KxkOQ2W2RuVwYqxUOnc47SgReP9pRXCe/WQpapiKHzwOyW7n+gVyb+P9KbUPCym8G/W2AMPVrCSV2ncU1f+/9VaQPCprruTJXbmtrndmo8Pyby7MtY5OX6iNHfMLYbYq2pjUA=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCtb9YJrExnX+33mIFfqU1QHX3oIxjSSEKwiBdpVVAEmg7/Zel2N+9lQEBfos/3/HXK4wTHhe239cmPfXozWf/XcMe/x2fVU1Az05p8B6tn5sFpOQGU2ha+KkXfI+CuVmpecuPmzqjEk662A7xFwtaKzhj8V/N4QbUl52QQsBskU5XLlwWR5NBj+c3htTS+p8zKtUjh7UftwYpYBNrPXDT4TBtAhEL0sPrtQzVqma8e4mBGeAVCTozVefH/M+aHZlBGOHQeaW2F5bYnIa/U9OK4YODHTv2J6CI/yjEGNiwv2h0zKeypEnPGDelStB832pomp+yKeQuhKc4SK+O58CNRtMAkCGIq3+oBl+utvCpMD7LmZmhgWKGYYGkgey/d6SIjh8S8HRt68PpEKK0TJylSZiJ0PnPn4FzA1Ox76yXF9cBipVe/Ps/6u5PcKa14cXQz5MC8lU6wWrpRQleaam4o5xiPotDOUbY6eXxbnL7KaK802PMmPu2ZxrM9MXUGgHnMY5u4Vrk/JvA91q7SbB66ceXvET3AbO4xJIDubv9ujQOruFb/qXSF9ACqGtlqFSedOG30L/isBoGDjwZw2PExy6uz9AVUrcZyL4YOa0sWS/x2zwJ/jBMIq5QxmGTmCzVpaNwXOPN6fU0zArC8EqZQm8N339pLWZ/x3GHDiJJSAq9bpRLWsBiIa0jNg9mDvk+MQpOlCLfdlEyxTK4Kb7kCe6uf8sXN/KtgJxIO4jGV0hd3tKgnSIPM1S+Dx4jDdMCQFoCIYokzE//3witJGVKxMjKpLFoTw3TIO8wCzmzCM5Cm6CBNn+ACNKUhM0C27Imdz3XLk/gdReIocc3ptlLv74MBWKMR/9Iaeq2rOEWNDBlT8mGTCzWOf9b98E6RVkioAiF5JRqMqalV0EblShuZmmZoExzf3r4BJtH2jqKOLm9wk/uZgMB58z4nsQLLH2rb2lz0Vv0MjRLmr9xUhcuWff4mZnVTCCQ45mvboFZzsZyGuqlW0tgGY+zQZxCBYOYpKtwdm1wrhK1nXz/JBE3EewJZD71OkcOe9te5V4HWCzs0U6IlxuKudQu1gI1+ScsuhP+X+qE9tHrA2P2DpLJ3htpOug9rdbVr1AXto2oeQHMZJK9iVGNu2ZXgUjHEctLzXFWXBCdeL8a9Uy1y51LSkhTY9pS5BIe/Ex0nQ3tQnn2iwtiFp3+sm7mWYvsc9Ocu7J/xJjNnuaPTd0djLJ7ycB4EvOceK1ybUWCophDi5tV6KRDdhnGyaIiTstEnu4U=</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGqKV10UWg1Bsmd0PQCcR07RTbmEI4Vx8r7NO4/16paQIpGqUl+YmZxMW5xbSGDnhm3rVfED01/ODdznFoY2OdVeQ8rhz6wEq61syWQKdWi4gZB5hCSEvW3xKjt0NAjsGnIe2daURB4oZbJ52o18U0a81VZPJ9Ok0snd1jO62ojV7lk0F53HEqDyz0B0zkd+0GBqYvojFjdQwerua3HKHmeI6fDR47861IyF61v3WOsve4L1unuZsSTeQe+RL+JIGLEVYLywLJpqL9NRgyro7uamZncXMfPlJ0T6y1YD+lUwLMcguguRlK79siJ+arwbkqrAvblzLRoz9pIc3KlLMWZRKvuLgRLeMt1x1Kb0QJnSdKOXAqvbNGb8CekaEHlHfX3eHhPy84mMkQHph9TzcorXgScri46LGxYpjKazt83PxhHpovlRHeIQtmV8e7Krfn/6ydMt4ofVYjDVM677BbtBzPl0BJXolObQBLOW/dXR+I9gtoygkuCxpPXyHBg+t5PWHCIviwA5qsYqKh5GExIsvYuoYonlO3+NdXGQK1nQ2O7b12IwH9sfBm/ZBoRYRpAAe6B9UQRBH/AM7kqjsPbUG/3QDJf7lQDpH0+z5GXpBq4uf/TSkd8Gc+khTEv1OPF</Encrypted>]]>&ScriptWhenTransactionEmptyField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b3aHjpvGaum3Q85M5YULkPzGnfWdswAw1UYfIoVKnjz227k3Moqk5bAtu0UJ7vOg2XMQQwSOmLoFFolJoeyc49Ekthqwt2BpBaYofHwop36z+KWma1SZ/3q5J4wNSION4ti+OqwR+7ELQ9iuPMts5c9miILgyHv5oUPGLUFxg5Q7AkyWrJ4asQpFpXLNvQJktPNHekuaNGrxl401CTJHTV1ueA4FjGlH+YWZJ8ymY+QLFw0S5yzBr6unJ/qLeeOgRkAKQOiAOGOmoJv5aEt/hY6K8vS9wYVJBEUgdtSJ4inpwDf7GJ84Bu7TfhPLx1dSA07SmGStLcW4cD6rpr+j1dhi53FBZkMAgLeRa9Jdz/zYHGf7DtfNYw9fjloKn16+9VrOAEZPLDKE7qtpM0RBKfsB3ZfumtLyzcGcd3xNnVpKldrhxEAWoBpnTT17cmHjPjdUJlUB6hKmupvD6HQi4ZnlU3L3cWfSDpGrDgC2oWlYjWUoBMVrB5B8c+kus1nOevFPli5IQY5DehD5e4diCdOtCRdSDiaaxZgLmcKGcVFLu0eFyUrEdf7cevcePfCRHVeBurZTbqDa+aeBl1d9Hur3VH4jNQyjLoAJbazxiuHjNHzpxbzVdZUdD64+UdQ4ImlXEF4r5NBZzKW2IYDd9GnGTKNgaDqOhkh6PXhShdt8IU8T87XKFCi+uKkFFkS0irklCcZfOFPqXQ5j5ILL7aES51jtWFfCEiW+WAU96ewxGZTLo5hNLebMpzHlLnuCw==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeP8YubHGdsHL4F7ebTcT1gq7tOzEs71LfwWDo028OAlEObL/fNTdjgB+WFMget4gK/jV0igO78X3SJfa9eaFhUQ4DP8v83cgHw+OcO++FR14lomj7VTy9/spQQsPbBFN88fcW0ZKfpf/+nvb7QboEUKkoOf6fABjFWFMwxBUaKRUNq/xNH/AubbKNxRmBMBjj8pFF8v1UTNx21PJnyzugSkMIGCX1ypUimQIhIz1pibc9NUGpswIIOduEOCUVo79tfmFiEeg2LjC6sNWTPlk44pxKl8iqHGPd9hWpghittZs5uFmOhKMt6WgRkxsgllV8f9MP7pngsJzjHX5ULJfjA4</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyAKwF1Cug7C7QrMnlsiJP11VmYDSULz8nJeZIi3ZMjh+mscomrwaAS3cYGdKqnIJHNxqlvIZoaWPP7lPZ/u2hXm</Encrypted>]]>
      </text>
    </action>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDoaH12GUsmy9u18Y5c2O/JD7et0clHdllpR2oMO3iZ4F+p9l+MYLXT+Kimcps0LLr8wHG9jwCpNOdn+sTWRWKQL9HJd0PIr1DsIY9C6LgOh/ayeymm9kNb0I7NDYCgh2Hw0TCFc7dzbzyQJ623pCjpx+cwL6ELFQ7FV8sHOTBPklkIlBDed/SyQH1TQVV3MQjvAqjGLRY7mQ6QHBMtH/GvQ</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03xn50zNKtn8WVrJ9IU7Njl02svHsWoWEMoXq3wPDsjOhAPAzD7Fs4uSG28XqniAQVgxyn6MybokXlzqPUTpGk3WQNs5EooXnAYlga0sU2dbfLVdJj/rZzON3soJJLb6KNhhMtoi9+4mYbqMonFFqD+a9zYwWUu1d7TdE9wX+SVs</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUCHYmW5xFibYHzPKvwuOnUx0txOcAAifNVGAzA5BkEYyVyUZRRKO1XC5iOiN1T5AXM=</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e7PzRebm8TcXrldjKa34mlcc1OkOZChRy34A9X9uxMwAMFDuMP5Gcdrf8Oz4VJQ/T5i9vOEnQ14lBustyg4i74yQIdHlubfFAULxYI9c21hHiHiVhM8tHDdk8EeP42X7tw=</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03xn50zNKtn8WVrJ9IU7Njl02svHsWoWEMoXq3wPDsjOIVKcyNjgE/lbfyLUczAOGbFEuzMOt22U74uPCAGZnjfEaQaBKCAfgHLfHaLRs3SFjcPcXjMX2HFiVtEy++/MMg==</Encrypted>]]>
      </text>
    </action>
    <action id="Location">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUAuTJazjJfoA0JtP/FNrxfG3vTAt+nHSmEL0ylHSmKFVG7jm15Un2y5RspKIuXx+Z4C3Y0/ZmAbNZE6ArfAHCLPKBvDi2QkKJV3eiABr9ZjSlfww7XxFqu9FPucuCuyYWzHwLaMMe9JzLg/sJ0JARqH0UABntHIiiAea8Zbv29r7g==</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyDhyqO09d4WYNm58rtLlYYvKpwcR13AHRzCIerFf4dkba9zrC0WSKlk1Je7zwTYHdY=</Encrypted>]]>
      </text>
    </action>
    <action id="Lot">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4nNXTwSZ1E/2fUnpexg/xWo/ibhnMVV3RwEkF346tR9eZXflQNf9mm1rvwefuAplAkDZghfpDgRl5z9ek8ywTaNBLBPdX1eobjn6g2mdYwsv0ALP9VokBM4wFDt8mabA4vb916VNF2inDfl6bLpMEjUZ3clfLX1ybSJPq+hAug9YtdqgagwUmD099Tdl51RWMNB8GpMCY3eEHeJZepWLauUP5lt0EY4gZoTT5iIXTxUZh6rcX801v82YpyULCuYfA2KrsmQsca2Z/ZhrpgqAJyqdTNgvMeN6MRBoyOJJi//g==</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyDhyqO09d4WYNm58rtLlYYvKpwcR13AHRzCIerFf4dkba9zrC0WSKlk1Je7zwTYHdY=</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    &XMLGridStockLoading;
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

    &XMLGridToolbarPSDetail;

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