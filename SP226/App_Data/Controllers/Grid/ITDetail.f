<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\ITGrid.ent">
  %UserDefinedFields;

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
  <!ENTITY CommandControlLocationTransfer SYSTEM "..\Include\Command\ControlLocationTransfer.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">

  <!ENTITY ScriptWhenTransactionEmptyField SYSTEM "..\Include\Javascript\WhenTransactionEmptyField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY TransferID "ITTran">
  <!ENTITY Code "PXB">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi117FM2kAGNaLZLXbfe1lsIvTwUaiD/QLit1+gWl77hl8h+yB6rm/f4D//vAr7Q4k/mWifF2UM3VNF+s8ja+jTEuRJdh2mwxeCRAejNIa9pmfsxJadc5fn7orRNaJVrAMZkCfBWSIdYDi4Gc657/8+xTlCTIfaqbXTiY9x/x1r3tVmFastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaXS32ch2IyKVm4lFd8W2XyPwHm8hgYR73479+Bn7Ha5+9UfnrhvAkbpkEi5Y9cxPCoWkrC6Rh4MzQMvoC4XSrgSqyI1PyGOULBRyqhfVGmzR+FxasTaseMfK38tTAjhJz3qYBpYbiiMTSMBtJMAEl+fupiVtXxPljnqiPozDYySyJewS4S3VC+JreoUvjB1Dio=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY VisibleFieldController "ITDetail">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY Type "2">
  <!ENTITY Tag "">
  <!ENTITY Ext "70">

  <!ENTITY % InternalTransportForm SYSTEM "..\Include\InternalTransportForm.ent">
  %InternalTransportForm;
]>

<grid table="d85$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PXB" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c85$000000" prime="d85$" inquiry="i85$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <handle key="[nhieu_dvt] == 1" field="nhieu_dvt"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_vi_tri" width="80" aliasName="a" clientDefault="Default">
      <header v="Mã vị trí" e="Source Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="((ma_kho = '{[$ma_kho]}')) and status = '1'" check="ma_kho = '{[$ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQooA054J+wew50DMntVAonAbqYhTTcCO+LPvypIOqklUz5gWARmqH6KMad4CB8YD7Y=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_trin" width="80" aliasName="a" clientDefault="Default">
      <header v="Đến vị trí" e="Destination Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_trin%l" key="((ma_kho = '{[$ma_khon]}')) and status = '1'" check="ma_kho = '{[$ma_khon]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_trin%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
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

    &InternalTransportFormDetailFields;

    <field name="px_gia_dd" type="Boolean" width="50" aliasName="a">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
      <items style="Numeric"/>
    </field>

    <field name="ma_nx" width="80" allowNulls="false">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrVdIQ1ot1fbMQ824W93TqR8eblBVo9oT8IhKHmdep1oI+3mQndyuhxaNfAhCp/9tw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" allowNulls="false" inactivate="true" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]" field="ma_vt"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>


    &XMLWHReferenceFields;
    &XMLMRReferenceFields;
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

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ten_dvt%l"/>
      <field name="dvt"/>

      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_vi_trin"/>
      <field name="ten_vi_trin%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="ton13"/>

      <field name="he_so"/>
      <field name="gia_ton"/>

      <field name="so_luong"/>

      &InternalTransportFormDetailViews;

      <field name="px_gia_dd"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>
      <field name="ten_tk_du%l"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia"/>
      <field name="tien"/>


      &XMLWHReferenceView;
      &XMLMRReferenceView;
      &XMLUserDefinedViews;

      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        &CommandControlLocationTransfer;
        &VisibleFieldGridDetailShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwzZMc2K6gBUwwfyOaI8TS9eky/hMe8FWtNGE6e2M21MMsz3+OsLfX79aR3LcoV1wNGt6Qj6F7QRNOGSrrfFamFGcXFWmT5US+OLJFeThRFCoqNXD8+Pb64SVGJaaRaqXA=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS2LE83QGkV7z2DKu4jcjxFfvI7WoKwqHisescQMr425WkzP60kVFDgTZF/TTNJg2Kse1PwB2Z9AoYaRXeIRmaO7RpOa1HpX2U2a4/mojIFVGkIQ41AQfVXwmCUml7P0iD7TYtiwIA1D0vDsXX2jwW3r02YZ7nogL68W+FV602LW1KTuhV8QQ1IauJoeS8p23ZKoUMuK4EHXE+Psp2JG4p05tMXU/TMhUASuTH3tXJoqDK2QuBvubo1teZlACODQjfAg//njM60UPjRIm3DCCHXI1GOG1GZ9jZ05VWCiDpYdm6r+VETPObOQyxZA+xs91TPGEknuDx5sjnu7bRtgNyt72wCqRV3qDP0PpV2jnzqwNvaoXCn8sQ5P5oMxWwxYhjh3G3qvccLkTW7cWgmWTcO3aKTjt1l0Ot9TmEBgfzAzHuc5FRWoCQmi8Y5dYNylvSxomX1kEdLOL3Ru2fbokWTQGkz559ttiqj6WiqbsyBdY0X3696q/K/yaMAwx/ol8WnwNHhVOIq4f/YDRlFKG2CclBjS7gppOp4O1D9i69TcgEr9HvLqbngUfwrI/UkqDLxHm5QCh+2tU2miwOKIawaTDChdTPtRAGFXfg95bA/W2YkFktnQz5QzfmAeqQkHqrLn9L51BQWfW71BJj0AErtzb7nxSKaXl1er/X5+BFQyHn3S+WOPrkfPSJ4VotuJuHnF1qZXesplRB2K4OL7w82pb4yjUzU+usJnjxC8u/bYa77ZiuHQVhUXYLKx4ourD25B7tEbGQv9TQjbxKW5toiBbXbj59qnye3CHg79GNI1ZbFeY72EFYFFS3j9WKr2irmrIMGoG8NyOM9mb6xMCQfj7vCqv31fggDqRT0E0ORxnx3PK3dCAGhvHUYm/t08LZ2CHpHqaHd17Ab4WVFMBoPVpRAKgHiaKDn4f2GAVQVBvito/QXxnbefCGuNGtGwAQHvWyN/OF/nl+6GljkQaWZ7tPCiWzOBJ0JoD+DEDq0RZ2p2IyZCRgHAAD/UgOzFuoP0RUIOqHX/u5ZkYZTugqn/45J676jze00O0FSVupu5P347rZyezp9Ho5f/l9bfIolptos5RyUB/8eKKJ2a6VKq</Encrypted>]]>&InternalTransportFormScriptChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RIsITZ7+NeClUioGR4sopSVO2BjnGLchlLtk7s2Pv4MODWu9elFIyfLwKED/9JCNdWddYg9qUI1nZkD+gMZMPU2EH0UaVds4TwTbfpUlRgatsJbYnbkKrXRlhvUIjctz3nx/Mh0piTxQx94tonniuRjEZareoTxGYzmkAb5LJmoU5/MMvZnYA8OPXRes0mWCJgWQQtaO2nOYiRvLth7pnrMKdCWAkdAIsUz6nb721Yhx6urLEpDviFwlK96OdrD9iTR8f52QymRYzzFf7SgB6EBWQmLADW4HVh4IJXTWecqYgO6dFxkc7RvEDRt1XP+9X6PBi5h7mnx4QYJI/XSZczlZhoHIqSzL7zrfzV1oca/H6DnciM1dngEjNjOpuw/jevZMMsyi5gHdt5+Kc610SUAfrmxyMnfjyK7J0s1SLjLbgE7CqdmlvPC+4fEVuHxWyCKaonOmlAWknwwrKlbezuG663gdEiuTMH/DQbn809iP01ry3G+3gITCtqmL0kqSYTSudCdQrjRpDP/9YrePtfHrE7TcdMcrorYFZ+FftSlVE9VDYcFYP+Q4yjV2kB8OHU2OTjoz7gOJMYhd7Ew4lk1HU0QNWJwEFONERPEap6Z54G6EaQKe/cHjRYFABohNY3/jMR8kYQkPJprPmi3o6bBXdzY+ja3sK9uBGRS+1F4Ytw3h6e5aSqj6Itr9B2oHl+Y4myTAlwU0tZXn1LEdsHoZ4QT06c5xQGGMFFdOIqQSNM3oF7iY40zc8dq4kNHJ5KhFsLMOmPQiDzutQp8lPsNZCm6QDmIorUYBm0d0NAe/sWxwvhvJIAhhpYs+nCIYhr7V2owI614Ydl04ed0b3E+3Xdr4KlhNtxPzUQ6PdXhjKWQf+ftUjdLv0bT4t/Oq278boXpnkPHNvTKCPd0xiHYWq6tUANFFNphrfdofviujSAOyJfU/IUB2yLEPwMvyzjWXZA4Pi2GzX4aWcm4/khD3EiQsprj+UDH5AUcQt1pwuCjRtDkgI/zaH9fOOyzODpFLcDRgP03L0hehFSXu++eDWup4m5V4DFhZ+SxM7IR+s+P/KYMfNuaBT2emOOVB/L70WRl3US0uc0DvyAU8cgU5agzQfJSaZQ2Ut49zj/G/zRAHQX2UhJYKxeUKxF4YKsSaNvQ10LjtJUNWU1qAJrG4nx+xCx4ugy+lyJKber1d0c3gH01x2UP3GryREAMpQek9mqHrgx51DEKUvr0WaU1E6eRNBZ7u61p2U79+K4TXXnYun6sf7pFl1cmLk2dg+PknLAm+CA7GwIDDNqTOjjfGIzVzTLEixHuisp1yerGhOEI+WxWRP0RayTJMH3uIg==</Encrypted>]]>&ScriptWhenTransactionEmptyField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=</Encrypted>]]>&ScriptWhenMREmptyField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b3aHjpvGaum3Q85M5YULkPzGnfWdswAw1UYfIoVKnjz227k3Moqk5bAtu0UJ7vOg+4WXWnQIZBg7emFdjW+8Iz6xz6sEFKp6m8o0oLhMPGvWcw1nTvBAi7SpynceSkztxpQFAzKo1TzyjxOYvbDRDEU7GMFdlvg4hBdwFGHDVzR+GT/RWxT2mj/II/mWiLqryThrH1AdMPsTZh01kz2pJJved5qAunxT3LHgpAstqwf8H8OAr9kTKbLkJ7xf3KAHkVrOBTicJrmICABkvkBSukGouUE9iLzFQWcg1c5RLVaFqQEgCNmhC/AA3d3aVs6aCEWE8u5dx1k9K8SmTGerLPqnTpEc+FHrjy2wOq1EI60rzhnr22ORq+ZB4cPg/JhMYpgMACgrJ0P6pY30tN/0GAzn6AVwAajq3Qz3vHPRS1UTQ+z21yB2hVrjoyoB/bP0puHVA/yuXgEuXWUl7iBcL2IWMK61WLD7BpM/isyM0L20lrSXyvfPy4SdZW3b9OpLuL99XS1fhpsQ7MaE6h+olibTvS1WlGf3VUCdi6ym6H3dbkr3WoQLo7H740WNtEZfId9w3P2FRsyzNsegCoyhsEdanp153trctzHPnBfYMWtHgSBNJ1zjLzd2V8V+RyKxw==</Encrypted>]]>&InternalTransportFormScriptRowChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP3A8OtK379rNmg5SA7ntCZh/xaOJhmmr66uXUfnZpU5LYhBj9vErV5hwL6PU6IImh5WcJbTS1MW7sqDsYwTPDT2kHJrLtfPbr753uKXnY3/5PCe9VsX4O8P/tNl8Nd4ZkB0s+wP0Ehj+jA2LL8oK9AlA7xCWu+vUPFeznTpNEi0UTJnHpR6tvHZkjeYPvWYQ2BiupUteCw4DXq04uZpQiwzepB6+F27ysu8vQw88re5clw7SznlX/anlvBbNCufsn9QzkTNoKVibZAgaAVLnmJEUit4xsRDMotH6De3HqNkBkS1Hf+TeKhlvahFqNvQ38qAkf3h2We4nGMUlyQ/+sxE=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeP8YubHGdsHL4F7ebTcT1gq7tOzEs71LfwWDo028OAlEObL/fNTdjgB+WFMget4gK/jV0igO78X3SJfa9eaFhUQ4DP8v83cgHw+OcO++FR14lomj7VTy9/spQQsPbBFN88fcW0ZKfpf/+nvb7QboEUKkoOf6fABjFWFMwxBUaKRUNq/xNH/AubbKNxRmBMBjj8pFF8v1UTNx21PJnyzugSkMIGCX1ypUimQIhIz1pibc1fN5lMjIgsshXB/6MsYqlpuuPvXPQ8jtSVsIXbpRpT2rt9DNOffPhu+U9h4l4pId9qOveTqtOlimiOccEaXXL7kmy7ugPsq4TSAq34kc+Hx</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyAKwF1Cug7C7QrMnlsiJP11VmYDSULz8nJeZIi3ZMjh+mscomrwaAS3cYGdKqnIJHNxqlvIZoaWPP7lPZ/u2hXm</Encrypted>]]>
      </text>
    </action>
    &XMLGetReason;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDoaH12GUsmy9u18Y5c2O/JD7et0clHdllpR2oMO3iZ4F+p9l+MYLXT+Kimcps0LLr8wHG9jwCpNOdn+sTWRWKQL9HJd0PIr1DsIY9C6LgOh/ayeymm9kNb0I7NDYCgh2HykC22TMe9RytxktGY9VkN7nzlQsk3IWaLOJRp2gaaw95cVfYgFupETD+Ebh6+7Y2mHF+Mpv8Gtt83n1mulDhjI</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ03xn50zNKtn8WVrJ9IU7Njl02svHsWoWEMoXq3wPDsjOwo65/jx8SYfr8FowTg9GvZant+UbmI55Tb+gyozOK/SbQw/wmJS86iJnsRiCFHNseAz2ZiscIDV1HmRpSFXrQxgwcUhMZ4qdd4Jn4F5QrhuoEqGn8ItT8cKqVvN/TISR</Encrypted>]]>&Type;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>
    <action id="Location">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUBaw+iIrby7LmkBmzgrvEx66GwzknhasqYZ4TrYrUjG7vXKGUYEytohfh8V8N352nJDm1cnG2Fwue/aH3JPJjjIedeNoJ/EM+L6HwCENeOJ5MS7q+hN6y3mYyvT5YxgeewH6rNAU1ALYZ7UkYy0XV430xMSkcsiQewg6iDBY3RrHQ==</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyDhyqO09d4WYNm58rtLlYYvKpwcR13AHRzCIerFf4dkba9zrC0WSKlk1Je7zwTYHdY=</Encrypted>]]>
      </text>
    </action>
    <action id="Lot">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4nNXTwSZ1E/2fUnpexg/xWo/ibhnMVV3RwEkF346tR9eZXflQNf9mm1rvwefuAplAkDZghfpDgRl5z9ek8ywTaNBLBPdX1eobjn6g2mdYwsv0ALP9VokBM4wFDt8mabA4vb916VNF2inDfl6bLpMEjUZ3clfLX1ybSJPq+hAug9YtdqgagwUmD099Tdl51RWMNB8GpMCY3eEHeJZepWLau1WApWGtJJcs683pgXini4xT6JTcgaE402rtGf6NFCpPd93MNGyE7WyJ2vEUU/49Kq9VXWddK7B/WHV9kvDatww==</Encrypted>]]>&Type;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08jmer1q+e9WVUBSsPHwzyDhyqO09d4WYNm58rtLlYYvKpwcR13AHRzCIerFf4dkba9zrC0WSKlk1Je7zwTYHdY=</Encrypted>]]>
      </text>
    </action>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    &XMLGridStockLoading;
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu//cyzhq+IV8rNamwNWMrlTSU3zHZCUSXits3s0qaeIG8XvOOpkHtKJ6eWuAnQHbSDDfZpafcC+myAl9FxjAn7yicxCF8C5iv7IDhqZvSG76WWjdAPx3thP6UOfh122zW/TBIHnSqw++l6NwVm9Yz65OlIWmm7W0h6Bw0IJgnO2EDFizGY3REmjVvne775HC2r5ZMlYAG/TsdTikQDIDC6/kjDZ+MeauBGNRtzQcj1XO</Encrypted>]]>
    </text>
  </css>

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

    <button command="Lookup">
      <title v="Xem phiếu nhập$$120" e="Lookup$"></title>
    </button>

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10">
          <header v="Lấy số liệu từ phiếu yêu cầu lĩnh vật tư" e="Extract Data from Material Requisition"></header>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Lấy số liệu từ phiếu xuất điều chuyển thực tế"  e="Extract Data from Goods Transfer"></header>
        </menuItem>
      </menuItems>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
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