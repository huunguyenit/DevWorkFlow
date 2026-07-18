<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PXGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
]>

<grid table="d26$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PXD" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="m26$000000" prime="d26$000000" inquiry="i26$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="tk_co" width="80" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" clientDefault="Default" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
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
      <field name="tk_co"/>
      <field name="ten_tk_co%l"/>

      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="dien_giai"/>
      <field name="gia"/>
      <field name="tien"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>

      &XMLUserDefinedViews;

      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKAxuWT9N1xz7pPLlPhaiI9Yt8jnHcGRFyaJH4AFosjpfQ/1zK/8rGwIJ8IrqI1FPmhMJNz6GY6MAs8VpNsdOM5/QeYWICdSyvo96/46Jufin+cO4PZYpPdzNt3IZkxcUwUoGnOeS0W68wmbDUEC2nyOcvAJFI7k9px6GPHq0kEsIOOX97NVt7Fm5Osj1NlQ5HGGpNHorDhS9SMIFyUtSMHk36zuY98F6WtFRinN+6x6IKvFXfTkqI7LpYazJI/gLMpZZ0x9pyEroKZZC1PjCRRRnl4AwvkFPi8V+Aiub4Bjn6ACPySJjsZIMP33SyCWFkQunNQ+OUY/IaH4Ocdui1LHK5ebK3XC2kUV3ViYZh7kZGu3iPMgfFjEcv0ijNvc1Xo6/cW6YPvTFlsb1OLnxZvs/qwyPafdonGiTn6WV8U737wPWsVKbHrtT7qQL0VEMdGVNGhGXmIV4PzDvqrDKa9CT7/k15Mhec6iFT93IQ8RwR/StQCN3wVQ824udnHANXblPHziXL8Xo5Hwv/x/HSI5KBzVnMCNptKHGc1XJTsB7f8iU0JB49i6SbpATNEYizIAsUAglC3t5TNarVGEAX6HyoXN21SPrnynN6QdBfrus26hafzQlj6HrqR/lw3aN/MQKU/v5pS++cdyucVrHifByjjblL/yh/lK7OFqrwC+7U9cmqnT4XuMDN72+eBl2a86KGhVMFKAFuELzBN0ycCGn2lLVQ/esKjDTZPhObsCJ9lz4eNOgxqevgwdfv9soxxUPkMQ4t4oQIZWbLCPDYjiU/vLi/Hqkb9Jq2TnLfjKO9MXfkBsPLDaD9+Bw2j9S+f6IHuCRJ53uvKehvzvDnqVrtwSaZZnYNkdGyosebFLz4vqK0jVsSQ0x0KRdCi275P2cnBDdVNoBF6F2jT0B71nGY3A/oXdX/wIBQJa2L7B3YKMCh07b4C7fdPVdDdL8LsarHOzHUfYT1QjgvSsEr86li0RafW3fcGEDuwVmYJhEmDUKwLQCp/zuvDmUwwvnzd9Xv9+rkQyH8YbfW8rDpsni2QTP6ym27uVmpdCCpXHKzwWaeG6dONzMz+paxTQwVvsXKOPbaSN7tqbnRix7vzZcN5kf7KMd+9c8zNNDbXuI=</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx0isdqDx6KV6j9pKIL4yu0xRkixXlGm1U4CX3F98CYpWj+RNvF0xpW5Td6WplRrUSinknx2Js/3SiT7kvrOEB5WVGmU7zZiWxvfT5/lBAcm6CSexoT7SYdS0JRYohZ0c5IRt0r76VSaP1XET9rSh0/hWCZnN4UXX8sPwgtFPPXf/KhH1nnp4AvToV5axV2d6V/PsUG4qoRX2AlTUJbn2GUcT1ScjQUU6j7XlSFRyjoricrN7c7W3neiiIhVrASMjSDc3JTE+0KKa6cDU71eiZDgrV7gJSzspnxCwerk5hLJI6M0OoGwb9XGUb4lceseR2ca57MMxj1Wx6fmZmzxdE8S</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Esu+qw3Qz1piykaVyUhXSadnYUJW1KMV7OTSkWq/AU/3QUX32783l5b1DIKnj9IUHCuj2ROmAEHGiuqCda61WyTg</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx7T4CIANMlPydJ30MtiNrL06mKV9+wCw/7+8KjLujf+pqXuM70Z8jV8ZPqET38nE5BKhm9bq9oLx6s5NMq08DT81Z3M/CESBDBeieEzzFg/CNeYnWT0DIh7eswAiabVLCuJ5leYM2onC0T1BBNjVJHTMX19fZn19+1MZe3c9MxK3waCCrXg4gOhEhLs2detgx2sovenuow1zP3K1YTDuPfbFPYE64sr/igCDKai3Drp33RYsKFtCrTWbJ97378Y5skz4jUpLBYES+6yWSkXN9QL/aU1ykmRrSM/rIFiunBGmwoFgO5EQddhjsydyXt+lh9rUNPaM0oWcUZJuwp02XwQtfspwLulW9emiblcX1fwwFnTqUVOB744pbGQZQls5OyknBEvC0Hc1uhiuVYhSC63uGBqcp1FXF9Wy4uuA6zrl/iHRzy9lfWfn437ZNT4lrTJvkvKrX1gxeiiVh4nP8lUOmqSQ1P9S5Hy3KgbX75HFDvOOI1+g2t97q2zRCZoLaRs88iDKBvNvN5z6h0RRY6GXLEfsOWj/ihxTnEbYfY9ve85impnJx0fz1vWaQadGSx9vUXQnMQsrEiIMHIxeXAbYX0xpt6Xa58ZDYxc6aeVjQ8Of1WmPtLJHtTQK683k/OG7GFKEpn4pvgDV7Gju5ao3IziAJqWbATTXhlNxJyY66tN3Hh1RUNXuCIBw24/CnLrUqx0ngUoHes7N2Q930cu7tpsLQEJibhZpg7ooB898Q==</Encrypted>]]>
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
      <title v="Lấy số liệu từ hóa đơn$$90" e="Extract Data from Invoice$$120"></title>
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