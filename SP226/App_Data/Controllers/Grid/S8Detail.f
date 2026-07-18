<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ds8$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF7" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs8$000000" prime="ds8$" inquiry="is8$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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

    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" width="80" clientDefault="Default" aliasName="a">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status in ('2', '3', '4')" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l"/>
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
    <field name="xtype" width="80" aliasName="a">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="SFCStockType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$sfdmtttk.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="Tên loại" e="Type Name"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_ca" allowNulls="true" width="100" clientDefault="Default" aliasName="a">
      <header v="Ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1=1" information="ma_ca$sfdmca.ten_ca%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtftq4X8NLKdfCSvIeCm22/UFGDfMKcxigYXGUqJQ16l3PVHLCv9WIbhNTVfFWIeY=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="Tên ca" e="Working Shift Name"></header>
    </field>

    <field name="ma_nc" allowNulls="true" width="100" clientDefault="Default" aliasName="a">
      <header v="Nhân công" e="Labor"></header>
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1' and (ma_px = '{$%c$%r.[ma_px]}' or ma_px = '')" check="ma_px = '{$%c$%r.[ma_px]}' or ma_px = ''" information="ma_nc$sfdmnc.ten_nc%l" row="1"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="Tên nhân công" e="Labor Name"></header>
    </field>

    <field name="nh_nc" allowNulls="true" width="100" clientDefault="Default" aliasName="a">
      <header v="Nhóm nhân công" e="Labor Group"></header>
      <items style="AutoComplete" controller="SFCEmployeeGroupDeclaration" reference="ten_nh_nc%l" key="status = '1' and ma_px = '{$%c$%r.[ma_px]}' and ma_ca = '{$%c$%r.[ma_ca]}' and ngay_hl &lt;= '{[$ngay_ct]}'" check="ma_px = '{$%c$%r.[ma_px]}' and ma_ca = '{$%c$%r.[ma_ca]}' and ngay_hl &lt;= '{[$ngay_ct]}'" information="ma_nh$vsfkbnhnc.ten_nh%l" row="1"/>
    </field>
    <field name="ten_nh_nc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="Tên nhóm nhân công" e="Labor Group Name"></header>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="loai" width="0" hidden="true">
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
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="ma_px"/>
      <field name="ten_px%l"/>
      <field name="ma_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="ma_cd"/>
      <field name="ten_cd%l"/>
      <field name="xtype"/>
      <field name="ten_loai%l"/>
      <field name="so_luong"/>
      <field name="ma_ca"/>
      <field name="ten_ca%l"/>
      <field name="ma_nc"/>
      <field name="ten_nc%l"/>
      <field name="nh_nc"/>
      <field name="ten_nh_nc%l"/>

      <field name="lo_yn"/>
      <field name="loai"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+Y9VV/6irRocXNk5gs0BNVa3giDVRFisipLYTaIeeFPijPtMK8AgAEflM4c6De8TOJ9a/I0ncGX4Mg5THlyCcoau+8vMjcUCfZdlvVzPD8O6bWLBWPje4nequxNn31ckrkGy5OL+6NI8/7vwbKpu6EG9kLcVWMER33sqNBDibM3Zvx3HkKLIBdylM4IZECGkfd0M0bGr0HZ4plkOuaPrlq0Lg8Ya6LPSjxEFNkDRDzTOqPYa2pi/z4RTe0zgqXLydNa8Nt7/8VTbQhQkr3ea6JlZt4s9q9OhKizQ4VPzSkEwSIeXFQea/kyuc128SInU0Vt0HEYvCs3EGUbOh+wR0pTq9zZ+A/X3iPbaQGUbme2dc3RecHueZQBUgnnMl6ySp6oxJkxPMxAhpyOx55vFaM67gKwRcjCkynne2m6/BlQVSgfTHxlhO1xU60sxZi9yvgO7An8gvHZBHm92Mi5E7i99aIx/VJXSgY1WpQT57hu9Hn6PewAuqBV1F0pXRwJpDZydmSxs8fySy6d968Cqj6O9+c/MszAghRcgoPsan0MSgd55L3nVXYHpVbztMRlE+JBhyB3vk5BtDQ9wkOddBPH+sx2BejgMwETIeP0bpFt/6VaUJ4cJPM3Y5F9R734lcLr/9wfpG2BK0yT2lAZ6PnnqontCY8McSWqKMtOk/YMqlPcmYNJjeD3fMzdtxNKlT4uz5hI9/3FYPAg8uJFO+QmHkNjRg6E5+4LAJ2mTM2fyx9+jqfHKdXd/0aFwOBIcbjdiEisbIYVECEwMGjSRAR7q8bWu7b7gPlZqqnbnMpp975l3SHtY87lLBFNrnQs4CJoe2MGz5xFbHXNCOSjAEQWDvE572TPLwAk2lqffNbMWRBnvyyW7c22v9FVCesxjg6wtuI1GMJR0SGjD1sWgHGE1LkvsvUqvin1+RVrrCmFD/8QWiIPPjmj7NAlJpQGAYRkT7v+YCxP7FiQNC2ocy5Y4u63edkDXn7HFbaWIp/mZmkm4+ywXMjvilRQFdRpBVWaIDhSF9XrkubFC00K6hoRtykirIwz1sj3NKEdBEmRh</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5Js58cXU0HfEEeEOxrgmkI+c0GTi3u3GcJUuYkTBz1odFHHyCWlI6E76AWpB3Qquhoiplt+9UiAdvJJHo6BtpQzw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK+w0/7TuML2kYZ1eE3mLRhdCaEvPJxREL+UILLtzYqR4ZW9hOH4q8UQ1gZXgsaYZwE1OYq1Xz5YWVNdWL+Gg5M8cZK7QbNJyO0VWEDJc6AWOu2bIgPkLiMkqENuALNc8W/y6fFtI1iYLrFaNLXaymgPr6y4bMs29PYLffOXAzjkVQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>