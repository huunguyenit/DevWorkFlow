<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ds7$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF7" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs7$000000" prime="ds7$" inquiry="is7$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" width="100" allowNulls="false" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" width="50" allowNulls="false" aliasName="a">
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

    <field name="ma_px" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQo+ReOPxLHsUGOq+nfYkAztW/yc1+NlFcJjolV0c/iv2+NFuYZXz4RG3UoDF6Fa0Nc=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0" aliasName="c">
      <header v="" e=""></header>
    </field>

    &SiteField;

    <field name="ma_px_n" allowNulls="false" width="80" clientDefault="Default" external="true" defaultValue="''" aliasName="a.ma_px">
      <header v="Mã phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px_n%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQo+ReOPxLHsUGOq+nfYkAztW/yc1+NlFcJjolV0c/iv2+NFuYZXz4RG3UoDF6Fa0Nc=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_px_n%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0" aliasName="c.ten_px%l">
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

    <field name="ma_lsx" width="80" clientDefault="Default" aliasName="a">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status in ('2', '3', '4', '5') and ma_dvcs = '{[$ma_dvcs]}'" check="status in ('2', '3', '4', '5') and ma_dvcs = '{[$ma_dvcs]}'" information="ma_lsx$vcs2.ten_lsx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtftq4X8NLKdfCSvIeCm22xpCcHVFVepPKe+EosO9ZUSshNXDzaqLyC021b495dmo=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd" width="80" aliasName="a">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="ma_lsx = '{$%c$%r.[ma_lsx]}' and status = '1'" check="ma_lsx = '{$%c$%r.[ma_lsx]}'" information="ma_cd$vsfctwo.ten_cd%l"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="Tên công đoạn" e="Operation Name"></header>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
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

  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_px"/>
      <field name="ten_px%l"/>
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_px_n"/>
      <field name="ten_px_n%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>
      <field name="ma_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="ma_cd"/>
      <field name="ten_cd%l"/>

      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANP+pl12wcpq/b05VIXZBplJ6RKGQ/i10U6VIkxiyGbBSP8+c+XYPM64Cxku4oV04FWyhD4ufyzHGiT37R6lbJEA==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKV8SQqddMG9kdcvUjxHMu6bzSZGQTwdbvEgcxi+kcNHACK6ZzFtTXa9o2LCkFeYcXe+AlMUWjmyygqGA9Yq4w2o</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+Y9VV/6irRocXNk5gs0BNVa3giDVRFisipLYTaIeeFPijPtMK8AgAEflM4c6De8TOJ9a/I0ncGX4Mg5THlyCcoau+8vMjcUCfZdlvVzPD8O6bWLBWPje4nequxNn31ckrkGy5OL+6NI8/7vwbKpu6EG9kLcVWMER33sqNBDibM3Zvx3HkKLIBdylM4IZECGkfd0M0bGr0HZ4plkOuaPrlq0Lg8Ya6LPSjxEFNkDRDzTOqPYa2pi/z4RTe0zgqXLydNa8Nt7/8VTbQhQkr3ea6JlZt4s9q9OhKizQ4VPzSkEwSIeXFQea/kyuc128SInU0a5wkawr1eh530YAkwybG9czTvZEETp5cfHD9ZHyjQXUa0a9F2CrmBR709ZXJiDVRnA+pugh8hUFe/tYtfEpd6jtrJkyytPaeBlgfA9lSoXgXRi1xakqBbwQEDIw1pFEQRnJAJhMn6Y0bMznnzdWLoJg9CCyg0KdSbesUrlrilIsgvxtb5AmUirDuF8T3M1uSFCfmpSrGDP5a2QcWFkSwX+csqjsuM+02E1ypFblK87Wh5UQ5ZcFMCzEWtup4Sye83KDxEV3yBfT1HBkQNtDzcEVwUHd66RFFbYy6BIrLQXO2beUmYt10TR+zfuQZ89oUbdQGPzExTJLnB12f95IqrKohlgi2Q+nTO79oZtWcPoiGH7t9qFcoGkhQADotIuE/+aCAd80sjOrwYA+KMSW4wVCPYL6v1yWTVZ8zjgMny5drjpF5z5gpIO8YpHt80L6pxvJbAcBLPWQ/PZR88ruOHAtJ6LguollWPMWZ1DvQipqWHzpM/zu+rsCg+/ZM7EpVMb/T0so+bFCOuXqXXJVdB9KVtWyiMiqM2yoxhfxcn+QCC4g+okSGGy28b1nNqLy0oCGzAyP16muSxhPp/kFNqQxtrap1Gu7b7Ow0QbP52A/aa69T7MXDEwD7TGRQincvlkjx97HiVhr0EB73WsthER2WNEMOt5z3W5BjG+p1btvGm8Ao8lIw6QBkmOGyvRm0o//mePBboCl4ttVOVt9Vdq2HGAVDCjKiup5zlH2cNyNyFfoiz0K5jk7cx0LodsL9LzMPnPB2GDVXXPuCX5uQX2PqtQdHJwihlvcm/z4O66J4vFHdPhOK0jOnpbv+n07Gg==</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5JHr29nkatCveVF+YScuM/GE9vADbRYXI7aM1XtD8MZGU9McHF9J7YsQ1yHJEHV3spwFTY2cSFjP6owQ+q+4AkG2BTneDk+JEJ9P/M1dKo16M=</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4RZo2Kspra5iVKJqsdPNhJzb8LOztU+bNOX7BJTnaC9gqhEmtfGXCDZgktWyiTMWsr6YTez5JtrnZuaD0f85BbyHqsB1Tj6FczYWfaAl2yS8A==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>