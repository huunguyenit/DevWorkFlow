<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF81Sp06jz2YFjKM8goDBG5ibksIjJFI+wIywghUwCs1oOqVa8tQZFJF8mJvdtZ8aMqPK6RNwykf//gpDS1N/uzVgUspFbLZybf2KVubIfUo5i7qTRBC/KgbWv/+iGYZgS7xaPdkYVtxv/Q5bKxZn0QM8PY2zAEVcCfdm6hLXukdBYnB27lkZAXy4xnmVUdGeww0xX096gI8JcjqaeWauqAYTlAkXULysL53ZlESo6aXKH7gKr+TUSSi6js2buf0V/NdlyaYxl8wk1e8jc4btfGJ9OkjQ3olQTvhBHUCSUdZrAEPklnbyv4lxlqbgQDIr1plGWv/8DUzyBgFxC6jcZ9VTwZ5OxB/0o3wAYWeLLXYiV2YTVu/qcrOK9LrpCtfjwfeq/rqmk5FhTXAK6TDJk0r/A7GstWzEHArFAa4inT3ZOA==FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vụ việc" e="Detail by Job"></title>
  <subTitle v="Vụ việc: %c - %s, tài khoản: %k - %m, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Account: %k - %m, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" aliasName="a" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="tk" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Ref. Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có" e="Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>
      <field name="tk"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>

      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1APqQO79deOcwejbPhGNP3djjgn6IYAunRkm+rleRCVQXFGXapJDVNq1FzBkqq/Qg5kuh4aq9fSujPaKgIlxaoPjpuDdiw8x/EuJvhQVl+VnvEfzbtHvyCWYC5RO29Ery6Lxh0YiK0olBwq7BrW0hqOX015b+SKwJvchCuqoM1ozbtD50Z15Amt6fUJd6sB9oYFtzzxd5amOac2exOFLvo7Z/lcEqAvaPSB9is9hHMZq4WFI29lzQK68LkjgX0u2GmIw7Uis/0AHerhslUQqkze2MV6jfBbUPMHDtKhe3AfDuxi8Zl7fRj1X2Wl+ZapaOexE0Kd14obetqgQm85PUntVJKHTTcr8nMjkfXTioBuWaInQCbcxr6Uz5KlRXTf3hhJMgWnKgqHLTDjAr3CslwWlmlsRk7cPXacIRMDClpu</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4zLk+rEVFTHOKxVrWOByXYnLToAynC7axsnTuxQmBbmX3iZLLJcQxRygb2Nllt52dfYIcuYWy6x99cGLB3E/0uoATnYqHPuqGH0lBoz5CN6VnBLY+8AXmBPONLplLkbn2yjwGokgXKPEl991CVUS7i1c/BPt2EID79txk/ZnxR14Kv2OtoxACJGzTbKlX8zzJtRC5gMO50dTxXT+f0s4j9Csos2J7+sxOJckmlC99+/NUz7rp3ZxnxVmA6zughMssd61vz5/G4j5jZKxVxe5+2cUsZj2kBG3cs9KSDj1ST6FetPRRzAr2OgB9c4Hol+8ogDG7pik41CGRt1dHbY+rF5L0pv06MQtYXpqOHobYio/iWEqp5ZnpcoEFlAyUBAYqNLxsmjPtdmdF5Ie3Ct2ZmVa22Bu7LDXVAMz+ZVpYPyPJeIFbfD6Xutl9U/2ZxxDkNDkJ452Y8MUjARaJc7z4J+9QsAv2+jwW+HlQ+XOQOBFg/Ixh559EcT53XICqr/cj9c2/51KGT/yv9wsp+UtM+l9g9XG2X//yVJ17o6yY9dVRZzyD2h6o53bUUvVMux5W46FdSUdJZovEU+nzbFjZKCUDf2M4oIaNv/KLBQtZpfY=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNjJAyrjdfp0em9EsVCdhS9/zf5lpDQBT1xqgIfUXdlBtT0pInjyOYIFJSbMi2eD7PAgWwoplOUY/587I/IHwpn</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf6iPqRaroydOMkFUOboIj1NFyaMVd1dfzWZ5+faQ8wWtyYEK27L3l5tgCkEd1vvC00nd6JmonRDtmE0/Hmm0qe1YMbNSM9FV5UfXJ6esCSssPNShH8oKH529MszrrEobW+4CYBZBnFA+h556U0a4b6wX6mQhQ1xoHOb2AZC06EZHVT59NdURlEFLi84MNPqCTrvcZWMs3Fv0B48n/ks2V18=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>