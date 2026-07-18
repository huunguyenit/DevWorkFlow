<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\STGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d67$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="DX2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c67$000000" prime="d67$" inquiry="i67$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="status = '1'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
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
    <field name="so_pg" dataFormatString="@upperCaseFormat" width ="80" align="right" maxLength="-100">
      <header v="Số phiếu" e="Delivery Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Ngày giao" e="Due Date"></header>
    </field>
    <field name="loai_vc" width="80" aliasName="a">
      <header v="Loại vận chuyển" e="Transport Type"></header>
      <items style="AutoComplete" controller="TransportType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$dmloaivc.ten_loai%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrj9cKhHivQXcf9kd9kMxi2Ei8PSqsx9Kpw2gJWaanTLPJPITHoA3e31/+2oC/2VJ0=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vc" width="80" aliasName="a">
      <header v="Phương tiện" e="Transport"></header>
      <items style="AutoComplete" controller="Transport" reference="ten_vc%l" key="loai_vc = '{$%c$%r.[loai_vc]}' and status = '1'" check="loai_vc = '{$%c$%r.[loai_vc]}'" information="ma_vc$dmvc.ten_vc%l"/>
    </field>
    <field name="ten_vc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="giao_yn" type="Boolean" width="80">
      <header v="Xác nhận" e="Confirm"></header>
    </field>
    <field name="hd_so" width="80" inactivate="true" readOnly="true" align="right">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="px_so" width="80" inactivate="true" readOnly="true" align="right">
      <header v="Phiếu xuất" e="Pick List"></header>
    </field>
    <field name="px_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="xaction" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>

    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
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

    <field name="stt_rec_dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_px" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0px" readOnly="true" hidden="true" allowContain="true">
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
      <field name="so_pg"/>

      <field name="ngay_giao"/>
      <field name="loai_vc"/>
      <field name="ten_loai%l"/>
      <field name="ma_vc"/>
      <field name="ten_vc%l"/>
      <field name="ghi_chu"/>

      <field name="giao_yn"/>
      <field name="hd_so"/>
      <field name="hd_ln"/>
      <field name="px_so"/>
      <field name="px_ln"/>
      <field name="xaction"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec_px"/>
      <field name="stt_rec0px"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARqwFrVuF8lLP/vZB3qTqvV2C9fuQL3x2E6aHFEGh89qjPps7USZsRgzdR5luRZlVeCHYE9OyN6WBxU61KqYbapeTERQ+HmHraMCQTX/cZ4TBC5iQkHZdptO0kA3wRLZxS43it1UdMSH1DeD3q6CTQsYdgHlhUOWZnwzn6muYOa2uXFRbNEtTorJ4uJJ/Tr9tnjPZoFJI+nzg9zjeG7UiwkOzViwCdLo2HRf1A8kKSbRv703iVWXTx7GL6+3Em9nMaAHd1w4Z9t3I4lMcQ1yQl1ZtoDHDSKOcZ37YoftBGoDNT+qrktxeddb6C9V3V7+jeFZdWi4QjvT3ai4xm1R+U6DXmishJfn0bELRCYAEX+kfTt0pac7e8RvLfM+nN2pPqd4HTDKK7ilzDAvZX/T2MoydUFKIYa2bOKH+lQqD9E9JuE0pYWDxPL7Z8UGRCLx0PtxIBPneCqjtgYv8SSKCelZsWxosijhfa0Swtx3+Mg3lWzepZF8uFstT2k+z9p+afADxKQHKivy27FgDkB20j05jmGyLH04dGpEzx5ni0v3/tafkURAV7IUmjvqnPf2/u8j8PPeTz/+qppKgdqhid0x7y2xSKroFM/t7ncoUjoBcQDNUzk5FPl1rBzj347lLhHfBgOQnuE1oWh4zfylYmrlD6G2W/So+FjjqapXtNlMUnMK5PY6g2jAwFwE/dArx6sYqSWNnuLVh0SfYemFrOtugc/u96GbmoqVrhKPb4hOJ25K3hQVRO6CqpTgzlm0PpaX7wA4M93C27sGo49sqJJqze2gQ0zPgJve2lZuTekWL</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx18NK/5GJX5pvm7fwd70wNSe0tG1sSqgumBNtswsfo3+gd47vwTHkAAAOH0YIWVCha72tNba9CCwm01QjjIHl1o2/osE6qVco7DIWmO7Go2novgkfGpldwutS2aTBxUgL53nxoTF5gn1D0A/ddHUATTykhs8H02gtNnDogqt07E3uXivXWGeAljz1ROsDwjSA4PNqA9Ks1/qwIu+8KAxyCGAKpDfhKOmJKIn6bqeHdPbkwAIKpE1hIcMBcXtOYmnyGJxpnhe5IlWlSA/3liUC3xK4pTxnRvT2d/WhvqtvRozKKo+62iNzzKZv1FiF4zwepjVezpdjec6M64ndBwChxx3V0zYAqejFOp2pyW7vhR/LY4vRPWid/4eyDcbctatCmHIYWI12FTOD4rUJwm3wsTCMNMb7k6R2MXiW1T2wIB7A8i42NLfNFDUrJ0UC1/uYEmvzhCoxmMI14kvNuMHUs9oubrVrz5OH2fo4GaD1QbJd3IKIYQe+XApVeeQwxT4Q9/loB3Nz5o2qlkGoHYtSg7XewmbkFj28in73BANG0ZLX6ggzzkMNw4chAD8Iv/jrUKYGOK6lKFAaLE/GB8eg2qA/A5PSK6iKrBxiAdiDBapO9upz5XnmkDIgCfsw5Tozo=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5JinaiT/IEP/TNM3Ct/NzzUNSEplouyFHZGZPViQ+RXjTmSiOAwOiVt0rQCWwrQtd2BJIP7mF16pWYDG1Kle5fMw==</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cLk1tzjI10xZsjnkvcez8b3</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZ5ysU5BnzLGeeQRd0xoiDQucFViV8OsQbw1fF5RmhTV94xugM3lsWCo1JC+c7GA8qQEbClvIRdbXvLIqgg9IE6IwIIHOfq+C+yJwDfH79ojBudn7y3Csgf3iZ/d2huMek/sVp5ZGoV2gYiBNm+vUfw=</Encrypted>]]>
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
        <menuItem commandArgument="10" urlImage="../images/Menu/Invoice.png">
          <header v="Lấy số liệu từ hóa đơn"  e="Extract Data from Sales Invoice"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Lấy số liệu từ phiếu xuất"  e="Extract Data from Pick List"/>
        </menuItem>
      </menuItems>
    </button>

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