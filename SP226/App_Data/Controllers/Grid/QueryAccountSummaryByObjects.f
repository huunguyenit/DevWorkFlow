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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVTOieg/evw/3K6ThsSeWQtcX9NLlCjnGQoX1nhZ4enepeyR7PV9WH1FXVQ0fbVaCLgbabrZ4yt3NpFBqvLbLVq8MqSbaxUa37GkeTapHUCwbjzko0RQrY/rjnusRQxQBp/jwE5XlPS585mhXtsToI8mcDCYMR58U7/99sTlEJSdG8IFfz2ZQWLz/0A1F7pzURxgZQtNK4zsYmMnhXDXef3ZTRV1cn+DPcOlTAOlLPwK7KKwXjOpaSYVMWz6vam0cEfq9z2gV8fLp7G7CGhg35wiw56mfIno8aeV+qDcXJr0ZBB/Qi5QC5gvEn/L+YXpFMooLe6NnFj3UC7u5OSVOoEHTaNrdAzkBycjQEUemPmKVwEtTfHcygKg1YGeLNFHBEPR/0aONZNeBxby5gIzQ1A8HmQj30CAu8kUDoHB5WiQW1PtjrU8YJyqAxIDwQMsqPe+UeQ/ZKePJKTLNtlh3lciexVgp5GpLrMnEXrpYNnos/H3ECMSf6ojXH30Wnvdt5l/WthxxLKrYRA2Z54TxiwTmSXZp/UDL81e9A81VBnt1Mf5XReHyNOv3FGefNgiTHdhB3sqEdzfBCFmknatsRoE=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xem chi tiết" e="View Detail"></title>
  <subTitle v="%c - %s, từ ngày %d1 đến ngày %d2..." e="%c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date" />
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách hàng" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" aliasName ="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Ref. Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có" e="Cr. Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vv" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_hd" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Hợp đồng" e="Contract"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
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
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="ma_vv"/>
      <field name="ma_bp"/>
      <field name="ma_hd"/>

      <field name="stt_rec"/>
      <field name="line_nbr"/>
      <field name="nh_dk"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN134aOsWdvvbHhmI+OiPR2/XBBDinQtUo+J+X7VP7TCJKU16iXIYMVHrS/4leFEF89UU4CbWFW06ocLjHj6juoqncqzgW+wzTVTGQiwoQ1CgT1W4h3DZ6qc1ZMObNpAxmZJlM9E2A8d9B871PKXMLYja7amaImzSXug+ZxNZ0Sw7qbbVx2iaR22zsd36JInbkep9EQSZ3TiZkfJRe09Uxh0lwiz3i9dNeGnL6thakKBsnDi2zIXsVx+4fjWTpPWvjCu9mXYsqCpA2Bw9k0lYu7YGxLmcvCL5AyozqJ07CbCyciPMh7afWxu4+jeR/AgIIo9jAq8jEAJ16ZpJ3vmuZZKC/7ytbuJAqljs5BU1h7tOr6uFdcHm0jK47nDszZQgOOknwsSlNSX5WHv346qV1l1maUMFQECrJP2i9V55NxVsHgMNC6dKabYnyB753cWnHN94bgkuQPj7Xa8teylJjy+jzeF2T6UbH6ejtZqk9HyOCrFEuDnNyqGyBttFnAZ7POSTO85U0TRWcTTwQBo51af</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCM6oZHxqQafZmGvj3kJRTh4Uftbe6N3NCeKl09AC8P7HYKqiPY4VrIKjhgRaT/1MS2qM6r+/xI6RBi0foo+CjEIlwtYkvv74I7lxpkTkw+dNYDbFUaP1BGSaVmcLJL0hjWP8Fltf8ewZ9nzvpp8oUv62wq9GBnXbwHdKJGpEOeHzkdPhIEf3+qxsBb2Sqsr2uI9TL6CYzcOkws9z5ejrsZMaDOikKgYPMYUuv4Jf76P8PDlS+J7z3sBowJi3k7iFxnNF+nW3d3Vlbp7FfvM77XVSvMRS1kVx+9K37DQt1xLJ+foDgiTTReFvORXveZoihMGWTRsNatxkvxlHygEqdU6pVbxVWozyI/RrKdY56dCzqECUQR1Ze8vYvoa1/PRosq08asRPnasQiceMFqeBPrms8vkGD7GXlUVGydZ6lmxdyqIXeXZxxk97fwRgTjmgPcXzU5zT6J5Aybu5e1oxvyALcU9RDPOFEsZgDikXadmqXbzm/x1nEfrTz4AOUbKcHpHDPEGkAGfo45wtvPEjMD+Ajo4xlbVLVHjuEOlvxFUvRBizgFNTpF2MJo1JMYkf5X89qFWmZ+lF4kW4H6EZOn4djwKN02mu19DRwfmmGjRUZuWsplZMsBfPNVVstPLTKmOvMemPIoXklRghPRPeMEz/SW/NWavxt88N2F/+SXeBgeWjn8jXmDqWBjgRiOuDucB/1XNV7OochK5JmTFpD0B</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNjJAyrjdfp0em9EsVCdhS9/zf5lpDQBT1xqgIfUXdlBtT0pInjyOYIFJSbMi2eD7PAgWwoplOUY/587I/IHwpn</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJJVky3QqgSTF85N0GoZrSCvV7uqm+hEwAfRp2oWKcfxYguZRVTfWKXrngV6eNnKLHvfUd3xUB8+NzxpTk5AxSlV9s20kHOmKEjR4m46gMTqcnkxTkDJhwRCJUzQlg9JrixPhyUV7NIfC7DtNDVO/Ag3DEe0pn7H2i5qfWIjXAuh/ybumujgqCH89RLOMU4w2C8B84tT452IFrPox929uUoFWGZDsdeU7IXL8c6GXHjobY5o1zp9xFhYCiwYWsesMngJP7dezhVHoA/N9HvbuzTvqXHEZRmBOLVDDFf82f1JofiQgelUv/4+mD5vKe4O903YJHHthGGdjj5uLs+5i+4j9PrPSWI6Zj8RXlIbpn8WT/4LibR79zcnaZ1kKFk25UTHleOyJj0xEgLn68x9UhOot0CtLUPJn6cIBFHnPQcse4hZBkLBcAQWvLu8TjDBFxz8Y7BEUsrlqQFQ9FKHPgSXmEusXnlejbmnHWhnQajgAYyj0+w7KFfPIWfB6inbB6d/ZUuwGKTAGvKH2j0ql0pp</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>