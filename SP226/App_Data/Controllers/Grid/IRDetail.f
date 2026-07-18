<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\IRGrid.ent">
  %UserDefinedFields;

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY XMLPurchaseReceiptReferenceFields SYSTEM "..\Include\XML\PurchaseReceiptReferenceFields.txt">
  <!ENTITY XMLPurchaseReceiptReferenceView SYSTEM "..\Include\XML\PurchaseReceiptReferenceView.txt">
  <!ENTITY XMLInvoiceReferenceFields SYSTEM "..\Include\XML\InvoiceReferenceFields.txt">
  <!ENTITY XMLInvoiceReferenceView SYSTEM "..\Include\XML\InvoiceReferenceView.txt">

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\AutoLotDetailToolbar.xml">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">

  <!ENTITY AutoLotForm "IRLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">

  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">


  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">

  <!ENTITY ScriptWhenTransactionEmptyField SYSTEM "..\Include\Javascript\WhenTransactionEmptyField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY TransferID "IRTran">
  <!ENTITY Code "PND">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi117FM2kAGNaLZLXbfe1lsIvRMjXqAt0H2GKw6bnA3nIlbytB7qfsKnjmfuK9i0awGpcA3zSNFmrrHeyqY1LBnNNJh/ddnTKPNpuA4WnfNDPLH1eZ5KJQtH/UtdIgl3IUBNw==FastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaWQzN8XaRqGPES5rYAsmRVNEnJ8Z/Fmzun4gJTIBPC08Fc81r1Uz6dhLWa2D5rjDIqhP/rGeF5XPFQrmX2417ndIsMdRHJa1w1l27LRMTKn4OLVZ7JYfTVcfdNhJ5AVhYZX5ZGYHd6ZjMbSR3uZ0W7i5p43kitmEwYvpeRiNZfBTpi4+Z47piG5fsP7FXhrGmc=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY VisibleFieldController "IRDetail">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;
]>

<grid table="d74$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PND" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c74$000000" prime="d74$" inquiry="i74$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="pn_gia_tb" type="Boolean" width="50">
      <header v="Giá trung bình" e="Average Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" when="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" when="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>

    &XMLInvoiceReferenceFields;

    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" width="80" allowNulls="false" aliasName="a">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqNyM5e+K+001uXmlQsdSL1kAo6YZwlRBV9yRofKISY6aF2Y2g9wKbSulYMfro4K9k=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" allowNulls="false" aliasName="a" inactivate="true">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a" when="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a" when="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>

    &XMLPurchaseReceiptReferenceFields;
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
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
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
      <field name="pn_gia_tb"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      &XMLInvoiceReferenceView;

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>
      <field name="ten_tk%l"/>
      <field name="gia"/>
      <field name="tien"/>

      &XMLPurchaseReceiptReferenceView;
      &XMLWHReferenceView;
      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCtb9YJrExnX+33mIFfqU1QHX3oIxjSSEKwiBdpVVAEmg7/Zel2N+9lQEBfos/3/HXK4wTHhe239cmPfXozWf/XJf2UG5rhF5/XLLqeTBs3j4Vc35qrrhJFecR4l/SxM5Z00qHy0FjbaHqdxn47qrWTQ+sjx75dQgxB26g12LfHaEeu1pu1K0MhVSb5SrgGQS2/u+h1WVKvO/2Foj8nsUpkue1HdrZPcgA0bV70WTNxynJKAvuv9hUfi5DqowtCvJrL5xJEtbbKIRs0LqMgheHJzpprB5E1J8lLYr8rdrcWOMlY1pnnjD/C0TpGW51JTXeEeOLEyrxniRoVnqJeMhRoEbIunSwId0PvJulWkc2eK0+eJJkev/xorxnG1hXjZ0mC7atJQtqWCSnIvpyGjzxWggydvHgTAMxVtexnITAHkFcHZoaTLf/xDXhS/E4mMta+0nXKR2YKZ/AMkrP4J4fGADKTwEEKTxiYCMLYMS4rGkaCcPDN1mKteFVHs/AJLldZ/XE+GR34wWQa/lzYT3SxgmYIDKgevIgscs7POuJOgsOayY6KtzMmwhGu03FVk69Zi19xixcHmGVlgnciWTcp8U7SOyFY7xJ9epOTLckFg4hvtC6uo5+rXOzI7OdRimhJld9cJCZXL2X5+0cSexjYcyUbW3akLvwG6k0HAjSDkbyYthFDFudOVKq2Ai9haQutPAOV97Z7m7/diC646RYpzFPNlwo9onLePgj/Rjt7IjlUIX8Q3gJqUsqZF0zBuMnE+Yf8wlmwd0M8aqWoO2BCPRV1z98O4gNMh76hScxk0nRSvcSM9HtcNOLwnvSZOxkpNRJPD87hpbuiaNuD+yny4n+lN2gcAU2dukUGZ1xajV6P7eBn76pFbzta7vJte1lvBEk8mQ6Zfpdf9/CNz38f</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0JZchaZCXBsnZ/PKdKdd3KAGdq5ot8Q8MyrvACxy2vYGg3epnhTp/Ftsap86JrbHDlvIl2YZXjIA/dWVj7qQxN5jVyBz221EJXQaqK4Xfi6EmUSVj2ewijW1j/8c1e6RDznUBbFO4AEhIvYl7DtGaeMUNV14xaILgtA+jj3GTXHDPqdXyURkffvINI+Gn9uNAgbQTSEhHSww71sruF3866kiPfWBz8vIKycjEAsTfhFLbDxOds6fgXw+MsQ8DJV6UC66sigl99REj0nstx++hZ0MxRdIXdbm/HDp7YgxTT3bxBJ6CiBtzcmo7JLC9FD2R/w3RGQbkF0yxfqpPgaMsGWo3bsZO1Apt+kEAC19J7GsgodA2qClcQOe9flIevlxPsNSpKVYFM7KbX26NacUSk</Encrypted>]]>&AutoLotGrid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UU5A60twOY8v5qI/Z3blpMbNla9HTHypDvXskX+sb0vFLNwyUmFz73/cAtmMH4UKeP+9ZHWT1SZliC0aW7uWPfv6eHWEF0DiAwRLcJpk4CX4mipukMowh+hD2+6Cw7PBGuiEBDxNTZ5QASP11Czp/Zkd7ol5QU0a0exlkBMEbvK0aV40uPiCy6VppbFxb3vW31ds+pDj3vbyZ3fw2RpafTzea8ur6OTI9Gb4iAUbkch52zEDmSjTEnjrWMLBCe6QSxDMuE9i6GaEvDT83WmEh9iUfyLnTj86TKlcpjqP1N340ZSVLlVWc5MGfLppG0Rn2xqxOyj4zNQCJQXF8pBt0gQh1Vg+cpfgV/JS4rliwTsS2BxHM7nBGezr3D+f/KmnXlUqTkESbKPDW0JV+3BuMuObWm4ydU4sljvSKDux9R1sRCckafS/JysJi+kWBmKFCn1WZWIOHwMBXYgfn7cxEgH1A5SVwqHuTpOoCL7WW5ZdMk6yGDxfjvN0a1OxU+aSw==</Encrypted>]]>&ScriptWhenTransactionEmptyField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b3aHjpvGaum3Q85M5YULkPzGnfWdswAw1UYfIoVKnjz227k3Moqk5bAtu0UJ7vOg+4WXWnQIZBg7emFdjW+8IwWI9IKG+4BUYpb1msMzVdDFNRcubvDynq1zVWcaUBDsX8PDhdOH0bVHvL6PVvQGKf84d4hs0K6wQJIxNk5CyYGQlcLgHQcwkH6eW5Yc+qhAVXCoX9RlZSiIlAkWorozAUt76Mk2UnESK4fOkfYy5zaubVARyThvENI9pZo4JIIPrN9U0phuUTyrPh1CVfx5ZHfD5KJ1g0AmUhQvhsT0bFlGMWco2OXI6WorMHO3cvxkGx1MhSUMf6/fm2rHVMxHaChx5VUm5aZm/1RUt90J87xH3NMM4VMk+al0hAhnhXbdnmOqS5+frkuoVaP3Xm4qL5x5NGK9BVDRC2ZReGkQHEuMIftcWwGUk5Fd+TNIiv6LCylr8LLXfIEGhgBG86qEaATGvtpPVL/91Cn8SjJvzGc7rFzXzqCq/GNPI8Me7B4WueCoo3F+wxh52/1AkBMg/w5zRb/MHDGMdOdcA4dPSIXpDLCrOP80vR4r1IQRHWvNsdJZ10Fr9YYOncXwr/rrpcS+EEt37J0gBd48mi/Pn55MpPNOI2rk477mXOH17tVF/lV/4e24LZuRLxyL1x+v26KvoSpCqc/yNxgb2o5jD8eMKWbmg2iGIU+v+4J5RW+70pEdyeF0c3yh4lV0ASjUEY=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &DowloadScript;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
      &ScriptEmptyExternalField;
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

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
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


  <css>
    <text>
      &CssCreateLot;
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8Q9jZCpDncQ35A04Qny2BgfQUcsT+PoTSO8drTQb3p/8Df5D4yucGkIsK+LRmpWME+Ek8ZgPfPOCwAgyCjDJI9R/iU1M0HP2pBCbAL+DAqOp/f8F3qNVslLApUxdLnLmo17KTuujD7oJvcGeG/dUctrqcn88GLyKCBUme2j0IrOFRFpWrel13EweGnG6+M3tluNEmWZXJv69o2efU/MQbN0nZd8Nlg2UaV6t0RdVZVciWrYRz/F87OapYKxanAMtQ==</Encrypted>]]>
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

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10">
          <header v="Lấy số liệu từ phiếu nhập kho thực tế"  e="Extract Data from Goods Receipt"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Lấy số liệu từ phiếu nhập mua hàng"  e="Extract Data from Purchase Receipt"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Lot">
      <title v="Cập nhật lô$$90" e="Lot Maintenance$$120"></title>
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