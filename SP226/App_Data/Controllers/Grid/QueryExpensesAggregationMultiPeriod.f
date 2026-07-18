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

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS0UM11JzS97WqdvSlnfHS1GEc+2keO8QiIhMRaTgv9tDqsLZd0Cpq5RkH806BrjawuI+XcBL6HfNpMqYBHBWhfyY55FVKoOlvzqVzGVA1Pc4B4W9kWXRkEKp6JkYZUGhH+1/b3819867s4eot7qwY8Sh5oiOlu3ty+RXX9ZwF4yXAoM8wy8E41RerMxaM4RuDYSRK0jTAd29TntY/VzSkmMe1QIbWxkD4RD8/Qngkr81OUqyi1fmSh+wqwEZ9OoXmG5OsAkA/1rVsNrij1fMQiHWc09wgHDbfeleQNeE8Lz23hg/lElbEN8A2ilOR0PijGCS8r4BPHeMfnUrkd2iqp7God6cA4OUyWHEHh77jLa/WFCPpaS3jPO4vB9xCpV0igfAVRwqWO478RcJ4Nb2er5se9ORFbI08e9ez1NhQl4tSgM8vWdcpf8iP6Ko5uvlX9qOAn5Jsw06SZzoZxsSYMZjbMS0KZmPYUyX5vEMn4fc+zWzRksSbt6Ce60+MmWq3FastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xem chi tiết" e="View detail"></title>
  <subTitle v="%h: %c - %s, từ ngày %d1 đến ngày %d2..." e="%h: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã đvcs" e="Unit Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct_in" width="60" aliasName="c" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
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
    <field name="tk_du" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Reference Account"></header>
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

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="ma_ct_in"/>
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
      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1cozXKOGFQ0YlRFZh5W9YM4axBNML3ga8sX/OkO1SLECmocBYc/R4aA//Zli6t3eskk3xqqGyjig1DiUCkn5OREZof8D6OhhsDc7TOGuNu+kLpE9Bi0TRIqnM4AbR+ccE+DoiMSQBjVjqYkctw59oywPeKbHYny5fkBOAEv27iB1s9g71rbT/VWsE+6MewbfC72Df8CXvIzLKJcTzYHyfxncjVoECHaFkdMPgerp3t9A+6URrKjLiKGEtr2vgUeAmiCCcfc5qwZx9MW41LfKxBUh7Cje8QxbXNwLjykGUSOtuemnxg6l3VZdRN1elWtxCLVIDr/kiwC4TTguDEFHrBeNmbD+A5reazrWDSPHXyXKokBLE6XXuauykvoKBVqlocYqGdnD9fe5MwuGeUF5m7F0uTmFwC5O/T6v51uSndSjXzCGdtA506q4mYoo5DKUF3SNczB4pR0J5LlnOB6B8b7WMb5K5ELKyR1ZiT8J0cEa51mZ2GycR4RxSThcIYT7rZnBrYxwoTb838HCvGfQIfOWaUG4MNGzh5kH83RrS/mJ2z9qz0N2o9tbUHbdS89agbG80FjHJZM0zi/wD9z0HH/l70oz1UKlz4nUVbsLVbHSz59Fo1vNlT9hCsz+L+MMaF7sDMT0Xy9+fakxUJ1y/ZmQyX3L9vwtLNwEj0W+W7aHSnqVDKDlJLU7nI4whDFWj8088qxRqPrn3F3AEUuisi</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCOFYh8Ah7+mmvGVY9Q0bebvZum7IUzS7TnetcRo/NLY3KyasbtXpc2slinOvUIaJEb2WB/feUlq3KJY/oa6jF0A+/8diAZwADHxPGL3U3W/0aVLkKJpogVkrwS3pusmF7NIxXrfiQEA0EBYSkz/APkzNuM5ZkBVTd9263pl/cXQQiMa7R0Mjxm2ahdm6JDY6tsfxrLR4hzO/8hbfmSNf8XEwoaluGQD5+c02HvUd9lZ0/pOoy7Gy5Po7d5FQR0NTCvtIrqYkG3bueGnCau72AFuxc2/Vk3BrCndO1bLmlF3TD7NuUSeH8HhUJGpzClGpkVJ2oJjbiyEofbR5Fl8QsiOj7aB1Ml86N/GXxqCor8mCvPggiVyIQww5TYlQEOLlZsQRZCuiqoyAWLzoGeTuC6ilP6K0gx/fqnmLzRtp55aKg2Sk2BmOr8DRf7UBJVgTKfNkPQbQ3IJeNC2U0KCxeV2SUFtclptM2BpptkpQqZ4gYMNbfwpUSNV2icmI1DiJFBx7zzi3WbQ90+kEjcnC+FGc86Lus7WQwHvHcMsb4pnB6IbNTVjDyOPeQyMFiz3OrTnV77Es2OUGFUaAdC4+ewoN6o+IFpo8nm+LV4lCfad6/GcR/axj4HaV3AbHcQH2l0yIYsRoZ8rI2ngiK4D2Z8Dvu80X1h84vY6bKQjMWwafQjKAor54ZA2V+LhkTla/Qyma6tTu4jecR+YtutpVcqeUaLhk2JxFYoVnpc4d7VgYHm3DDj7yXHSK+GGj8IjXU4/dKoomJWkktrwCZabdon54mo4Om+ck0PeQXARHlB8qO+FnRUV952FAke/Msff5/dK8jaeDbOnfLHCn2atQe8Uljv9jWsvPRELPYVZabBQdwrhcaxLxbjVUC2wyEm+VSE=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQvbFgoCPb8YhWAhp5PzaOTXzB1kPP2uYDZvhlVJttC5Ru4zQdwsxm/2ec4dacIqdmIMZDFraSPU8zYjz7rLwQv1XxNQWTzdRsdXFL3A48fJ5Zg0Ze4xpHmphXqjJMx7zWsZ36xg0aCt+GYBtPzaSocMECL1MYRswzeV1thgJtFsnYjCinUr7Ke0ju3aY1h/bKts2d7B2XG/GkgDoiXbrKU</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2INirxwpxdnzmT5iBpOLssCyMnBiFWyO5oPDPJ1+SrCobG852DwesWHmzqXqqV0HgTZoNL7zeWDGKor6G8VNylERkt2x01NzpN5Bj4GS7APT4Q/sFtZGvG5jkTcCOhR80MT+DTWfwVji9aCZoFj5HVj/2e1KqOWYZ24QgHGbdNol8qMyc3O/Zmpof3m8Ko9Ybr9u8h39+ipsAL5pgT6koxzL1iU/qoKJ1hq+ZrQH/QVbARGQjz/jTtKORrZzlyTyyY=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>