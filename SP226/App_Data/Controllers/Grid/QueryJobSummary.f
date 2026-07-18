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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF82tC21UrccdFvtPLheeyb9oD9qP/qreYbHQKmybCvJtIl1EC+HF3u4LILYjBxbhnFaZ7iIC+HYgWGdNGPjA588PaSmYnY4Isu9vd9szXyvXuPJxlLTJNLcafhnTjsmcPmffWgGjNFYkbfnUBCmJsIyy9X/nqOh77fw5Gf3h0AWElioAj331CsRFTo9enHiS52iH1Mxa+C8j+I29p11rme3bzXmWrApgl0BhHpGeNIpiX4FKYcvm8jY/VXJegXBKoFL6Je7drySCf5DwN2HLMuiDGwS2LlZlATycTzESNmLPWIfFjLMaaX1kpzDPKQkAtMmdDDZ0mgEb5w8SEAZaV4xr2TTyZ/6oX21nK7dG9nnAncSfM1xNsafHN94pTMtLGfc=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo vụ việc" e="Detail by Job"></title>
  <subTitle v="Vụ việc: %c - %s, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Date from %d1 to %d2..."></subTitle>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1APqQO79deOcwejbPhGNP2yOC20ZzDhPzqNIu1ioFTZlqxtSi3K3vMgKSd4EEHpoi+6MWxavUyeVoyibpIGJvSun76GQAh9dIqWksxjDas+khFTppH5cjDKf5811/k5cFHhv5p9stUGrBVUg1qwa3pZzx+J9QRYNLwkvSwNOAXAo6Al3c3PShf4L61oSydlBomTcBvcu5Wa1WVJ/cDnzvBG+EdmlBcIhqZ4AX2tNW7gXSW06eVfz3UsgoMN5TfHAMINifNfPiLGtyxMho9Y5WXVwlwVbr7D8Z8lJMIASKWOc+9mIwdenNf3GzBtTgpx0JdiWbsnMnFQS287eNaSK8RfKOessIocg1E7mQFu4aQv</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bA5qbAm6yRh7mUNRQjDAD7hwZmGWxHnDvgUlw7zJjVbVJepG7biJtzBxESbfJQMj/lDl4nibzFISAxruwKwlIC734Kxwt0YVgftlI3GqZF9EaDAE8KoyDwSAD8RjvKbOXeYzMMqj6tKRMg6NI9T5g1Iz5z6+rscnEddFI7V4FnlfRVFSB/WTYQ8rMq3IFbSrKXYAlKl2vEPH2ol670TPe3kwvL3Ujb9tDEIbaIy8J/BoKx68Bl/nbQQkQTzeh+WomwRKGCAVR2wyULK/6n/pWIadcmVCQqFLOBQe6NARIqtqXcDdh8IjCXZ4aN5MUYbaCKJinN7KgsnTrixqZyB75zROZhExQw+CALUSIPyZ2YGFKrlutw5UeshU/wL6YYG34OZeI6lDP7TXV0EZLAscZvzeolFhnCIYVA5qV1y+GMpaQb53RrLNlFqtipV9hS7D8mT3L+bvWRLe36FGOckdXGczkOF7M2trdVLFb9uw8FtOty2zdjSXnBQIjDkzhRXgQRhKNUfPYsA/vennwinROVd56k40IeCg/ucbQO81Uyi6K0EEfDVdn3HIBpKYUU+vh5pnlVyTX1vYi+5RnBhCSKe43dHWKJYfWf1u/+2LlrRMNJai2LGYh2Cxs7WYgXY1YO9FO9E9L/2BJi8OOItufgyzhmGfzCj7IDd17OC89SezTN2L1XzNApUgf1CAbb4R0wb0lXJMStHMuyu5ExpDrmLSV4i/Bc/tEwG9JtWixroBLWEuxuXYxaFGeoxl8MKZcS</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNjJAyrjdfp0em9EsVCdhS9/zf5lpDQBT1xqgIfUXdlBtT0pInjyOYIFJSbMi2eD7PAgWwoplOUY/587I/IHwpn</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icMbncKs/iWy93M1Og/JxVx49WXyj0VshM4v+uITcTa8D1dZVfCwAGV7Y1hsOfwJHiCdIFimG+VuWZnlsX6FMICLb5p4c0vrubGisbDNBq7aazPTMTYXMgKCRc/vFvc9klIToawdRK/uv9r01JZV8DlS5I8nUaMmfFysfZ/njuo9Rw==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>