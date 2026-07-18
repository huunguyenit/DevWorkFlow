<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\WKGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d36$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HDF" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c36$000000" prime="d36$" inquiry="i36$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="dvt" width="50" aliasName="a" allowNulls="false">
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
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Hóa đơn" e="Invoice Number"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="px_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Phiếu xuất" e="Pick Number"></header>
    </field>
    <field name="px_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="sl_ss" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true" inactivate="true">
      <header v="Sl sổ sách" e="Book Quantity"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[lo_yn = 1]" field="ma_vt"/>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="tk_dt" width="0" hidden="true" aliasName="a">
      <header v="Tk trả lại" e="Sales Return Account"></header>
    </field>
    <field name="tk_vt" width="0" hidden="true" aliasName="a">
      <header v="Tk kho" e="Inventory Account"></header>
    </field>
    <field name="tk_gv" width="0" hidden="true" aliasName="a">
      <header v="Tk giá vốn" e="COGS Account"></header>
    </field>
    <field name="tk_cpbh" width="0" hidden="true" aliasName="a">
      <header v="Tk chi phí khuyến mãi" e="Promotion Account"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_px" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0px" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" width="0" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" width="0" hidden="true" allowContain="true">
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
      <field name="gia_ton"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>
      <field name="px_so"/>
      <field name="px_ln"/>

      <field name="sl_ss"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>

      <field name="tk_dt"/>
      <field name="tk_vt"/>
      <field name="tk_gv"/>
      <field name="tk_cpbh"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_px"/>
      <field name="stt_rec0px"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS2LE83QGkV7z2DKu4jcjxFfvI7WoKwqHisescQMr425WkzP60kVFDgTZF/TTNJg2Kse1PwB2Z9AoYaRXeIRmaO7RpOa1HpX2U2a4/mojIFVGkIQ41AQfVXwmCUml7P0iD5yncKTI9qr+3MBymTx8dzjSDO8ccD6p29MgsTjPF1F5HNKlSTtSwJoii30+tcxaT8zDbGdAo9fcaq8/SL6boLKIRT+I9FWiDklYguGdMbptHO5zrruWoJR57+rOwdpdK9YfoVe0pdXynhngii+JmT1JkRXssiGon8wDpv3FKVpYh8pV9WSE/Hp+aJbCUvmGUTYt1UURxztJ9lOo8tTklUTYZvKbgCSpEkBQiwSm/gG2sKhYs6iqfe989rjdNof6s3UJ7Iez6VNMZjovfddAy3jxl6qC1wsChtCW6IoEMJX4vPaTuv9p8kxomiq8a54EVHUqocRtIDyEDlfYakBDmqPCyvlHpQYjP56KEeSg5i8VVReaguZf8poshjpoZH03dEp46P7dsbyT7YKJ0qi2VNaiG3ynCmLJ/N37hNHFTAtI8pD0s2YTV2Oe/Wu1WRs21zbn3Klvjwr+Oma/cvgRH4Nz+1O7PPyO/Yk+2Oqr7ZYga5sY8xWvfdjvkIOXejFBS6DaJI/CIWas3nzDBZZk06CMBWIQjpIpu7ZkoYzVenBi+e9qQoHbCKeynFOowBEQ64kOB4cthiFstBofgMDMDxtMeWFFf4F0QdNzG6NJ8Ue8RQuqD0G4nIo1e9w86vxK3vxCCkoZjdueZHoLbbmK7GH7cMuMbyiZPh2zhx9VwBkQKXwlSTRoLcISsfaGJACxeBMORbZXWCTawUX9XvBTyDn</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGquFNDqn7QPyNVX4Cdd+5jnN8DWFIMbdx3k5Uo8sXidAOSskqITIR6UYSvt7mzYJRJt8Ndp+MD0DEkARQHvZtwfT9rDez/chJHHR3m6mEh/2wOC6w+CZAULDxCJgv6Cr3Xam6JBPbhKnoDzdSPqjIKEogy3ZH79ZkRRRwSRBbTZWZ3lub9iWCSma/4lHlp4SPXzubhY8Y3Exuo/XsgQU3UKwklpiK1GY0zJXv79jjOY4Zc4tnXN1kxnWEzfRJcZkDa3P+WDffDkak5sMrR2/bZSxAaDDuG7ldTDGQ9vgfCSJ1jxfZFkAtMy/nrtCtwnpd8Bek2P69no6UmYl5zgoUrPrIcYbvc7cRQgx2PdmxsaqMK4jCTKYltWDkjPQf4YkXZzPwji+AI+auL7utPtuRLfpwTIV9JdmggvcriQ7ejmOrvms4LNV9hSBV2NOyPbEJ7Jg1VBAk7CYxdmP6DkjFvJmDpc8wLiLUJxizzdSsgYt+DcgWYeZWERq/J80glpdeUNRjWuiNcKCgPlu1UHPdELpY3KCohybTz6I1kjJQB1h75IE2Ns5YnwLxr7KWpoinh8vOznfd7ayVed+6q+39ThwfgRg04LDDlPqXoG0pnYmmU0idKqUXhBwvBzWhF6cHucCOmzTTYZ8B2oobBdCU15f22udozhU+TzSXUe6VLW4BY6TMqtRl/GJsll9YJd7H/YaKx+teVBQTCwSx4FxtMIoFQJ9zpIvuiUTnOnS+C3f391qVu4N6udDXDRfUbS24pKW/7wIfWGzo/pU0vsv2p+VP4R+KVMAQLwOT5I4TaSHfkk9xkuzBVUSzzDbLwESggDz/vVxONnH2wvzvNucPJH4Q2/G3iCEKBR9why1lhVQcXes1sLh9cStRFTv+wa8+snOjVbuwUfgCnzWFlS3Jy0Q==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&ZPpDtEydLHy7AIu0ErimXq8G8grBgbnQvWjf9El/ZSO4JZzGIwG8Owa9/X8xUBvFrbcKJ2muH5B3yPECo7ZXdRgAy5MDBC/ymjDa9oZ4KD1pGspBxxwQhW/64yN2cgwIoBKQ/LKTireXQiC9CBTWjdvuPiwWLWhvmNc0X3zkG+S0+PGUj8tUrL0v9Lh5LSJ+7gxqqgnCWpG1Oe4rqWGAIGF50kaMt26coaGSDjxiN+dvG+BH1VXIOf/SB2sqPsSYfWxJx8BHZieoEsdB5PPwSTi6Kekmlr6wVgT76SpCtp1R+BA5Z+UTmn6GeWEoqcpU</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cJoDG9zD0J3ousr3/VxQmYm</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&9bBXgmS4IUqbn/cYhF1UTAVsc+089zXERUTisJ9E9zadmD66kACGb+YjYH87BVx2FZmrFyUsQvlaE94wLYqBsmsyqKYjIyPcoDBIP75h6mc3MiqFWjRfOEJ/SZvBZC3wACDGQkGISdeQ/KKFeiUJ+w==</Encrypted>]]>
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