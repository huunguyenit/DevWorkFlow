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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTDzmCi8I1znjR07fT/S3wHGV6g0qgBbf8HhZd7ehlg3wIqIEH8tBfJPfifGYUvPms4wML4gfM5E8I0ejk8HdX5gbp7CvVG2NgPPDbFw5frz9SuXekhtFV+hOCXNJ/1uQ6YMYc/izQTBWXCNK3A0jM0gqk6fAxj5PUURAVfdQiFCR4Fk+ZbBCnO2Vb8lHjQMF83+Rk14s+4OZ64F1VAFe9wiFEbIIlAjq6LnnSrXfkfiep74aTUOX8Tkjppsxj+OU7xQVmvrsp/JLfBHjdsOmPpaPyvowUeGi5NADjBvM7ecv7UTbFZ8IyU6ShKdF7Rj/C0Slsd+m6xbu7675JXjPSia8yGWyzeUUEsinYb5jV/nuSKu0CV3hFLul3rF3I3PMgcDoOSmuycVYdEVlaf27oekZkxzF81snu6S9V4iekPybrWZNE2F7zbAVusF0yNlbeP0x4daS/K2U21xSDUfaKTkwYcokDHYwxbbhvBxP2OqQwedOZkN+/sA5l+kOpqkaUMqrkWZFOf5wxEkAZ1RndZTPPmI/JT37DZF3EUOEy2KM20r3Jh/gf+4a1fB1/Xq7lMgv79nxxSc6RMxZ1/tj2hDq3B08pU3JZcEJjHla000Kow/D2Om34g7RIfi9mtCyuaXBCSjyDkwVSkJfyxs/YnmabuICUzOAYevICnwVVpUfVJPdVTKnEMq2c+REHSyTfw=FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết phát sinh theo các đối tượng quản trị" e="Detail of Management Object"></title>
  <subTitle v="Đối tượng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Object: %c - %s, Date from %d1 to %d2..."></subTitle>
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

      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy4Hfsc5zHZ1JGNYsA4h1D5PDH+gSw9XtxBmyOyK1U5z1FeyFioMf3oScPHHJbqw7/GCAEUBMajVD4rx8im+10R7O+EN0ljmoVy3jwCCNPtYBeA609pFr4WDuZMb0RPr+UXkxN+10Heao/pBiFEtEV/DVGcMrwhBzXYX+qE/1/YzFIwH0Tm6ebkAN+G6W6mWLmiYKux3hAPfW6rrRAS/gyNAQ+4l6XZnRbKxq5Z0gi1H2NYCbdORoIwP8QRnuQsXGfgFjC/LdUXqn1Rg3k8VfaipSHm/J2zAvb697EtUEF7m8OWQ9qrRFIbqLQLACr6mYDLPdaCJK6iCVhWzdIE5fiLqGl0zqSmNnL1bXwlJwUtp+rE+C8FQewrlhRgpqHNcO1deb4sp/M1naQRYPdCzkbwYYxO2eRMFLjPmOv29QdBNDXHtbo+G3rpDcO7D5x5nVA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bA5qbAm6yRh7mUNRQjDAD7h20M2bHF/LjlKcalo0hHchqzKWtLuvF+Uw0H9e7+XibAfUrZpaljBBFWuWwmApTGBfh/aMgrvSPRffzNNq0Kx6w4OdU9NqBQ8zKOVCif34bRx1nsHbv1VnD7huaoaH8/aHabQ7psGzBHA0IL20UIged1OWHYESlVAdQlz74kOELn8M3IUAMzebnZmtZ79sxHeMTwTvSA0MBEfHQV4GfW97p3CUNLF9o2ptoLBqgJdmtaaCLYD2TCe9B5pXc865ZEftmcuLKBeo/gnNQDyDudG60Ja+DsraDHsFQo0D4HRrEkPoc5ho8KBCMpkVng0G1S1BFgdsR6hNo1jEWKtJBGN/0bC9ZW+FDaPdte2+HBiZojQKKuwroAUdfygzqtKsrM3BcQgI6RxOFJGOvbSC9SaQVkSFhmGEVCAiOhcGrUgJ+t5xZVKtqniMdUvN+i7LRsMw+XBz2i1Zg/h/bNtb/IMPgKmDmTkrsocGqb2mIf0Oejub7FmmzXxtmB2TpOeqa65iJSTQK/gogc1vQubcHGjfgcJT7N5tLpygo2uf8Y7TqPhKwoljmnhKfCTzKtdNPJ84HRvaKeUP/1r6QyD5b7VPvYP17Wqe3KTe0ttV9msD0DKYK6efaWvXhoOd99kJ7nQy3H9bWF90p9B+PSqfP5+G0C5Pzr1gZRP/1zcGZQwjhYp9dAdnepT4n7RiWWD15cXHpsJracL+Js8qUjeJ5jIEzeVuCg2+GIrNE1IJkryVmc+KGgrYjUrvIxGgm3f2yKlD6pVse7M5xygEEHnltTXnJp0ZVIV1cLBkGN0Q/Jgqtc0O3YKKyMWAIHY0p+ASL+0G6zrKWniMXa23uh285vSIOdwWx4+i+Jsbfw3HYlCcYh</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmt/SJziEV+kzyGjmK/UqEfHD5PrgDSpd+xj3xHgk4xoyZUqMpuAR5a9ff4qkFlhiNjJAyrjdfp0em9EsVCdhS9/zf5lpDQBT1xqgIfUXdlBtT0pInjyOYIFJSbMi2eD7PAgWwoplOUY/587I/IHwpn</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtcJPhZlll21Es/TQn8P/LJWvyHrSP7KueKVtOSDhDgN5rJXXo1/s3crQm/m/CcJJLvg+9xtoHZ9Kwl47ejdBIPwMVQLVEvukJlMpCks4Ybf0lhomjTa1u2iBmWY7o4icOKcUysuQQDqRTdEKAINa5Xx7Y5lGFHhC+XIHeLPkLCuLBRbfr3vdeJfbjJL8cNf4jyOMQqcP3JyIPeOc8vfWyDlwcku2spKf6aOV1baeeZUzGaFOAJASBoCUzRhnICw1o6pQFzj8CsALm07L0VKVVcUNW7QbyM41Xm7C+KlTIttQ==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>