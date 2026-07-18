<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\DDGrid.ent">
  %UserDefinedFields;
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "DDTran">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaTecys90hjH3uiVSE1KY8SNSb6pWXD9sG6Cr48L6eJF2aBMfKvhb3aR5db9UUqJBLvkp8omck/YVsV7qDjXWFjWs6gyDfLYERi/zittytAmHTzv8ZPPZ8WcnKQoV27f0RPZK8Wp+ps8vk66STpVM/oomzjV/OB2+LRVyUy9pPXfIBlTn//P2NYdxtMk7DV6JVmq60Z17jW9fxh0fLEQWZyeL/2R3Rm/NTIFjVDxgyUFBQoqh/sjbVzSX5bd+51AXE=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeQuery "
  select '' as [return]
  return
">
]>

<grid table="d53$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c53$000000" prime="d53$" inquiry="i53$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tag" type="Boolean" width="50" aliasName="1">
      <header v="Chọn" e="Select"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWPQop3K5ro4LxsqTPTGoUL6FmVM37sTwRJpaLjND4H8mg==</Encrypted>]]></clientScript>
    </field>

    <field name="so_phieu" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số phiếu" e="Voucher No."></header>
      <items style="AutoComplete" controller="DDTran" reference="stt_rec_phieu" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and (da_pb &lt;&gt; 1 or stt_rec in (select distinct stt_rec from cttt30 where stt_rec_pb = '{[$stt_rec]}'))" information="so_ct$cttt60.stt_rec"/>
      <clientScript><![CDATA[<Encrypted>&5IOchVd+ox/t/eEkJOHtTK06AJ0m5uwRkAEjhhe9AoOsmXKyLYt30Gu5Ng7KHiQSh3Zwq77utcBBfYAwRQvATa2b70g1zo7bCZSoGgMhAxvS8LI65vMPhaS7WD3Y7DiQ</Encrypted>]]>&IdleLookup;</clientScript>
    </field>
    <field name="ngay_phieu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Tiền chi" e="Disbursement Amount"></header>
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
      <items style="AutoComplete" controller="DDInvoiceLookup" reference="stt_rec_hd" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or stt_rec in (select stt_rec_tt from cttt30 where stt_rec_pb = '{[$stt_rec]}' and loai_tt = 1))" information="so_ct$cttt30.stt_rec"/>
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
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Payable"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_du" width="100" allowNulls="false" readOnly="true" inactivate="true">
      <header v="Tk nợ" e="Debit Account"></header>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBxc5/zWI2tPfRKLyKoE6wdWh/HZsnIP9Th/CttjkLnRZL9rAiY2Z22xP0A/ZgAjuaNL/lfHhmuSMua5cqNmgFJDolXZZ7lc1OeP4ElgfMp6nYNJs71i6SBmNmux2kjY3BNOLBjf1szAuGaza9BM88be9E+Yn/T2HgjaU9gkZ4ONsz+bqtDprCuVGq+TtFLHpT5rc/aq+pFZC+gi2HyYmYpDsVM6aNivmXoWE9eHSGiLHJHh9pQpNsGRaBi9x52Cvs3mi8dCNW/4VNwbH5ZcWA1MLyj9MfxlOk7phoQKjHBVmEPCWgkTKZpKNXo7Qj7hcg==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="VoucherNumber">
      <text>
        &CheckRelativeDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFJdunbbknYZEyRnEbb2XsruFjkeJAPuXsSeVoxPa1PzWi2H8J2WoxbvkAvME5BBv3Mvw6yuDl+ZWNkM4regDc=</Encrypted>]]>
        &CheckRelativeCall;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIABejPps+siE8zySpR9xLlN8s7ysltx/WwahcCVF/JYYfP1nStoYbFIsVfZ2XIzhGPAqzq6bV53zutLKUe5H+2hK2z4NqgiXGpgNWs28e4fE1GKP7wj4ko4ppH8yxz+k7PqxhSkfhcTtX5Fj+aSl1FRN0mZeX1nDGDJIgbe7bx0zhsXEXHXXvKWdWvUPlFV9BVyRW7MfMzIEbvz5DYeM8P30TDobBrVSZdBsfSHkn9qqVihzSzeFmb094o1poQlaRqSlhY4NGfNJ8MYXLhImM3lh7zXFNRZSZWRMiOT42ueZF3S27xgOo0TKew0Bxx3iLp8xOGmhZnRvk2cc4uI4y7KGpgdVFG++oqOL4knSMp+FCGdos2XZeRkrE5ly74dx2XqBtwxJBqy1qpHA2e2t7O1yxav4SvaWWFjL2XuCWxaGD+ACPG8IOX485GEQCcZi6Ori5u3L1kwKtFO7eGqz/vW45vwYU940fKsNDySby2e+Q==</Encrypted>]]>
      </text>
    </action>

    <action id="InvoiceNumber">
      <text>
        &CheckRelativeDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFJdunbbknYZEyRnEbb2XuA/hzJV/nZpDgIhsI0a9XSwChEcLug5w+XO5Ykgy1V+XUwQ1wGjA26BQX6rswxjpM=</Encrypted>]]>
        &CheckRelativeCall;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py5lIKgijFJmYStuYoqOt2JVBIZgjW8mWtAoQdoo4xfTP920uCA6714Pdk+4bKOeQ/+ZdFeQGb2mNEVuqINan2JYs8GL+6/Dk21X5hvExM1bzaHqUB8rmJHwUs12h5DNoXf7rW4WNEl/xfXGM/58ntxtLAq82u4LfWSy0FXTh8BqFc1fhdONnMDf9BTLmSdgxMpx59i/W6NVpOBer8rgqR1IHkS6E333QTowgUpH5IrbFbEnex3Zxdqh5ERtqsBMHID4Q2ExTNjdVHlAtE4X/7O9vWuHIbnxKEePSxVvnOkFUTTTenTPE1pQaxIz/NhV0NLDircHlI6+TuOORnDaDv5O1RQxqC+hsfNrXy6BLO+/5V8K+/ksGzySFd8jsfPww7kjhldO2+fuHO+BfpupLmvwx2ZVEZS0iq8K5CAVlrZly4eH+H/fj4uAZtiTxO4sMBRGpEzvK/7izK+K4l/Up/MXb8GYC1LHmA+jlAI41WS9Z9Rc2yMNpe1ZeftRtAiTrK+DeLWEnCohVFet72OqdVitnb6tDJ0385nEMPO7CG1s7t+oPOV88kjH5jThtA0y2LKBMn/FtzZKDWpd9CKUiKR8feIDHSF9mxL3NFYMFhYdSkOxzj1sZSAi92E0GxB9wHS9Fpp7GCMlVQC55QbL5jqiEPJmIqKe3aRf2d9bCQVE=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    <action id="GenerateInvoice">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKyDClzv9X/VlqamVWOZ5jzZ2GR0ipPLG/kkBoA18lORSihTveHBCACJvVqIg6OzD3ELMdOTZ2sfcludxlbzrQArU5NfLM+fwo6xMab9U7gDl2ltCCB+jrglTxKfVYPqlzTyGspXuqm237Xctk6TZ6IdTcCqjXD885cHH7SPFG0hzt8x2IC7Zi6X2Kmm+Xr4/dVyBGm8nQeaXvjWlMICvyGntHl3ondK2K7hb3qvpmclLQkWjk/uT4vqLCC35TaRrCfKSAz4+iubmciGg7jaGZMX0sOQjRN+ox1wvJ8Dz/gy+EsYJCZm9YL60dmOO5z/kw3VCVDKYiEZPJZBN1zfj7JEDe40HHYawvgfymfImHjfeqKXgZnZOicijhm4Yfgdy/lklH3aDYeF+8tmMfJx7gWZjFfP/rIsGIxUnk+LM1ori8B7KIdFKFw4U3lfuNX3QMbgwUcozik+OS53x5EtVJDRXMHR9dqwnauG/K9OYJxpISHQHhEF2jIbArgAGfjlnJBtPOG1qcwXNkP0mZ5WiQBm3aAi0vGjFq4XVHR9LpjSlOhQjX9T1N7OuW3dQ3yxJNOaM+btjN4kDN0EFP0UyB72TzeYCwp4Yyp39xiufE2PjmsC5BxcPuFDrHPtVUXo25WDns+sTAVoPsxnvuzCsnuQyMvKc/CwNsYsJCQbOsXaGjCdLhk5Vo6Owcfa/E1KfPC3XhULLAiBTZDaWmIWjF63z6LlNGugOfEBOCMtTL7eoVrpLWOccSH4c8a7K5g32ct8WGIU27fnH+E+9C2FZPChLwo5fhQmq+yPsWfAZBSrtEcevDMkDb5QtvpwciOHGn3wEtnn5uUlT5KBP1zN2SsSHF15nulEZiLh6x8v9Bu8ZnTKFM8P3yD3iJUYjcTWQxEWb1wIWUN1POUhbXRepYlqpsiv0HAE3E3b5qSgRN3E/z0jfqKP8CY8dd7+eZPX1N0XW2Y4p2GSuKp8DWwpiL6ox70WL01e2n/70PIKHivOfMlVW38Onq1ZApwd0PN9NCxb/7taQBrFDjFqpGB6mfGgMbWB/fQzBkTAiHlFe5l2y1ksDQm9WBdvIk+71ABzseumUmfdKonjFhX3cN7x/DBYnkSgokk7+/4UYJChQJMK1r+dTYWxfXo9oaxDanSZpw==</Encrypted>]]>
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