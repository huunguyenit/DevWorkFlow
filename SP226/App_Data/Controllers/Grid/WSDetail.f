<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\WSGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY XMLGridStockLoading SYSTEM "..\Include\XML\GridStockLoading.txt">

  <!ENTITY Type "1">
  <!ENTITY Tag "2">
  <!ENTITY Ext "90">
]>

<grid table="d68$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PXR" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c68$000000" prime="d68$" inquiry="i68$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" inactivate="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" inactivate="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100"	allowContain="true" inactivate="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true" inactivate="true">
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

    <field name="tl_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Hđ trả lại" e="Return Invoice"></header>
    </field>
    <field name="tl_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
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
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" width="0" hidden="true" aliasName="a">
      <header v="Tk kho" e="Inventory Account"></header>
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
    <field name="stt_rec_tl" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0tl" readOnly="true" hidden="true" allowContain="true">
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

      <field name="gia"/>
      <field name="tien"/>

      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>

      <field name="kt_so"/>
      <field name="kt_ln"/>

      <field name="tl_so"/>
      <field name="tl_ln"/>

      <field name="sl_ss"/>

      <field name="tk_vt"/>

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

      <field name="stt_rec_tl"/>
      <field name="stt_rec0tl"/>

      <field name="xaction"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+YntRie1R2gGw6qYgluHWS2LE83QGkV7z2DKu4jcjxFfvI7WoKwqHisescQMr425WkzP60kVFDgTZF/TTNJg2Kse1PwB2Z9AoYaRXeIRmaO70hRu83MK3DdU5KjuNjE3S8oqf5fmltnOfsqND5aUd7ifLgB+lLt4SSx8VaSGrquFsYmk5ElA/aSqr7GHQt3E05xT9+IKbfRDEFcQcQxnXoSzCFnVZht8Fez91RdsZ81LWs9FEYaDbsP/z9oQSWSSgsNqcyAaOX9wrOPfoWnyO4xbczEdsTs5NgCr/FZPnyZlqdhIOE/3WVwGvxIryrSPxDa2q+2wAl8aJPPvJiYi7J5tqwmXwow6d/ggsvLa+VEOaM7qpMA6F9Ina8RLGT5EwXpRld8mWKWUPcPYF263cNOpCqKMLF3YsCHiSacabG27vPhUfvI1XtpTobdsbIIZpAFtgIjRjzi1DzQSOZl9ovZWh/xdOPRxsrquCeOTzSPndG7FJGZVfsGXEKavDYfcitJOL7ctToUz28aatXVka6iBEMIA8gIrzhW9ahJdFCIWZi6Jh7zncAFESvyq5mk+9g0vcExb9PqBAV/EqBG48dJpbXXu1toLUp2baaIS0QJ2ptgG+1PB/k3+VteccVy8S7SxmpqcjPgdBnTKUeVNDk1IXD2h8DYWh+Y9eEApdKRbVQ3E/VwNeyA7df9x3UiWvGsp5p8vgygcAWHBg3eg97CKzUiMvvVvdMULOfXKvqsxqK1oF6OyVZ3t2M9yN4tu1Sr1KHpwudBNWZ8bUfRGadrca1K9QhNpvjJTn68gKsI7n6lxEZDb/uGgaNuXe9WqtiG9Ofv9o3HBT/ywMBbDdI8MZdb18krmdgMaLjx95C3Z6bI3fzgrOIlsS4SK5de7syqsTAmJBwWHbhBwYHCcXksJLhZEKbu6eG11EJrlY+iSCnfwuONSZgqccTMusm9g9KNi6fGPX1nq3zYocc8AxeQl6r5bJY5vaSFXTdK/jj1MAbWCzkClo+8gfs/gpQVoEbgB6QpZvoZxWpaQ5nFde+cH+OEoiUfx9SeQr9oQIJZCTkNUNIkdAa05TrjBrS5Fm4rqUAm2CFtBsmK3m4Uu1g9PJmNC2N9nxqkss0ONuOv5</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0DPZvbOz9lmDFQbvsMrSGqIqm+ddaMleHkXttVxj1OjwAGSlLUij9jxMxAB60zJwcFPCBlp3viMggCXh7vmaTs/8hlBdgHbkdFF2bVmk1IVSnDRO8YUudFAmYnF6e3IialQyokTMhHZnYXksyRBEPDzBrsY7lJk2C79ZKxiEG+mKY6UEG5PSqhxCVTeMJsJEoiv/DAMIbQv2ti/T3CGqcriFH1zvbhw3VHf1zXtHOO4aYcAan5c5JQYdt0auvvJ6aXgEcvEY5j0fJoMs32roOtoqxiENidxiY5v7ra5isDw/OjWejyoqxjPBurW9IexhaIXsTUROvOLmyBrmC7Flp3CdIZoX2HqeaH5pSXVE2a5hnCjnS/Y07f+UXnO5LOozyziMnaQGiw8CcPlGiMrwwlNNT5za0DTzXy5r/cJxTGZqDub6/aMH5oqOVpa/XbDUwmW6sk2IHFJ357pJtE7Rn4RGvqLedLTOAF4H5+s0A3VgPHZqysa4PGVUcZArYWd7A+EqlyoKLESv6VfXShMqwwmID9rz0C8XH0dAzfoh2SfXq+4rBRmpcnv4KsyGdTRhvm9FaOQ/labipgHVHrMIqoIspFtG0Yc/pML3yMIEu/aRExAz372xNgrrpHVQfOryAvNU1TH3UFvdQ3bOACX7bV2DN5LS4EK128slz5jevHiQJYVMteifiFNC2FNvwgY3cVQfXqk8FmOM3o1Yk07rRChocOrH4ieJQC0fdZLEsEuPfBlmEHOSPetCc/8q5N6ua2rqS3lbH2ETAQJeUXp5BcMHpjPCX+B+iF+TNDjzwOKIo7QDgy9ZuDyCiMMzDnmzL6InpGyAjUe9EC+TrXTos6brzZ2Unw2WS/1RLD/BufEOpaKNhp9ZP6Y9Lm/ysJcHUAzheAos70igNmwSRBgWMiDUHowQkk5plJ6JyABwenk7RIHAfPFuQfjxYwqDS1F3tKXjZmW9X/iluTXnvi5X23A0OK7tMUcAVTRW0Q+EjwdpH5QwFHV33h3k4PjrjzXWlcxykKJeC4xdzuL/OgLg1xB+XkRqnw9zfRn4nOPpPR3H5BEStvUqgKzG4xJCAgNrdK5T5UP6miCfnf3qrUjj+P/tl7Vfdemq2fz5Sy8sz94LIdAmziuoJ94bQ+lfF5dRnUWzpQ8jS64TJDtx2sRGJN5EwIFlkRZyoBLPLWSXVDtLeU70WyaFPE2bsKefNY1UyzI+OdY/FeU95taIcrP5VkRuLwMANYviYz+XQclu29TtAXs+kigdNmzK+vr++8SIGLUm2SnKBWkJDvUIHdOIJTvqNNc8x9an+6itsMQX1vGqQjkX72jto6uWMTLs7LHI+nMhLgy/AX23mOV+sHWgR1g3LrPixg1ohxdFl9Ao78kOx8S/ZIrsg5ywG3A2BYzkRHTTSZVhmt4U360N/kpiWe</Encrypted>]]>
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

    <button command="Generate">
      <title v="Phân bổ$$90" e="Generate$$90"></title>
    </button>

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10">
          <header v="Lấy số liệu từ phiếu nhập mua hàng" e="Extract Data from Purchase Receipt"/>
        </menuItem>
        <menuItem commandArgument="20" urlImage="../images/Menu/Assurance.png">
          <header v="Lấy số liệu từ phiếu kiểm định" e="Extract Data from QA Transaction"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="40" urlImage="../images/Menu/PurchaseOrder.png">
          <header v="Lấy số liệu từ hóa đơn mua hàng trong nước" e="Extract Data from Domestic Purchase Invoice"/>
        </menuItem>
        <menuItem commandArgument="50" urlImage="../images/Menu/OnlineOrder.png">
          <header v="Lấy số liệu từ hóa đơn mua hàng nhập khẩu" e="Extract Data from Import Purchase Invoice"/>
        </menuItem>
        <menuItem commandArgument="60">
          <header v="Lấy số liệu từ phiếu xuất trả nhà cung cấp" e="Extract Data from Return to Supplier"/>
        </menuItem>
      </menuItems>
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

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6HxhnS8rGXsILZQU7MG6tihTqkxU1cqCt+DhMnIAxvtiVx57BjcQDbAUJEh8YY8WcO1qpdWa9pVuBxk1RvOxgKd1KkZvc3+Vkj3M9TCsMXCvMZVtfPbag/RR1xwo7o4q9NSfvqQHeK3kjlrdq3qLZVswbwnk0PADJBkezvch854IjdrE0qAKwx/tqIaddZAcA==</Encrypted>]]>
    </text>
  </css>
</grid>