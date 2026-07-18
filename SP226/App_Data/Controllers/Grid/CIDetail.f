<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CIGrid.ent">
  %UserDefinedFields;
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "CITran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZShuRYttYIx6MwQGqRz+NyioGfPuMC/3c3vmOmhtNdJMRhu+jQ6mwZOzzw6l2lYl1FgYogprLKeL/8OsG6K7z4Qu3D2ftf8GfwUC+8aeWJxbGyvzmI0NXF+RMTEYSpG41+qDcwLUBkZxOS4bE0gCR14qnirSSpC2Wfltu0+8pHex+Cvmkgke4BhRwWZ1/+Y30lO0y+q/uXHwYGs+fSsS9MFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="d48$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c48$000000" prime="d48$" inquiry="i48$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_co" width="100" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" external="true" defaultValue="''" aliasName="rtrim(isnull(d.so_ct, ''))" allowContain="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="CRInvoiceLookup" reference="stt_rec_tt" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt20 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt20.stt_rec"/>
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
      <header v="Đã thanh toán" e="Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Receivable"></header>
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

    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht2" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Tỷ giá gs" e="Book Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a">
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

      <field name="tk_co"/>
      <field name="ten_tk%l"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCeTBIBmNizVCrNWMK8Ev+JVCEJK1s4pPqPOMGRKv5gZ6vWjUfIsmy2ByOcHXek8q9Kbp4SJ5sy5ibxBfKIVVdMhP9UJ2fAdSu+xUfcYNanKO/eJEmDLHOHQLF6Jyb3chT7FhhkMbTcABSf7RpEuQcb6DuIox4zauq52ucu2aiO9SqSDOEFFgiHqkwpDMYgbrFtqbCuFT+L/JQlKCKU/8Fpf/G3mZPuVtrl7Z2v4vIQ2R2IVA45CBiqxiDXvkqlhCD7UXw4vlnIeUCKoTBQzoZrU9XN1T8iRILZm8w3LxUJ5p8eqVlrJQTe0dKiWBVyJ6VGZgmR+6ZTrBfvoTtxQ0+x2chbDEKJFS8ndooih9r/VOqS9OBSs9GhKcZSg+NhOB2DYtthTDegb+VqQ52JR7iJuI3VruDXhV+EN+dwSuSrqiGIfliehKBgUiQCqIx94GoWUZ/JUhefS1YFXC+wRJc9gt9vKxl4iIW+8brmOHOxqsccM3QSdvwja7lgWlxPf0g0CW415bjaoRigw8llLKZ/m8qM1Ax3pzEv+vyo0p+FfHbeyBOEgZ5YKdKQEfNOi5NLCzrEjSC+0OdSe+H0sxQhq1+qyK2VzU1J7ZcGpmRyZV9oqUx+Q1kjwHrBQIJgMwKsmHTXY0+dojcf0kMKVH9VrqAG0+JpvK/zeTQUOeHJpqdtYCAyUcFF8LH3+fCxTpVWD5GfDUYT31A2Xv9fbHvW6EEb3XHnr7edHCaUVM4ZGUmht/Gf4Zb9lez0Pg/+3C/GDNlcp/J+FXQRJ/opb1b8YMRNGixrTjFjAripQSGqWhMr7fpGR+XzLnoZzWw9y1JEXbhUUdliHcWOq3M8AAs3rNA5d6KKp9KywgPatrqQjlhesnat6TsU+Zpvt+wxNTkj/+5GLS5DDPZTv55VuSpgipDdWrD2Lm0Kskoz8iWSXzQksFQ73HDOMoi/WY+5ZKq2ny7N3WVFYKndA/sy6pcXUVOMp/08mzXPRh0BrVa69jVMEkOGEVVV5+v+NJ54G4qGUMKkU04mzYzQDuCwGptC0kX9W7DQypv5fPMMsPIcv7TKCjxFdDR0gOe79npNoJQ9n5Wr0rcgWsAPSKlKC21I2K6RrhW+ETp6MClMbpcJAxHztSgbrwZn+M4Gz8E+KDlnpOghrGDqqPZ02zwM8sIUN4PEYjCTyN8gWgQ35emJyLJEBpSsRFLxWngkdqYkgzZ1uhWzz6UYiS4CAaPxYOU+/TquqXCgfXcSoxOz+7DGnLCHBPJPekXSSXBUMe/14CTglKZvHwJ3lB/kj3CdLyT7f+bJF5gZMmG4961MJ1JYWvjxdupIrHRVZB83fI6wtEWQ8mY3mgA70HNx4CNzxaP1VmzHDISEUcOjjIOSwwa3Dkf5GMEthAiD6SWBsYhD6w0uA64hnB7mJ/behueYN8XAj7pfWD0rX2l3cVkXcTp+WS6kkuIuaLx6dz0I1WMHlcuGiEkSWIlRdinbEDzWXPBOu+kAmfocGyJVk7LBpE4/QA14Xe5Aqc2kRrxylveOvyh0n93kv/MuX9LHSckA7qtfLIRqkKCtOtYzF0pB36AhfMMJyLP6NSvEX0eOPZQRflZc+HznM64YD0WFApWBqn3X56+TGtuLCJuvpqekBFauXQV6JsehCcLEmYC4+oySDkxEH5hfgHIrJBNyBCVzw9ZKY2MRhkI8KkFMN5xg9tMhInO0COXkY6TKaVoF+AUGrtv6WxuEczGX6e/OestWT74jKJ+kQYVpmQIBFDBSth6VHcp4IbSdJYKrSXwsXuQFKzyiTfeKxZj/6e4e5yqJ8VvzSQDXLQc2ebPYx+uXimVbrGqldvEOcB6e4tvJ2UYzrUncOkQknFwhQSCKC9nPKlKo1q9W280OfUhqVTbzE+0BhYXXraHTAfwHMpwzRBU+gTW/yHZ3XHLD2jbGCimoIb5MVnotpv8hstCK6WQSjgVtGw==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC4fYRKj6tyfZLrJgISPmA2LDZr254zIFLvrrm5EcD3H135DeM0j0kru3pV8YKDj3w4g37rWwBbFnfXd2hTKU/CsWiGOk0W5H43R5O074qQ45+xdf6IbgmU1rIDVRfoPRJPOA1NAdcAwWLoTvJn9XPJTCcuQ78lhSOdWDTzQNh91DAuoe7y5Omwsh0qgfLTvq5/8VzQTiIwhQMmuTh6U0KqBohqz0xRIjtu74AhEbqg2kKZTqnUmodRXJHvpkSY9ZmPgl6kZA8d1YizAXdAUpv1Rz+g+dJNyNwfylzC4owEr1QP9xeiJvjSizUrYqy6Rw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py2vBL23gbO059ORfcSMHFXCbp5HujnVtMDj0xUEvp/nUfAZXr/xMYc3Bd8ruUZIEJqVOm+W2sC9dlxEfmj+FM8yJMm+2k9xiqZRwGWxsoeq2JhNkWr+/PQa4TQHskVSce90aQL+YTYP88hDLOXICsFmlhrXoobJuN0RZBO1uYqUhaNzOgIw3yt4VmgXtdsFFbMmHybcjmShsit1biIs/3i6NykAgRdZq/bT2cFFj1lrQuEwgil5gbZ5s8Wl5U8iOG/HbuzVcQVW9VDWVfbsqwpBIDQ+3ip+K4hZeRuZHDKM1o9jQm/WRXlguNQBeayaDlaJ0aF4Sy5qOgh1S2cCM4D+/n0p8ehzYUvRwpgSeQg12wl/mCiBQTrREmG/xACeh7JlN7DIE0D5SD32bXUCUf9amjhtqhYvJma/vkZCv58CxryCM6we+tMW/67LbUjsr8Su7FJ8gYxO56ASWZNrUbIQZRwtNVedSfs/yy6wxyS2k+sEQSAN2xJp85anS5QujJgDGY/J34fWJqD+mhSxXcmVrOCRJ2n86nBOE27ejL1u0hiCNewvhRbeGK5vKvutV1wkgzb9C5ACXt66WAqJ/GSUM/D2epyAlLdKBPY1ZVkmvm1h0a5Ae7CgmFF1oTMTQbx5QBOQZ4MAprrq/RvGahIcZvPrO0zoMnG64L5ZRhL0=</Encrypted>]]>
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