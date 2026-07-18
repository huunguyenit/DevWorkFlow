<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\WHGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\AutoLotDetailToolbar.xml">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY AutoLotForm "WHLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY TransferID "WHTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnp0LVoHti8feA6r8qn9qM5xsx06CTGYDKeXA4oeeoVXO4vnrtT8+ceVl1hTqKPDrMxH7Yf1KIl2B5CoABwwX/XcfgZmOeVGkRMCy4tCEX0hD90GxwLdcY8lQNX16O9N+weBcKX5FASHznBw5Ix4thoXiVudgsvX2D/qimBDIi111MJp20GyJD9374OoHKj4m+CyBvdJ7E/6C4s+utIhgBAODUoQaj+k/k4tImP/JPU1tyOR2TRCEbIEkq1axRxrOqDTU4OcanUdfGYwlmpCTSqlIyiY1rFc4VmhupO+lEDSWCakgaZg8wSRfnA//SDlceqnkBqApZgwFMbUxT3GbPdukjVNBBAZ3reZ1nocdPDjoCYmv9QYNAGZzHwe4EIfhk=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d34$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PNH" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c34$000000" prime="d34$" inquiry="i34$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="pn_gia_tb" type="Boolean" width="50" hidden="true" inactivate="true">
      <header v="Giá trung bình" e="Average Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" when="true" inactivate="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" when="true" inactivate="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>

    <field name="tk_vt" width="80" hidden="true" inactivate="true" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ma_nx" width="80" allowNulls="false" aliasName="a">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqNyM5e+K+001uXmlQsdSL1kAo6YZwlRBV9yRofKISY6aF2Y2g9wKbSulYMfro4K9k=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" hidden="true" aliasName="a" inactivate="true">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a" when="true" inactivate="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a" when="true" inactivate="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>

    <field name="sl_ss" type="Decimal" dataFormatString="@quantityInputFormat" readOnly="true" inactivate="true" width="80">
      <header v="Sl sổ sách" e="Book Quantity"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
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
      <field name="sl_ss"/>

      <field name="tk_vt"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>
      <field name="gia"/>
      <field name="tien"/>

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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS2LE83QGkV7z2DKu4jcjxFfvI7WoKwqHisescQMr425WkzP60kVFDgTZF/TTNJg2Kse1PwB2Z9AoYaRXeIRmaO7RpOa1HpX2U2a4/mojIFVGkIQ41AQfVXwmCUml7P0iD7TYtiwIA1D0vDsXX2jwW3r02YZ7nogL68W+FV602LW1KTuhV8QQ1IauJoeS8p23ZLXg+yFjeXCaSdyIh62vPWwIvAYIIJsZSTkku4PRwpdJHkzMhR1FBgK/wD+r+zWojVeQIaEg4ZOcGNYLugrddEE5E6EsbEWd9d0X0GCIqT1TL0Ikxa1cXVXeE2D1Ki02tY7VIAqnHrpQ/sR0qBoUV4hR+wFBGI9wVSpILrnSW1P8xEgA9dcuaVgLocj9NjJp7nK5Pj0+M7Q+XQFNh2v4osNx85VpYnUQhTo0aSFrDu2BSlvZ01urE7ORzuLvmra8se3g7W2JKgdYzc+mVkjMSl1sohCCs3fBzif2R2q89TVC8jBVa2g/gCQldmOKIDZhdZvX4kkcHZKwjaW3lvHd5Qg4kFQDh1oraa1Vw4gP+au2rxuuw5BzerwGCwZ9K1gjQKgKArBp97Wlz0U/1WbYeQMYNl9yiuAR0GsrEBcByWJfdXQeaDPlRXzg03qzUChpjETo0Ffhr+WWRXIeip9J2+QFvuGx9Y3ldY0/+/ydKHjqC1CBu+TRW7m0DXIT9uu2V6qiatWwl7t7yGLCoT7CgNQRpiUxAHcqyZ0osw9Dp4jJ5L7lnc6MfDDDTZvGjyf0Z7cMhxRCjssNfuzvHU72ZkJEL5KkRFwzOY1DqLl/o4RuOHGOPvzVB78puwCC7GV+K9tBC1+9pW/QaB/VlxV7YFnf+gKczhnivhWY2I2MDCYjHRxynBdFfnMY1r4IdlG3EpW/RRO73T27iwF7nAhg/SFTb/nos/Uxg/Olvh/lUX/JbyE0WjJ4ZVs7D73vNaAsAFia8lMJqgYOdIG3dfFvkzj5IrrjCRq7zmeopZ+3bTqpsvvQOfp0jJ2q+U0EQ7q73uynXsg77u3XA8wab0eaeAMuz2zj+E2Zz9WA6IjQisJWrtBBDtcVldZ0rjBDlZBoYc=</Encrypted>]]>&AutoLotGrid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UU5A60twOY8v5qI/Z3blpMbNla9HTHypDvXskX+sb0vFLNwyUmFz73/cAtmMH4UKUTleLbnU3sc4jOsT2npufOYatZxgFLOy9RPbBqT/0B2pUuiqmoYdKIEQPqJWxSfVQPTxpUL9i4YMqEO8reAvvA14hqLSfmWyhM3VpiZ6UJxMXG4vCnLAPsMwHphNaaHgod53smTZQq8hUYBhdCqbx6wAx8whJXuTg24BwD1DAnLCcn6vEQLLOnNY7XQOjQF+fXMz/mdCn5Eq4sxC8zShunXaeT4RrXzklYHjpXVMbFr6SxjYDvJzK80VswMZ0Fon89bgTPak+YfVSfqKSYlEXfCljH0kAPJP48UJegvGknudql6YJjGI40B4B3g9PJ8JCGGnJc/7g3QaVnqK/VgFAfWaa038fFanbuKcWmU6HKumAWfXbymNvVX3XQN+N4w71L8EI+pYpHf+E1wmxIF1Kgx+oBklsNteXOq2GtClEz7QQETOm7odSH2wqYKQjjHNhs185tAsqATY0l0nMD7N7WqamNJMnODdoOsZX2ynw9Bf1Ev1kDMhYUwD6xPv07ZShfvpIP70jU4A9Fl5FjaesuWVzrUhv/8pMHU9ope4eOVLWln52R8/u/XGq+uXgb2m92IXhlt12XPVo6pXRpgw2HbF0SpkjYVHqdRqp5XBDCPJsN1zhISy6PEujGgbsG3LGmWUjLGCCxEfoQRRY8WmC9Rk/0qXKq3ih/SRCkusqJXOb0dQus8iP0tQWMo9E39l1avBwFxAVZ8cCj+Z9FcLPVnQmBUlWXCW55+l40tP5WaY1opje/40ddPOWsGp/HDWg==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8Q9jZCpDncQ35A04Qny2BgfQUcsT+PoTSO8drTQb3p/8Df5D4yucGkIsK+LRmpWME+Ek8ZgPfPOCwAgyCjDJI9Qq+8dGmAsHgaL2TC8dZfUX7AcjoC9xCxqUWJs5PmMR2boAKfTth1dgMMz4HpIgqISH5pTEU25aGnsdb/6yST4tbJt5uDez09YRUk1tj7vYNyJn/E9HsThraf8gWHDPyEF69ZblTr5BVHYy1rL1yhKYhzB6KU0Fm0z61uM3Bgzww==</Encrypted>]]>
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