<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CKGrid.ent">
  %UserDefinedFields;

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "CKTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYIz/Nh9/Yce47rBxjunQRwVlm4KSHcGKWr9CoVZy/qq2EvEYP1CgWudvjJWVSTSsP24tp7GP1xcSI8Uq7Q/GbR6Z2lgIrRDsZMrIp3pLOY0OXl4qOdfvnIBN0dv6hhnaEG0yHuBD0rt96ady+Gtdf9YsVK8dE9hRioeDUGtUjQjCCJAJcuRl2rZ4KScFMt2dgb7Wx3cuWlbm73neVuj0vlFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="d58$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="PC2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c58$000000" prime="d58$" inquiry="i58$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_no" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk">
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
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end">
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
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

    <field name="ma_kh_i" onDemand="true" width="80" allowNulls="true" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_i%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_i%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="isnull(c.ten_kh%l, '')">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="dien_giai" clientDefault="Default" width="300" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" aliasName="a">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht2" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" width="100" aliasName="a">
      <header v="Tỷ giá gs" e="Book Rate"></header>
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
      <field name="ma_kh_i"/>
      <field name="ten_kh_i%l"/>
      <field name="tien_nt"/>
      <field name="tt_qd"/>
      <field name="ma_nt_i"/>
      <field name="ty_gia_hd"/>
      <field name="ty_gia_ht2"/>
      <field name="dien_giai"/>
      <field name="tien"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCeTBIBmNizVCrNWMK8Ev+JVCEJK1s4pPqPOMGRKv5gZ6vWjUfIsmy2ByOcHXek8q9Kbp4SJ5sy5ibxBfKIVVdMhP9UJ2fAdSu+xUfcYNanKO/eJEmDLHOHQLF6Jyb3chT7FhhkMbTcABSf7RpEuQcb6DuIox4zauq52ucu2aiO9SqSDOEFFgiHqkwpDMYgbrFtqbCuFT+L/JQlKCKU/8Fpf/G3mZPuVtrl7Z2v4vIQ2R2IVA45CBiqxiDXvkqlhCD7UXw4vlnIeUCKoTBQzoZrU9XN1T8iRILZm8w3LxUJ5qr75Dupi7fbvq0dr39NhfX8jQrDRv9vNKulDnPwmgD1+zzOQ3khaZm8Yj84Xah95cHlK7q38/3+upT/JjHaRfZVptVYUBDf2gHJr0m2QBld+hJeK+QcWngsJe9k5p1GXkz72xJqMJQJMeGFnqauNs8J+Xkpuiivg4v9VOvh+iPhP9/MSgj3CAmeLgceydBVld9ZZR6neCIp0aIEMR6yFqLfmR9bu0t11sOHRvx0EGkIgY5RnyRoqJlriMfuCIXQVwocJVpO7GRUyqW7O9gOO3g+4rqJ4/OAS3jNcfZFEyp9jvlb9niPvD1XoXVob4yWE1hCFsrn8AZPLS9uFbE/D8UbSJALiRARfdgPM2az04Djr8wQHFyYwzfejdZrFojwcFGtqoSR06UuaimiE33mOG4HYeNeQLqDKnetvUnupTHL81X1BZA92bEBCGxUn7e6xyIE4APX77Pn1TjKx7Tt06IbfGKRIx82sBSb+Rov8HMWw+ypnCW2MlndE0bysguxTcD6e8nl62No0lNvS2W0MxexTieT/kJv+oUWFjZHUnlP3Y8J4kIM3d4PlIPt2RxiiIMxYBPOXlfK547y27hTK+Pxe+rqCFUwqFr9p9KihXolFdsHcqzHaFpCjD+0OdAi7Qq0ZI9c4d2dQ/jylrAENDZ72/eep8s0A2/6WV3G27Fk8Qhkt/Gn+0EydnjFkwv9UR/EcqJF+F2n3EIOgx0B5URnS8cHxA8EtLeTWIXPHoD/2bHXmTl67b0yVxgNxmxcT1VnqZstgiPoKSTPL9YEaMq86sWSQEWO5a0S3L8MCi6rTJPgQvNdjw9HEDfsm+3FDNBD3rpip4C0qSI9ZtOmEit22xdusfajh2U1f8Pww4WOFMBMikUEXjgx6EEp/exBv9X7OQP82IdnVK8/uH8okPOjXqhM9orocBGmtvYtKs+PAid4XP9L9JOXuw5wpMnJQ4w6XsiaqM+nrPTlTgCCYOqMBHufoeTrufJy5EkHplk9TldvQzkcSjFNDygqJzhaqkOaG1X5J0GNXiS4+s0k3YcYNLOjBiHqj+fSelUNhhHQ30JkgtaphOjXsLlebw0WhZh2sgzcPCPOPaavSZHVXmAWOV3CCMCv3IDM99n3A45qckeuV2P1YW5NFom/DkJpD4d7HkKRYfmubia6cODo8CUXYZq3w+IP+ANDkYvxxUFhwyDsYp2Xfl3QXs8/Q+aYRiDfHzTUYIi1FHe5O4w3jxTj8RSiKnTs80h8JkvNK0RiDJT5DcVDdsqLM/VG8qikOCl8bSb5TiPtfhVNiWUJ096skeifeHXerLkmIY7euBHpOJoKshxtmQ64dVJ5Gnfz05r+Mkhv6neX0DRLwEyH8xTrl1d+yGy6Ifu37vzfQGo+dZRrzPtUMLqoOAYAIlBcoiix3DKhKYzV0JWRoUPu8tHVEiNSep7VI/Wy3xAE5SzBtXzKiu3BcroQFxez63fuh8c4ubcxs4W+hDYo1XwncjiU2HrSFbxtoIUCUYYbTkNPgH+nP9hr+AvgNmH3gqcT7/3EqZHTSvyTmRHNirpMBEVqHqG4FdFQ0MAq3rhkCkEZmQpz8DBwR5cf6/zxp8Bmpg0bMuocGZuaz92B1pRJ4PvnHhL/0KbrfXCgjv9C98U37hEb9j0K1ceVVWZmbyWmIw==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC4fYRKj6tyfZLrJgISPmA2LDZr254zIFLvrrm5EcD3H135DeM0j0kru3pV8YKDj3w4g37rWwBbFnfXd2hTKU/CsWiGOk0W5H43R5O074qQ45+xdf6IbgmU1rIDVRfoPRJPOA1NAdcAwWLoTvJn9XPJTCcuQ78lhSOdWDTzQNh9Id6RYixvlnDKVwqH7zck//ycfg3fP2BlOTy//DVKsipwp9zJnMmtdHQpomodi3FPfpNU0rOWcgdEXhldsJokuGOp9GFFs6lpSjZ7BXWf0nTO0RxSodblRC3cUgZYG0t6Y1AT+YhscUZCbfL52GUGzQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py5lIKgijFJmYStuYoqOt2JVBIZgjW8mWtAoQdoo4xfTP920uCA6714Pdk+4bKOeQ/+ZdFeQGb2mNEVuqINan2JYs8GL+6/Dk21X5hvExM1a2pX3qMkM5QQLhUfmtKS5+UwKvjW3gyZoxc5RIRLZegoPZHyepKrGp8CFoyWeSm3kn+J7vPlXPPgyS7mt4L5ctGqmuphyNjBssC78HSq3XhavRFKg3kgZhrbJtZjtc9XNCVCvXo55h0aNjhZnP0lW5of5lKTuUFv/Ov0Q7Tzty1kB5cdn5ns2gfW3j8Vbr8m34J9fRHpNlx0INmusPQ0ibovqk7RIngJaiLKn/ZuE35a7Uwc5vvaaGqdXhtacDl/ClnfYUPa0SAeG6Gegj3kiyDRY16C1sWyiynXqdsC0tVK8oQrzXERvmtijBLolb7gbprSKPutmm8XARIu+Pd6sdWI4EQO3C15WIbKKb1Bm7YPi0bfdHUM9WrxY7MrfezSZGJaORh43mtBRMr06b+H3PASYHPFU4VKbv3XYAgecTrtmWFsVVgm3MULH2yYS4nDKX3FH8HeH7sX7uJBuNYMfBhUbkwhyzvrGMFPchGRIWqdt7+sk63zKSxk6w4uoe40qCXlqo2tYbVksjCwRl9qpOVsQecA92XjUYjcUkEUpJm7nNH7K/ZDYt5ctAM2kVim4=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
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

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
  </toolbar>
</grid>