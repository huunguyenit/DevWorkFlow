<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\ISGrid.ent">
  %UserDefinedFields;

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">
  <!ENTITY XMLGridStockResponse SYSTEM "..\Include\XML\GridStockResponse.txt">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptGridStockRequest SYSTEM "..\Include\Javascript\GridStockRequest.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">

  <!ENTITY ScriptWhenTransactionEmptyField SYSTEM "..\Include\Javascript\WhenTransactionEmptyField.txt">

  <!ENTITY TransferID "ISTran">
  <!ENTITY Code "PXA">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi117FM2kAGNaLZLXbfe1lsIvSeaf8Ev1f8ZSxQNZYcVZPp8YZBHBtMlAI7pPfn82C2uz/DDkrAaCfCL4PP3CgjsP6mhS3rNH8j4EdiVKuH3AmzaeAybbeuzmxnsuF+5yop9w==FastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaXz0UjOky+8Sh1k55Vq/1f+2//EV5BNWzUcvHGU8xguHjvkTiJCsHoAf5trg6Hq69rRpc41XGskAymWaHguVHtjt7Evv8hMfO+8LoeCuufSzXwjVP0BJc78zPeNfxo7Nl44Wg+6OncRMIZ1BfH8AScSdvb6XoM6y8hrw94/m3Ei2MWXakfBoHQqmzpyCXQK/O0=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY Type "2">
  <!ENTITY Tag "">
  <!ENTITY Ext "70">

  <!ENTITY VisibleFieldController "ISDetail">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY % InternalTransportForm SYSTEM "..\Include\InternalTransportForm.ent">
  %InternalTransportForm;
]>

<grid table="d84$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PXA" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c84$000000" prime="d84$" inquiry="i84$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQooA054J+wew50DMntVAonAbqYhTTcCO+LPvypIOqklUz5gWARmqH6KMad4CB8YD7Y=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQpl1MgJeW5LDnfl3Uwo+zcYb/mbSpl+HKDk0RRwQNroW0RcBA3Reyy1JEJLQm4Dth8=</Encrypted>]]></clientScript>
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

    <field name="px_gia_dd" type="Boolean" width="50">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="ma_nx" width="80" allowNulls="false">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" key="1 = 1" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrVdIQ1ot1fbMQ824W93TqR8eblBVo9oT8IhKHmdep1oI+3mQndyuhxaNfAhCp/9tw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" width="80" aliasName="a" allowNulls="false">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" inactivate="true" aliasName="a" allowNulls="false">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
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
      <handle key="[lo_yn = 1]" field="ma_vt"/>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
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
    <field name="stt_rec_yc" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0yc" readOnly="true" hidden="true" allowContain="true">
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
      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
      <field name="stt_rec_yc"/>
      <field name="stt_rec0yc"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        &VisibleFieldGridDetailShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+xQY4Ac7ybHaSG+Lx5+tnMA/v1zen1uTZXHUMiTbUD+4bVd8Fx4PPMYaEy6eF5WGFy/EnYvTpX27FhjjP6GH7eF+FUOTY6NfFWUY7SzlK9AbWPLnKaw9KbnIqu/AycEjEDx2FJsyvtCunHym2dbZ+SaKEfm7g4FPPpk/rf1Mc3n/a9gPmYFQWuzW9loCkU1Pq12+6IAcpEN/3PPbmj9acduyI/U2fReRKGuh9m3iDjp7s3C0OQfp0J2jliwn38J3UI+8Jf1mbVwr6hHlQyKyERtpCOTifMRzy8mUOsQ2YeOQ</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS2LE83QGkV7z2DKu4jcjxFfvI7WoKwqHisescQMr425WkzP60kVFDgTZF/TTNJg2Kse1PwB2Z9AoYaRXeIRmaO7RpOa1HpX2U2a4/mojIFVGkIQ41AQfVXwmCUml7P0iD7TYtiwIA1D0vDsXX2jwW3r02YZ7nogL68W+FV602LW1KTuhV8QQ1IauJoeS8p23ZKoUMuK4EHXE+Psp2JG4p05tMXU/TMhUASuTH3tXJoqDK2QuBvubo1teZlACODQjfAg//njM60UPjRIm3DCCHXI1GOG1GZ9jZ05VWCiDpYdm8h4hptCuJxtcS3flj2XmUCzDwlaBLIyqhn/aKzF6EdgaJ0qXC1SOTpoi8NZ7A+ZttIcPPT28j9KU/URySdqWjXHGEkuP++0xoX2eb3EbCxfOunU9juqyDtYKYR3M686OQAtaPmJt465ZR484zJPUsYWAbjPfVNntzuQSgQk7O3gJ46dRFPdkYTzKkSD6EivJdoOEadSfQp1Jhooq9Wt99bhsZ7fTEKIq6FBubZkJrUt9SKMIKTNtq7pOyFZrFJPg1iZL5Qf6NPcYkQRwuY2O9Oi1yaORfnUszJmH4BElFmeTc0Bl/zvDLr8o1D+3ePOGVgRV74Buo+QDlVqkVGcdEPoQmPE5oEtCRkxrH09NntjML9CXw7lpEptUl/d6vSraEvhOYsTnNaVlqkefwWMjqiuUD//1U1l2C4E00oZXvHaPxMUMvkjIwMG/OtF3IFlhqpuyFix6oBz/zJcGdwyMyqFpqDusgce3yWXogP6uXtdyCyF0ZGs4SJr3zLXtCHt5/RR4sYjdZrVjKzMLUr8zrYKumTkB/2hkioERAbTjGG5</Encrypted>]]>&InternalTransportFormScriptChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RIsITZ7+NeClUioGR4sopSVO2BjnGLchlLtk7s2Pv4MODWu9elFIyfLwKED/9JCNdWddYg9qUI1nZkD+gMZMPU2EH0UaVds4TwTbfpUlRgaWO5mHX81QqXsa6XCQBMyflLSUHDUBbPaqWq1zNXmCeUWCSTNe0H8AdYsAbf364DAFR8rlhyL9nLp7rUUANchTpGM92p2PPbhIWg3sxBTQCrztpzPf0AhMh7PKblxobvJbRpAXzUcaQVGhOwRy/N/M5/VKH91BizKuLyL3B5BxEIegbSon45l7dgRC10Usf+D3SsC0ulgrZb9jl3aHR0OepP6qM1+U/0tKqHX9lvO3SYqE3k5sidDkkXd+jtQfBaULtcdy/tCmxgVMhrxzC40p3TWjCs9U/KUlsZqbm0cwg4/yjzdLncg07K0pO/e+Qk2Ue4rPcBJyXQTADsljujxrMD6S/2Ez8wuWvxWGfJk5CmxU9gSaZPaU4HO7H3UUOrCym3u5JF3bh6c3KSvAGCDlSw1K7kNpddrJeu05J1+RSlEEUUzx+fV5CFe/Vdj4mXt9BzZ35qkzsbqZFt05p3HuiDrVnEaeM26scu5WvDl2ZArE9Ev0LMXAY9ISuDM3WUdOgSjl7lYoIRIiVEhIGVT+FvYGNMcDP2gAoAX0H2HfTPod2sUQDplFRVv0uTq53KglAKblb0mJWIfzFG38f/IyPBaG260BqThScVg5hpFtSx9pXPeO6Qg5GkA01DfkKZTuwrTdgJpijERAHc5Pe5xx3nELb+GyTKPLs2L5HdPOMXkYm+BnRyZ5yHsYpp11703weKaBn45AtOtYWSvHs9sWvqhqka5Dzv/J2DawK9Mpn2LwRm+DOJ/Kyh+wCDzf0G6uZDp+qclo1yInAQujd5VirU31enGFLEDRctcciiKuphTvVmfRButwsPtF1OrIWbhSMdJ8wBskDTyr1LtP65Pwr+7FSoH27aPdth3Y7LtUPyZ+4MihK+IE/dQjeIvrr7Wy7sfb87hbzcEM3F9kcCaM7i8aJvx8A4PMsOcof6KFhEQP1s76SvthT4MK33owaWQ01zr2k0YQ/b/ZSZY4DBik0cj8z2VMCpulu0L/HpoGJdTzCla6zHW8HX71QrfUUwyqth3opRbRXrtLeaGHuwfIpZLTKT6IvoeyZuKmW7wLLoJawvzDTyaq8effg3UOY1bMp+rffVmY/Kh8/topSHf7TtmNnZG8wUm/OROJ6+GuG7hzpfy2IMeAzstyLSDgXsFlF3v3EpZ1/1f9bgZHRWbcw==</Encrypted>]]>&ScriptWhenTransactionEmptyField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b3aHjpvGaum3Q85M5YULkPzGnfWdswAw1UYfIoVKnjz227k3Moqk5bAtu0UJ7vOg2+yqvCM2f2Dml1GLx7Hc/z1PHfKDJNp6zDLntN21UYFGs5mHiGXPIUDUf5DK3FPRSj1N6PTr9luI2zuyu6/i2WzCuw7UMyFZXngXZ6O7e/R4/vuI7zMYNlk1RSa+hg9Q6sYVhUyWmu8PqZG1dYSIhFjexuCU2tK6CrTWAn4bkMSPP6xWhcZLGzap3nbTYvxgv8qSeLQaeRUFB/TJOWZd91SuAIt4CFXpOwx8cgtYDDUviXOcYzEJVxV2eP5nOJ0twOiCLfAZFd7tUKFw37JYE1v6Rl6sYNnq/+TzV7iTQi2weiIux2nWW1QH05r0G+xkoxWvVHnef6zdQ0DXaXZnxyEfBVnCL/q92LHyr+Swx3sVlD2A+BtDhiRDdTK6eN9PHrGmdqhPxbn0SdDhbQO1mLPV2Ikw3XmXELNPaARbNjY8tSlVPwCYCTwFbnweFrJUeothL/LmeTfAeViSEz/f/5/UHN9ituvalcgE7E4IMFwJ8NWDZfE+y/eennojTmqh0KZy9pwHttEUdzLjY96YKSfH1Ji05kd6XduPCq/qbTSOP6Ss8hGOsT550hmvCbF12P+YbOuQ3R/uZPx4jtGdLg087P4xx9F1WVluNEj41A9roM4T+66gS3rt0R4u54zgdOywNVP4o/wjC6VAbLHf8tkZ3CKFPfc1KSav9+fbG12UsSxzO299iszb47fwCbBTRXSP5oZ0MNzJSOlgkq25a+n2RJSk4jnS7lxSS1cWgFt4aTIcSUGxDcxpbOq/bRp/G0i4eOfy50aSE2YVayuQP0=</Encrypted>]]>&InternalTransportFormScriptRowChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPz7S32jM4tPyuw+uJspUM+g=</Encrypted>]]>
      &DowloadScript;
      &ScriptGridStockRequest;
      &ScriptEmptyExternalField;
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetReason;
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDoaH12GUsmy9u18Y5c2O/JD7et0clHdllpR2oMO3iZ4F+p9l+MYLXT+Kimcps0LLr8wHG9jwCpNOdn+sTWRWKQL9HJd0PIr1DsIY9C6LgOh/ayeymm9kNb0I7NDYCgh2Hw0TCFc7dzbzyQJ623pCjpx+cwL6ELFQ7FV8sHOTBPklkIlBDed/SyQH1TQVV3MQjvAv5l837ivXX7JhUuDEwrU7z++U3wZV7UJ4FRDFdJfCMjeTbqnqttGOrtw2m6nO3UJS/jfAwLBd5XIkoD8R73d8haERww+SBcdk+d7mlNFEw==</Encrypted>]]>
      </text>
    </action>

    <action id="UOM">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeP8YubHGdsHL4F7ebTcT1gq7tOzEs71LfwWDo028OAlEObL/fNTdjgB+WFMget4gK/jV0igO78X3SJfa9eaFhUQ4DP8v83cgHw+OcO++FR14lomj7VTy9/spQQsPbBFN88fcW0ZKfpf/+nvb7QboEUKkoOf6fABjFWFMwxBUaKRUNq/xNH/AubbKNxRmBMBjj8pFF8v1UTNx21PJnyzugSkMIGCX1ypUimQIhIz1pibc9NUGpswIIOduEOCUVo79tfmFiEeg2LjC6sNWTPlk44pxKl8iqHGPd9hWpghittZs2ol8RAaISq0bkjWJesHPGGUA1MJvvTrMiQwVGc9tAsBdlsbh0rp0W+6xp9GA9/YdsFnmkZI80udoLblli2oy/Y=</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbePLRP88e0/Y0htLZXvhZ2/Ht6G7RJIv26Z2htKkAECAjtIE8kXKOhM0PonSTAtLul+aJbwy7nlG+6EGYOlAY3rnic3yfGd5J4MVU5L2JQklf+t0W7AC2nhSQ9UzoXPHsUCHYmW5xFibYHzPKvwuOnUx0txOcAAifNVGAzA5BkEYyVyUZRRKO1XC5iOiN1T5AXM=</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e7PzRebm8TcXrldjKa34mlcc1OkOZChRy34A9X9uxMwAMFDuMP5Gcdrf8Oz4VJQ/T5i9vOEnQ14lBustyg4i74yQIdHlubfFAULxYI9c21hHt9yCVvq5ZZxD7SV52DXfIRueddFZTh4Zb/dkz9iI+m26wEgibtN2b/TNLur0CAUwwuhVxdhc7FcfV8t0MyOOas=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    &XMLGridStockResponse;
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
          <header v="Lấy số liệu từ phiếu xuất kho thực tế"  e="Extract Data from Goods Issue"/>
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