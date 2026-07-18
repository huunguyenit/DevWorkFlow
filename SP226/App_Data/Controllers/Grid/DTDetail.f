<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\DTGrid.ent">
  %UserDefinedFields;
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="d57$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c57$000000" prime="d57$" inquiry="i57$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd">
      <header v="Đã thanh toán" e="Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - d.t_tt_qd">
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

    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Tiền nt" e="FC Amount"></header>
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
      <field name="tien_nt"/>
      <field name="tt_qd"/>
      <field name="ma_nt_i"/>
      <field name="ty_gia_hd"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCeTBIBmNizVCrNWMK8Ev+JVCEJK1s4pPqPOMGRKv5gZ6vWjUfIsmy2ByOcHXek8q9Kbp4SJ5sy5ibxBfKIVVdMXtBN7EH6s/Fc/k+Tdw2B3MaxUMXABq+rXwu2oFhrbS3LoEF2QaW1HGoq6wID6odvZdNb4bUQgfr6TU+3zY7wxWFHv4ow4TJLd69M7jKDzqFCdAjEIBhOTXECAgR55Wli71fyuwsoABBTtMzSwcX7YUi8O5HqNo34EJA341Za261Y7RonbZ4sbt3276NI5txs0Hy7XqFTYlkoG79++0YzG4hlnGDd4N6BhlTAFwBntXd/uj9dVVYRBNbNwwkzU+9pl7ZShaHQUAIOefutv1q2/vOcv1292tNVMTQZAY8fFlF0Zof0WkrzKpJp+oLPyOClV47EmVl7HNZ1fPt8y/2T8/Haueq++NHs/jM4k+8FL+I4TfIGJeXKPxYcIujgq81/75Mn29dhRRszqrjuRujjcfrtVd9d4IzxBHfH2knKPM6gipw71+6b4fGqrmrCMHvjoDAG/6YFNX7l/4uGFsdvjMJ5kiNRVg2+zrmgLEAoV0mYAx23TcoqouZO5gc5RKH+6kpTJDhyYCTWaDtkHZxufbY9u0HNNcf5b6iinIim9U1npIlVo1KYoJrOpLbjySq31HDqFyWM/+thCTDHyJJz1zUCb6WPRS3KWotrYCNRfye4ztmaGqlMnKR5IF5uR3QAWsFf/4qdryyrE84hb5Kq3LfHJFdDVupfxHl2SZ0U3z85Q/nXKoDNoj2fkqz634bFuVL8/mgNyiwdk9+IMujuOhpsTsbIVDLuYqQ35kBoIhF+2NHdgtzagSSzxEBjkq8uT+3xw3ABrQ4sG5DpT3LyeFwu1y0V3ddwS1QdfNaGtTsIW5Vtl4kzHBikirTXgIhjNMJXUAZhLKc8BHY61LGUvUrxeW6wTB5tVmrtRChxGQQDiG3n5VDK9ugpu1n0lUHxC7w7dB+rXydzs0xuc6mLdPpyXHHr6Hq3ZUc2aZLjMJyHbBndsZ9vw9MLRTH7Wksb5C/MjNeg0NvdaHja21+7gU40mLqAkPaB9xL+5C2upPB/7VQDDwViX5v8U+e0Ubt4GUHk1vGhzUpOv5X4lbbFnPKKraJgeTuoiGUnY09NQvZ3G0AwI+VnlCyyvOVr4oDEpb4Ps5dyvvmzR0Icd2gs7/eqaTXlErNhdFv2Z3dVK/+b56yrX7Ncldo1Y7rOoSbow+ZG5GHb74xILn8uqKpqQ7HIekcVSHTGtVpnAwRVgK+t2pu4JxMJoahG6yLJAO5loTjKtZwgw0vNFJHHO49JwbEkODsugIYn6XLxd5CkU+q1k3rwG7kQw6vdZnwEPZf7xZDNNHXbo2c0DQtAWsgtDshE3p85trxgTK4ii1aSy9V016XCcfGGI6CcDvnx5A08tU2hCviCZC4wii8koUaAyaCnAbI7MHXeCE8S+Ri5j6+YQc9UtHbf5FwfBreHbMGViel8gtfNUD6vARIpVsp+ez2bdncJR/KZG+mULhkk+5+Bza7b2VweGVzq6ZAZkn5xitX8Bt1iJAL2esKF48GJaA==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC4fYRKj6tyfZLrJgISPmA2LDZr254zIFLvrrm5EcD3H135DeM0j0kru3pV8YKDj3w4g37rWwBbFnfXd2hTKU/CsWiGOk0W5H43R5O074qQ45+xdf6IbgmU1rIDVRfoPRJPOA1NAdcAwWLoTvJn9XPJTCcuQ78lhSOdWDTzQNh99Czk+hKq+8BFOffSJBovqrJqLkf+kELJKgNE3MDGVm3SIz+hHKg3lfefJVAZc740/qxCyWivk7RzI3b534gGA7dK4vGt0S/kjJvOjBLyoumwe2XuLxJ5exNu6QdJCHDw</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeOarCVtQM6939b/p/ICXsTkhbVn5+kuFBBSF5sSwAhh4tz0/J8snr9X9dHLNMxNFqZmnqpdA4cGuYgccWGoAo7wvlL74SU1OEUgPcvDzFnV6L8YK2gqDW6j6802tI61WIBbBszzHXja0VvmXcifA50py2vBL23gbO059ORfcSMHFXCbp5HujnVtMDj0xUEvp/nUfAZXr/xMYc3Bd8ruUZIEJqVOm+W2sC9dlxEfmj+FM8yJMm+2k9xiqZRwGWxsoeq2JhNkWr+/PQa4TQHskVSce90aQL+YTYP88hDLOXICsFmlhrXoobJuN0RZBO1uYqUhaNzOgIw3yt4VmgXtdsFFbMmHybcjmShsit1biIs/3i6NykAgRdZq/bT2cFFj1lrQuEwgil5gbZ5s8Wl5U8iOG/HbuzVcQVW9VDWVfbsqwpBIDQ+3ip+K4hZeRuZHDKM1o9jQm/WRXlguNQBeayaDlaJ0aF4Sy5qOgh1S2cCM4D+/n0p8ehzYUvRwpgSeQg12wl/mCiBQTrREmG/xACeh7JlN7DIE0D5SD32bXUCUf9amjhtqhYvJma/vkZCv58CxryCM6we+tMW/67LbUjsr8Su7FJ8gYxO56ASWZNrUbIQZRwtNVedSfs/yy6wxyS2k+sEQSAN2xJp85anS5QujJgDGY/J34fWJqD+mhSxXcmVrOCRJ2n86nBOE27ejL1u0hiCNewvhRbeGK5vKvutV1wkgzb9C5ACXt66WAqJ/GSUM/D2epyAlLdKBPY1ZVkmvm1h0a5Ae7CgmFF1oTMTQbx5QBOQZ4MAprrq/RvGahIcZvPrO0zoMnG64L5ZRhL0=</Encrypted>]]>
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

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
  </toolbar>
</grid>