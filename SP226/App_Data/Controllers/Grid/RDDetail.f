<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\RDGrid.ent">
  %UserDefinedFields;
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "RDTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYkQZcvBjTOM8T4vgjFuHDDsNgPpi2LiSYeUu2ZJeTB+kwxWyhD2kP0OVf0V8NVYoQhaqQnVimB+ZIFm3l5/nD8FnQIiB8XZx1C060vpIT+WtMgBMGnnq4WSyd1qA7bx0uemVd+bSHTs+gMTEe6KgO8GLBsf50ZwfXkF4CbhpTNoeHJVfaLMELN2uTtPk+QC6K5kG7+b/95uGXmUc8V2dI0HS3gsCeBm8xa5ao39i5DQg==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeQuery "
  select '' as [return]
  return
">
]>

<grid table="d43$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c43$000000" prime="d43$" inquiry="i43$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tag" type="Boolean" width="50" aliasName="1">
      <header v="Chọn" e="Select"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWPQop3K5ro4LxsqTPTGoUL6FmVM37sTwRJpaLjND4H8mg==</Encrypted>]]></clientScript>
    </field>

    <field name="so_phieu" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số phiếu" e="Voucher No."></header>
      <items style="AutoComplete" controller="RDTran" reference="stt_rec_phieu" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and (da_pb &lt;&gt; 1 or stt_rec in (select distinct stt_rec from cttt20 where stt_rec_pb = '{[$stt_rec]}'))" information="so_ct$cttt50.stt_rec"/>
      <clientScript><![CDATA[<Encrypted>&5IOchVd+ox/t/eEkJOHtTK06AJ0m5uwRkAEjhhe9AoOsmXKyLYt30Gu5Ng7KHiQSh3Zwq77utcBBfYAwRQvATa2b70g1zo7bCZSoGgMhAxvS8LI65vMPhaS7WD3Y7DiQ</Encrypted>]]>&IdleLookup;</clientScript>
    </field>
    <field name="ngay_phieu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Tiền thu" e="Receipt Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="50" inactivate="true" readOnly="true" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true" aliasName="a">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk" width="100" allowNulls="false" readOnly="true" inactivate="true" hidden="true" aliasName="a">
      <header v="Tk" e="Account"></header>
    </field>
    <field name="tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" readOnly="true" inactivate="true" hidden="true" aliasName="h.t_tt_nt - isnull(h.t_tien_pb_nt, 0)">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="RDInvoiceLookup" reference="stt_rec_hd" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or stt_rec in (select stt_rec_tt from cttt20 where stt_rec_pb = '{[$stt_rec]}' and loai_tt = 1))" information="so_ct$cttt20.stt_rec"/>
      <clientScript><![CDATA[<Encrypted>&5IOchVd+ox/t/eEkJOHtTK06AJ0m5uwRkAEjhhe9AoOsmXKyLYt30Gu5Ng7KHiQSh3Zwq77utcBBfYAwRQvATXvj4macyOUwtZeOd2bmCsON2tI879rbuagaqM8tzA4o</Encrypted>]]>&IdleLookup;</clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="tien_hd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end">
      <header v="Tiền trên hóa đơn" e="Invoice Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end">
      <header v="Đã thanh toán" e="Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Receivable"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_du" width="100" allowNulls="false" readOnly="true" inactivate="true">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    <field name="tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Thanh toán nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_qd" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Thanh toán quy đổi" e="Payment Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt_hd" width="50" readOnly="true" inactivate="true" defaultValue="''">
      <header v="Ngoại tệ hóa đơn" e="Invoice Currency"></header>
    </field>
    <field name="ty_gia_hd" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true" hidden="true">
      <header v="Tỷ giá hóa đơn" e="Invoice Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Thanh toán" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" readOnly="true" inactivate="true" hidden="true" aliasName="a.tt_nt">
      <header v="" e=""></header>
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
    <field name="stt_rec_phieu" readOnly="true" defaultValue="''" hidden="true" width="0" allowContain="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" defaultValue="''" hidden="true" width="0" allowContain="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh_phieu" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="h.ma_kh">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh_hd" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="d.ma_kh">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>

      <field name="so_phieu"/>
      <field name="ngay_phieu"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="tk"/>
      <field name="tien_cl_nt"/>

      <field name="so_hd"/>
      <field name="ngay_hd"/>

      <field name="tien_hd_nt"/>
      <field name="da_tt_nt"/>
      <field name="cl_nt"/>

      <field name="tk_du"/>
      <field name="tt_nt"/>
      <field name="tt_qd"/>
      <field name="ma_nt_hd"/>
      <field name="ty_gia_hd"/>
      <field name="tt"/>
      <field name="tt_nt0"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_phieu"/>
      <field name="stt_rec_hd"/>

      <field name="ma_kh_phieu"/>
      <field name="ma_kh_hd"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPCWSJWgmgr9u1pOR4QXG2s6XMlp08P/9i5loh9XOeQloXpDc28+cF7iF7g0yFlNOxQKVMjDU8q860ewHJwULiBeYpyfVDM7Um+Ehf6E3unb</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwzZMc2K6gBUwwfyOaI8TS9eky/hMe8FWtNGE6e2M21MMsz3+OsLfX79aR3LcoV1wNGt6Qj6F7QRNOGSrrfFamFGcXFWmT5US+OLJFeThRFCoqNXD8+Pb64SVGJaaRaqXA=</Encrypted>]]>
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
      &DowloadScript;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBxc5/zWI2tPfRKLyKoE6wdWh/HZsnIP9Th/CttjkLnRZL9rAiY2Z22xP0A/ZgAjuaNL/lfHhmuSMua5cqNmgFJDolXZZ7lc1OeP4ElgfMp6nYNJs71i6SBmNmux2kjY3BNOLBjf1szAuGaza9BM88be9E+Yn/T2HgjaU9gkZ4ONR2Fdp7i3uTy2OWhPgWzWl+1k7HmmENAWNdYgwFKsxrExXCSWUr9BQZUmAQpZvWtXLx+XEufwss5bzH76zuYzfOJubHoWDpejsaR5qoimg6QpLPImEPly95DFrPrK9Vynen+NUWtp/Jr33Qzoa3HfDQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="VoucherNumber">
      <text>
        &CheckRelativeDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFJdunbbknYZEyRnEbb2XvMBrF2rEtiZG84qW0h4GBYIl9BRpAjka7lWTjzfm0X1kxeNgToafamGC6QLnyXhHo=</Encrypted>]]>
        &CheckRelativeCall;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIABejPps+siE8zySpR9xLlNfCn6pdfYQMbobdM5FnUa7kcXUQrIb3PHfBrIJhzxt35evdF+Pz3kIPRGOEmeqSrSSQzZh1rbhHGienCQ8udmCsFXyaauOO3tcR3Pa+8zEg2ouKbqRkiEpTv1ftLbglWd9vZRRh2VV0QGodF6ZJ4+uVhsSxxku+n8ckipaff1IeeRJdTv3q3R+U5B6xvwFXmvPtGT16F3S5hsa9yVX+Ta70zkrgIOC4G9GfFCOBkQAJ3Z0xAhAAfKoYzyUkKS5ZkjSC4EQV42vhMmOyZ0PUK33zA9Yd/O8CYVbe4LIyE6yu9WTHycvehRb0roTdb9vEH7NPKdx0pmMhuTEB0dzaN7vV7vKjDE4jbpiee/MK+c92o0oiAfltJf7cmhECUdUbIcrIXKdfZjanAhC7VRPFpesDvsAI7wPlJlhSFDz1KLt6XisIgGVISFdSiFs8IWPgwlUWNEeiFMRP0C+Sv795dOgQ==</Encrypted>]]>
      </text>
    </action>

    <action id="InvoiceNumber">
      <text>
        &CheckRelativeDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFJdunbbknYZEyRnEbb2XsVMEE+RWwcAf8bxNPurtW/+AHQTV0VaerKlmIffOy1gd3yedT77eiiGRNlHhMGszk=</Encrypted>]]>
        &CheckRelativeCall;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py2vBL23gbO059ORfcSMHFXCbp5HujnVtMDj0xUEvp/nUfAZXr/xMYc3Bd8ruUZIEJqVOm+W2sC9dlxEfmj+FM8yJMm+2k9xiqZRwGWxsoer/IdTuJ0rUTMtI72Tvd6OeHHb7BZp84xR+pXuET48oJpNwC8mJyrQB6Q8r4/aF5ktIAoqN5cWZoJPqlsaJndh1DAuBmTIUZn2I7S+m4n9Li+7qHgO354udcyNSBmoudJf8Gg9CCD6WNxRtfyOf5aPwxSSWfV9PNQYgJe2wuy57o19LfxKJxyuWejBhwpaRb/4GuhLxEuUequZn0W64Ks4ub+TLZwGT+ScQSaRlcOnvRKWVwpf7vrdcTd1KgIJ9f3O4WRm0NINFY/oY8LnT7YL8haPEySn6HBAES3Xpz6Jexav5CLih9h//WIOD/g2VfiKgjalTR9ZpFogXECGWGd7s21shkbClYZiNp3V5lUu0FP5UqAMJzcsdYKVNDGeNGuLECfApYhIkKuWltTZ3s/BsnOV6/uPg4dsnR11vBe16wqONnrIM22FWnKd4GPBpZjBbxyRQIBMMPQ5A/GwvwIoLRzDUtZtHVC+q/f3+uHoUsPJGAke0zWPxz9eZ9AhAxXtrt9VHETB8RAgw73lfX+UbJOk5smASSHL6GSDaxX36Nco/5FLWSpn6vNhTHUw8m9w=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    <action id="GenerateInvoice">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKyDClzv9X/VlqamVWOZ5jzZ2GR0ipPLG/kkBoA18lORSihTveHBCACJvVqIg6OzD3ELMdOTZ2sfcludxlbzrQArU5NfLM+fwo6xMab9U7gDl2ltCCB+jrglTxKfVYPqlzTyGspXuqm237Xctk6TZ6IdTcCqjXD885cHH7SPFG0hzt8x2IC7Zi6X2Kmm+Xr4/dVyBGm8nQeaXvjWlMICvyGntHl3ondK2K7hb3qvpmclLQkWjk/uT4vqLCC35TaRrPlaApxoFkTGgrmgxQhj1pq1Fykx448BygijWz910+kVEofaXrnN6J50sGqV/MMrDYrxzwrA3hMrmkYxOsW74Q9rGc59+nrggfB80NyF+54WqHyDQ+uGE92uHgRvDaBBT8/BSV58hpA1jGkCiKm4Ng3r3JeYgconArgc47ydSXEXUUZlgIlmDlrHdnnwz7OK8MTj02XgprLRWlyRWimeXhxTH5F7x+nKRrRP/8yJRt8+f7Lxqq9bHpQqumPggfVteYh6XPA8AUwZ6UeYiBl7G4Mze9jhB7cUDvEZH84oegxBaQXT9sCLUXmwvIwfTL83zCquaHxWhTSdbugpr5OmLgi9Bfn1QqKZGhfUE+IzixRz3UdEEgBBAGXra89s9f2MquPdF1lu1M0d5++ZYtU/58tdxp+MUJLrfaST+f21RSYcy3h0LqoD5HcbspcutYhSn1i8XELPlCiqzsK/qFMJoDoDx4bqR8h1hZHs3dfx5FIxNWVUMSkD0esPXydJGaaxOH0dtmhEqtyskhqsWiWbS/DRfWGahMre3Zct5m/Bld75rZjn2mvyGBvLDJOkVPBxaXHLgW6XpTCVbmLdnJ9iTVuNh2d+vUiFAxkDZp+CVB7qDMeTkgXny11yrRpo2LIgMi0sx8Z7NNj8m/IFcdW3OvxAB/g5m9Wyd9MSVDJbP9SaUFtQUr7zYnt5Gz73I5GLTDlZXFh5hPP4D5S6njNa8kNrM/GlOTBvGB2luWJp6pxZ2VA6WD6r4njNDiGA8dbFed8uKWV/1Rw8s7VqjIl5TNH7awuENm2Bv0Rs1jOfeRERekfCWirzq5anV5zTvHRl4dyUW5d74JCiqFAZHLKRxsjUnpzIQPYs/rXMLJkfq91+JJWpcjonDxgYUzl64KNLdw==</Encrypted>]]>
      </text>
    </action>

  </response>
  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5sNlraQl+jInF3SKEyCuLws7naRuwDiIgNdYBUNtISDnm5gXhF8veYcJgq4xnQ/gFmmmVIBu4CDFTY0m2pb2XbvmAVfvapj2RYtO/TWU6TrQ0PFJN2nVXrmwD+MzkQYw9e6IoQV3FrZTR+BDBWO7N8g==</Encrypted>]]>
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
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="GenerateInvoice">
      <title v="Thêm phân bổ tự động$$120" e="Auto Generation$$120"></title>
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
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
  </toolbar>
</grid>