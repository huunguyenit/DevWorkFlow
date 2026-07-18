<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\DCGrid.ent">
  %UserDefinedFields;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="d52$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="PC1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c52$000000" prime="d52$" inquiry="i52$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_no" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" external="true" defaultValue="''" aliasName="rtrim(isnull(d.so_ct, ''))" allowContain="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="CDInvoiceLookup" reference="stt_rec_tt" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt30 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt30.stt_rec"/>
      <clientScript><![CDATA[<Encrypted>&5IOchVd+ox/t/eEkJOHtTK06AJ0m5uwRkAEjhhe9AoOsmXKyLYt30Gu5Ng7KHiQSh3Zwq77utcBBfYAwRQvATUiTaESCyuWH8aacs/9gYdrpOvCmm7/16tixZXfUqAGu</Encrypted>]]>&IdleLookup;</clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" external="true" inactivate="true" defaultValue="''" aliasName="d.ngay_ct">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="tien_hd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end">
      <header v="Tiền trên hóa đơn" e="Invoice Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd">
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - d.t_tt_qd">
      <header v="Còn phải thanh toán" e="Payable"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt_i" width="50" readOnly="true" external="true" inactivate="true" defaultValue="''" aliasName="case when isnull(d.ma_nt, '') = '' then (select val from options where name = 'm_ma_nt0') else d.ma_nt end">
      <header v="Ngoại tệ" e="Currency"></header>
    </field>
    <field name="ty_gia_hd" type="Decimal" dataFormatString="@exchangeRateInputFormat" width="0" readOnly="true" external="true" inactivate="true" hidden="true" defaultValue="0" aliasName="isnull(d.ty_gia, 0)">
      <header v="" e=""></header>
    </field>
    <field name="tt_qd" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" aliasName="a">
      <header v="Thanh toán quy đổi" e="Payment Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai" clientDefault="Default" width="300" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" aliasName="a">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" width="80">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQp0n3kq10iwHJqlK4ueac9mWwmyZtjZU7ohxcALss7XRiXpXe4JfsZhZW+fTScfGCk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="@exchangeRateInputFormat" inactivate="true" readOnly="true" width="60">
      <header v="Thuế suất" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue" width="80" aliasName="a">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqO0Pna0hEE602dpbjVdFY4jZcj5wWKbyAalnE8JVDm3IooQ1R4RD+I+kCn9B1r1BE=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a" readOnly="true" inactivate="true">
      <header v="Thanh toán nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a" readOnly="true" inactivate="true">
      <header v="Thanh toán" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kh2" width="80">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <handle key="[tk_cn]"/>
    </field>
    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" hidden="true" aliasName="b">
      <header v="Tk cong no" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true" aliasName="a">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_tt" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_hd"/>
      <field name="ngay_hd"/>

      <field name="tien_hd_nt"/>
      <field name="da_tt_nt"/>
      <field name="cl_nt"/>

      <field name="tk_no"/>
      <field name="ten_tk_no%l"/>
      <field name="tien_nt"/>
      <field name="tt_qd"/>
      <field name="ma_nt_i"/>
      <field name="ty_gia_hd"/>
      <field name="dien_giai"/>

      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>
      <field name="ten_tk_thue_no%l"/>
      <field name="thue_nt"/>
      <field name="tt_nt"/>
      <field name="ma_kh2"/>
      <field name="ten_kh2%l"/>

      <field name="tien"/>
      <field name="thue"/>
      <field name="tt"/>
      <field name="tk_cn"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_tt"/>
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
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC4fYRKj6tyfZLrJgISPmA2LDZr254zIFLvrrm5EcD3H135DeM0j0kru3pV8YKDj3w4g37rWwBbFnfXd2hTKU/CsWiGOk0W5H43R5O074qQ45+xdf6IbgmU1rIDVRfoPRJPOA1NAdcAwWLoTvJn9XPJTCcuQ78lhSOdWDTzQNh9NJTPfqDQQPnxVojF1u5wGM2Bfo+86h5mgQQcMXZvf2LdDZhIm30Y+rFki3R9Xx3sIkKtXd7snxltTgGH7v5Dz8CBEVOnTBregO7HTWRdk4IIlO+u+4hFKkAXzr0scSq8</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF3Gy7ptq9lBOeV/ACdzZ8tBqHX+c32IJZ9XaQWvopXalBLbomgTTxrA+rA1hljwgL/q3WDRh4QmfX+wJgIE7me2HqJh5TMkc+n6MVF7XoWNT4YTQk5esWZcIRHzUh6AnPQ==</Encrypted>]]>
      </text>
    </action>

    <action id="GetAccountType">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcelMjUXjbsN66gI6cf7w0A4t306RKOvqTXQMb4xF8jln4uuhd2bIoccIAumZazjpgAoUYq5N7GjYCUg0TkCxJaozX5lDHBaYgZgmKw4771uk=</Encrypted>]]>
      </text>
    </action>

    <action id="InvoiceNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py5lIKgijFJmYStuYoqOt2JVBIZgjW8mWtAoQdoo4xfTP920uCA6714Pdk+4bKOeQ/+ZdFeQGb2mNEVuqINan2JYs8GL+6/Dk21X5hvExM1a2pX3qMkM5QQLhUfmtKS5+UwKvjW3gyZoxc5RIRLZegoPZHyepKrGp8CFoyWeSm3kn+J7vPlXPPgyS7mt4L5ctGqmuphyNjBssC78HSq3XhavRFKg3kgZhrbJtZjtc9XNCVCvXo55h0aNjhZnP0lW5of5lKTuUFv/Ov0Q7Tzty1kB5cdn5ns2gfW3j8Vbr8m34J9fRHpNlx0INmusPQ0ibovqk7RIngJaiLKn/ZuE35a7Uwc5vvaaGqdXhtacDl/ClnfYUPa0SAeG6Gegj3kiyDRY16C1sWyiynXqdsC0tVK8oQrzXERvmtijBLolb7gbprSKPutmm8XARIu+Pd6sdWI4EQO3C15WIbKKb1Bm7YPi0bfdHUM9WrxY7MrfezSZGJaORh43mtBRMr06b+H3PASYHPFU4VKbv3XYAgecTrtmWFsVVgm3MULH2yYS4nDKX3FH8HeH7sX7uJBuNYMfBhUbkwhyzvrGMFPchGRIWqdt7+sk63zKSxk6w4uoe40qCXlqo2tYbVksjCwRl9qpOVsQecA92XjUYjcUkEUpJm7nNH7K/ZDYt5ctAM2kVim4=</Encrypted>]]>
      </text>
    </action>
  </response>

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

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
  </toolbar>
</grid>