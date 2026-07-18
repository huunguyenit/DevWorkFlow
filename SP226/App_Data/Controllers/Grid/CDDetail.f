<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CDGrid.ent">
  %UserDefinedFields;

  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY XMLTaxGridDetailFields SYSTEM "..\Include\XML\TaxGridDetailFields.txt">
  <!ENTITY XMLTaxGridBeginViews SYSTEM "..\Include\XML\TaxGridBeginViews.txt">
  <!ENTITY XMLTaxGridEndViews SYSTEM "..\Include\XML\TaxGridEndViews.txt">
  <!ENTITY XMLTaxGridDetailResponse SYSTEM "..\Include\XML\TaxGridDetailResponse.txt">

  <!ENTITY ScriptTaxGridDetailCheck SYSTEM "..\Include\Javascript\TaxGridDetailCheck.txt">
  <!ENTITY ScriptTaxGridDetailDeclareArray SYSTEM "..\Include\Javascript\TaxGridDetailDeclareArray.txt">
  <!ENTITY ScriptTaxGridDetailValid SYSTEM "..\Include\Javascript\TaxGridDetailValid.txt">
  <!ENTITY ScriptTaxGridDetailResponse SYSTEM "..\Include\Javascript\TaxGridDetailResponse.txt">
  <!ENTITY ScriptTaxGridDetailFunction SYSTEM "..\Include\Javascript\TaxGridDetailFunctions.txt">

  <!ENTITY ScriptTaxGridDetailAccountTypeRequest "AccountTypeTax">
  <!ENTITY TaxGridDetailInvoiceTypeTaxSupplier "setDefaultTaxItems(g, g._activeRow, ['ma_kh', 'ten_kh', 'dia_chi', 'ma_so_thue'], f, ['ma_kh', 'ten_ncc', 'dia_chi', 'ma_so_thue']);">

  <!ENTITY PaymentRequestRetrieveTitle.v "Lấy số liệu từ đề nghị chi tiền$Lấy số liệu...$120">
  <!ENTITY PaymentRequestRetrieveTitle.e "Extract Data from Supplier Payment Request$Extract Data from...$120">
  <!ENTITY % PaymentRequest SYSTEM "..\Include\PaymentRequest.ent">
  %PaymentRequest;

  <!ENTITY % PaymentApproval SYSTEM "..\Include\PaymentApproval.ent">
  %PaymentApproval;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  
  <!ENTITY TransferID "FastBusiness.Encryption.Begin$1WqVm/SNVPw2M8ESeCfvNaIiD7Xw6NDgXOTizF7xEVA=FastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVay7CUSCCtykRCq8EXpO0FoG5p0PRC3ik5cF3EwvrybMoXs6YLaSCiCYUOClJnH60O6LG3zxQmTqlls+xgoUXZTiBEvhqqj6ERblzJEewxijtZ47A0ILJWYb8nTU5Jg2BNEj9itHJlUJkIECrOzTRoiZ3nTPejoudDhxos8++VdKpnhWv4G5qc7Rs4c2LHmMNE=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeQuery "
  select '' as [return]
  return
">
]>

<grid table="d51$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="PC1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c51$000000" prime="d51$" inquiry="i51$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd - case when e.status &lt;&gt; '0' &APVPayableStatus;&VoucherLogStatusKey; then isnull(f.tt_qd, 0) else 0 end">
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' &APVPayableStatus;&VoucherLogStatusKey;then isnull(f.tt_qd, 0) else 0 end)">
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

    &XMLTaxGridDetailFields;

    <field name="ty_gia_ht2" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" width="100" aliasName="a">
      <header v="Tỷ giá gs" e="Book Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true" aliasName="a">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &PaymentRequestFields;

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

      &XMLTaxGridBeginViews;

      <field name="tien"/>

      &XMLTaxGridEndViews;
      &PaymentRequestViews;
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC55SKKDzpM6nAJIR6M3DdlNMm8734gbnqrgAI5/KE2EfPUImyLjMjapVxspKpNEqeXkPehR8ICPiPEw+ItbSl0VMgvLnHZfUkw6E3SwQ59lidTk97pp4ABanX+y43YAGsDZA0nbtOndWhlhXcngd1qF86h+IexDtefjbv6shyepFjDVu4iZH9X+Bk1j6nf3iQ60UNOq3ek8Fz2LosonWdmXlLiwVIiNggfxMRZ/Supch6gjQrYd0hp4Rga9wAzYje</Encrypted>]]>&ScriptTaxGridDetailDeclareArray;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YJA74wLS4URNjbLtN9rGF/A6nMyQ21YPC80gWYnUzvfKQkLnKq6pQ3BANqeedk4ZIEOu7Ux7w7dS4zmsd++aSkashLjft3FBcr3YMnyHLidFOrnBygH9P+sxTUS/nJj7/2ceO/W+1rEmONzY5LkoeBr4WLjMamnurY6wdlAzByDEpBhNY1wAkCMWLrvDExfhFNJhLWu4hbrY2rYmjP93v9SeHVdXcpBZm1Lj0BI2xwLtgPZfxJBxbLTzBwQjR38lvSi+Kvhp8Ac1UYEH+DevDZcBXzkmZFb7+VrS3IFHF93nEXKwLAy/C1suuaejsl1PlaMbTlPAlLBsVPICI9t6v8OnjlH+E43Yd1upq9NdiAml6VbpYTcY/Qy/pBT8riMdK9rD0uaZHE/JoKAYGJY0STkDEsa/tGePnDsaWT4yvRBYisx2o4GrZXhpXMtkR6/FiTC3sGN/CReg6kpL/zAl38KPf5Q5iXzWjKhbYQz2q57E4rcf/see++3vF7yzKfjIZPz1FaYTYPDn7oXCCA67GnLLAF5HUNoud+klfmQ0qBobvNo0ssf0vW+hj9li7zgLWYX7sOQK5PuMsaA5cwat1QDt+5Xf0aDp7L+C0NiJpzWcU818DcTIU2XFU7Sri+xWPhT7TpxIrwYjwfuAnOWGUJsJD/O2kSORAsGKW6g1iaM7aM8UQw6ZSbqCBKQLyw6uk0fmnbKMEKKy2bJidXRFQEa6kq7NUpXL/ajzSJ++rlkIh/GcgIh1dh18bEeD8kvWBxzAfL1Sy7WTIl5hXkypTu+KB6IG22I8cWOECJ9ELknfzU+QOBOYMYMy1pr2ulcKjwCgnnCybqTRMJQSZdmO4ll/Y2veF3Eo3yPSS9MILXB22Gik4eqjTrtPYThAu/EnylP97p3DZgcH6fR/CtiXCfBvtnHWkcjylXQ5mbwwiPz</Encrypted>]]>&ScriptTaxGridDetailValid;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WDqtrcQ5uTZFVQLVUA20ttpEaYjRJR1V+SbivbfV+ooZvspuyvHkRhzmQ19LwRj7h9xFKzadAcc5uyks2iLIic8VMprrwrF2yNA9gEgKPbVxmYVLSIm5jtC+2koMSbubJSQ3gPi3oLCwC8dduMSvq6d/oRs/FFfuZH0Veh47HKd72+iq3Tn5vlsdl/BDsiUO2HuUwJUsUWq+Bp96NVTXvcno/CE5Ixc3aj9p9HjP9JeP3IMjxq/IwhY8oKDP/51vecO0lvsz8PRSk6vPyuSiTngPKXwGQRHV+YPBHu4Z3rDQJlt5XjkV7FbJPZP9+gmAnz0SAIvGMuSoh0ffHTecy30/AW7bz8aCTem09uRpz3Lbb67xK7zJIk/3V2N9GULqQ==</Encrypted>]]>&PaymentRequestScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fNbXY+gdQ4f+EzJhgvsGRm8dI3azgND7b6bDdNA7p9SGHzxIW2l3b/fvnkqvex+ZicWHhtwG9htXghnSiT6jwn/WMa1D9oEL0lrrumUwZiE/yic5zE/l/ne/RLHpY4/+30lImfL160i4G6P74puxQtFK4IOMBFFhX3KOIvybNYAAi1zjHUrNMUxpY2OL2f8La2qNSFfXLDXcZtaUkR+NNgY+coFBwJbgqkvMNCzm7YnF7f6plaYb9/uE7tDL55wSswxrSts8qr0xt84XryUVWu1GpI99Psua1qulygJT4er1EKdkN3LN+zbn6SXv9Kb8g==</Encrypted>]]>&ScriptTaxGridDetailCheck;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWylMr5t9mxsVDyw+l0odgDoHFlR8ghRpMCAiW/pfuloo5eIukb15bPX7BFoIozBHrH30Bl9dMeWyIHBR0PRi4X4tEjwy1YgxSmiLJMiyVf0VncnGZE3wAeGmnHY7PQEkLdfldE+zlMSwHJ3xFUsm3iK8jHzmABDezJWdIetOEGvA5hUjP/oSPW+RUxfjK8VpRzvlxkBaTZwuBHs3IQ6oMUUIo2tts2WkSP4beQR+USUWAxol9mCif2RfnyVOUR+xzTtnM0MXTCB+Q4vZ+aYUWZknGINhDGgBs8bAjswE0EWH+T5a21r16aV5A9GMMxr1626pqc7iXFzZhe+VtpphqqBQR21lrt3T9PKDQqij2k9Ck85QkeAJtTeCI2Ha89Vk2Spg1hIa9QCRqhh0rtd+JiwrApl5TfntqvGoiuFiq7nDUExbBYgleAVrKzyy+EXIQXJNoiWJ8ZxdX2IJk0ShcW3brW/57X7PEw9lniGPHK0sKisBCD7sWWO50KBJy6LQG7rSIUVbASHZ8TVTwYVUXiqg=</Encrypted>]]>&PaymentRequestCopying;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKuJ0FknDVln2sNxA9f0z23aUJCyTWXAbOlkalU3fgJSJRjSWbykG6SOfPAOdVxT8qnqQ9/r/oWCVfDRfpjOpxkOZ/Xeveu17cPwoXaHiXDDUak4P0kmDC30aUo2mG9jhQdBZn7ZZTAI8wUHVOvKSdDloZ50iKfoUxC2oFoOdLXYCK0cvogfgpiDsz1li1cJQqOclOjd520ENFwkSU1YhdstUpapuRO3zXO+snIqy+bZK57yXbCDvICE8lbPsVbsu4sgHUD8Ajr0uS4PWA3tIWMGXKBwEDwKScDdEFi4+AbhG41dqv2RbTxAAGLOCZEkN9rcmLiYxBp907DUwS2nM1ITgKJ3YwJVabICUrOr6TQn80FLxzeTCOQpeuulf85no7j2zIfs6TwWKNmrkrW9mLtqtnuWtfBhy0TAGkkXKboaJktZgc4JWxA1ghAR3hCrpl8MGcuKUDWiobsV4g+6xNBBCakiQ00owc+YMVAmIXdvuT5EtdD5oSqnIKtz1dYTgPqa3CyhjK+jnazo7Oh8Pui0=</Encrypted>]]>&ScriptTaxGridDetailResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>&ScriptTaxGridDetailFunction;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aFHarbbdE0rhTWsqJCAqQTAlDjZfKNAr/YJjJ6I5d7ZVCzr1SwDJqdmtwu5suaYOU2+Njp6K2+riC8ONp3zRpe7fZXSciP1sINSbRhmgqbONpQ0hFYnekmPgT95nSs5pqapvCOtak6whfyNEZjUDb92yVSRvbR+/1oLMUerL2J/5NsSRk2GvUmd0lzNGKTFzHSEHJZGben9XVFrzVqUJt6+zYwJc5oojr6dCUK/PxtkVnhOlfWYQYxgqH4XGnky3nNwrEUS1HsgWBp9w/K9S3L2cK1HcxbF8jrLano90ZXvxaBwSYOJuFRJC+0kqe6iZ+0iqKqSlMvJOWasV7Z6ymfXcPga8TM6b3BsCinYv0EjXZ4cPwH7Wid8qY0NwRCin2W4XTuLbRJwxN3nKDEv/eoHb5G6Wcqa/zwaqno/Q0nCH9MAF9eCO8JJ3isVkXD9BfaThmDe6Ma17SHj/KxE0/Gi6rWrejnjS7plUC5tLh9rIXV6hpxd0tnl1lEf9mV5JQEuDWyITbYIuz8sxAzx2+fUowCE00pzjTFdyQWKjXf+PFyVhKmRx8jf3s0YR5cliNbQqYwqcRn1lgT9Bx38FBpP9S7yUujw1NqQWT0YTOsT</Encrypted>]]>
      &DowloadScript;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC4fYRKj6tyfZLrJgISPmA2LDZr254zIFLvrrm5EcD3H135DeM0j0kru3pV8YKDj3w4g37rWwBbFnfXd2hTKU/CsWiGOk0W5H43R5O074qQ45+xdf6IbgmU1rIDVRfoPRJPOA1NAdcAwWLoTvJn9XPJTCcuQ78lhSOdWDTzQNh9Id6RYixvlnDKVwqH7zck//ycfg3fP2BlOTy//DVKsipwp9zJnMmtdHQpomodi3FPHNyFZ4l8nolqZOxclHSREeDQ7AuUHE4P5I7VH4FgZvBTjxGmqBw9hp0ntQe1e0QIO8Fn7ndhWPuVjVuG/+owLJ+6tUh3x7S1MxSIvAgw/oA=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    &XMLTaxGridDetailResponse;
    <action id="InvoiceNumber">
      <text>
        &CheckRelativeDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFJdunbbknYZEyRnEbb2Xv2kjAPbyP3lcPLdhK5FON2CNXz4DpnARZZP7+lx5rvauTnekpEyYbQBGtZSzAxvnk=</Encrypted>]]>
        &CheckRelativeCall;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py5lIKgijFJmYStuYoqOt2JVBIZgjW8mWtAoQdoo4xfTP920uCA6714Pdk+4bKOeQ/+ZdFeQGb2mNEVuqINan2JYs8GL+6/Dk21X5hvExM1a2pX3qMkM5QQLhUfmtKS5+UwKvjW3gyZoxc5RIRLZegoPZHyepKrGp8CFoyWeSm3kn+J7vPlXPPgyS7mt4L5ctGqmuphyNjBssC78HSq3XhavRFKg3kgZhrbJtZjtc9XNCVCvXo55h0aNjhZnP0lW5of5lKTuUFv/Ov0Q7Tzty1kB5cdn5ns2gfW3j8Vbr8m34J9fRHpNlx0INmusPQ0ibovqk7RIngJaiLKn/ZuE35a7Uwc5vvaaGqdXhtacDl/ClnfYUPa0SAeG6Gegj3kiyDRY16C1sWyiynXqdsC0tVK8oQrzXERvmtijBLolb7gbprSKPutmm8XARIu+Pd6sdWI4EQO3C15WIbKKb1Bm7YPi0bfdHUM9WrxY7MrfezSZGJaORh43mtBRMr06b+H3PASYHPFU4VKbv3XYAgecTrtmWFsVVgm3MULH2yYS4nDKX3FH8HeH7sX7uJBuNYMfBhUbkwhyzvrGMFPchGRIWqdt7+sk63zKSxk6w4uoe40qCXlqo2tYbVksjCwRl9qpOVsQecA92XjUYjcUkEUpJm7nNH7K/ZDYt5ctAM2kVim4=</Encrypted>]]>
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

    &PaymentRequestToolbar;

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