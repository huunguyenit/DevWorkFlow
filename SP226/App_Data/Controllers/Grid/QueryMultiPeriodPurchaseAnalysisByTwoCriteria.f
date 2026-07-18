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

  <!ENTITY Controller "'StockDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVakFMGAnwAWP0D/tUv6amT1rzorGxfkjBh6rO3X9e3S3e5f06N3q+0wh253+XkVrjOaJRwDv4EqRIXQ1wczqEwJWlinxVQhYtgwx/w6dfZeV+FX4zrQH9gmp+h1DP8InrZJf33nIeEZVvY7oF0PWR09/QmFCFTY1jnKLYB2amgqWGzdin8ODRCIml8TfO8UZBheBLtFYoZI+hhg5nthy0Zg3fsoCLKFtBwAq8b97TnSov6JkRt4DHi3cuPbF7mjPcrm/Oj3+pezttnRK8q4kSzH/+MDm9QKCvDlDuLOM6Xq48GZwGswqNWtiGpql4rLVHpeYbRvYCUQNepM4G7iPJS/cgYIbww/W+BErggQ7z4zncwL7XarfYjN6orjHs3FeUy0TGoDAa1fjDpCJHdS6uUOt5b3qtcaYRo9auXywwAqvtczhDi05Dl457Oxo432HuHEs2JdRaBSxd0OuV6Dtmc7xA7rrKOfe5al7WYdop8lqFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết mua hàng" e="Detail Purchase"></title>
  <subTitle v="%s: %c. %t, %d2, từ ngày: %d1..." e="%s: %c. %t, %d2, Date from: %d1..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã vật tư" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nx" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá trị nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá trị" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_bp" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt1" width="100" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm vt 1" e="Item Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt2" width="100" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm vt 2" e="Item Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_vt3" width="100" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm vt 3" e="Item Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh1" width="100" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm kh 1" e="Customer Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh2" width="100" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm kh 2" e="Customer Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh3" width="100" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhóm kh 3" e="Customer Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
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
      <field name="ma_vt"/>
      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_nt"/>
      <field name="tien_nhap"/>
      <field name="tien_nt_n"/>
      <field name="ma_bp"/>
      <field name="nh_vt1"/>
      <field name="nh_vt2"/>
      <field name="nh_vt3"/>
      <field name="nh_kh1"/>
      <field name="nh_kh2"/>
      <field name="nh_kh3"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN1EQM/JwYM1FsO0xdTT5Vohctumxx7MLT01NlOlZWZrFxDac1Q2iq8NUCQ5RFNSQIsAHOLPm+J7mdyPp2dXAhLX22t9LBy2Iz9Dr7ADCrhxgalJ+niKdtxF4rhnfrlRJkczDsbcD/NzZtF5yRQzgcZ50EfxORdoHTXcC/+99vYRKAy8tfBFfaiutiZ3mRTDnO5hbRbsHFxkSCC/wxjKoaq8FRlGKkXYZ4kWfOGT4Y5VaqQNk6BcPR9QNEsGWy/5xhmcA/MW1qJiNC6P1yJLZXqrt60381aYdddlwNKF01MhTdQmZal2syeBLLXzM9IZzX7KjDXQUR16cRZ+2IxTe4VLboTDcKVxymmLiTplmZgPxwEGSFQtQiBuB8QlmJp5nzYAFG4UmBODvRZd5kSwIi5Bw7EMg6S5s+sTKFqvdPqD4aff0I7NUklFiUdjfQtc+T0Ma7ruyIo/JugtL30pFQrTO1daNrvxxXvP3gkAmCzxi3/7fzAN7GvWAUIVWKdvUfYWvOnbgLQxAlxB0cNNJ4kaQIFbfOeGBuqhu5rVJgp+xaqluVFyBWz8EVxWwMxFWyO6tHmPj5ghDZ1DLYkxFgz7</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAYHJllGfVnrqlBt07AKKP5X3nrcYdMF61gSgK3ztk6KLUJLPbbzTJe2sOivJxOuqASLmjiY4k7SIgn9zdjxxEk4bu30Qoj6nBgIyUevYP2K86kHBmuqsWiETH7MPA1jyU2+e9Ly4xsHGkSLPp9kwfAlNssobamYY4indQBoFoh77wbDV/4FNkh83OxqLsTxA0Z0Yiy0DoSPHHqJkzR96nhrfzgYBPGm8uPrmn6iUmHYvIhskFuLKvhUZClXVUE578i4cpP/4Cboesd+YtWMZDmpRuwUs1HZRMNS2vLQxqK8EAe581EdMs6GjU/aFirutQku94JFtZpYb3IpR71GzWg5iwEt1lwq0EYTSccNpyJSPk1FQN5h8G6byE44QAtVQNbDjQYeWWuwqtSCwE5MoP17lLh4XonGPWfukA2UoAgPivIQeMDOOpNTdoitrh2CVvFd3yAl5gI2AcFr9KvLJbjs90H6k/RBd70Xw3pq9xepkk72lkDulTYuUAkIVCnDu9VhhwbvAXegGA1p+GsnES6+V1+Hsdfo41JyZADozoPbmEsBCa59QV4MrvO5b01dqY</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWZ4mZfj4voyQsjvTugex7X5ZGRVkqQd8K2CNKKZLe70qhKvJefh/siSeeheX0MYPWKyaeu4pyamGszunLydnr3FvnJv3LXAQ8fN/uOjZ5WdDcW05FAnFCh6PBL0bN7FZsqe0lpiIoadxS0O8v0jdtyAOgtHaxTIScpZtD+AsipBLA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtvnBus/kg8ewstuZRlJDog2gXfzSddFb5luD6xQw+WpbAA0kBpcvrwxeMayHJFbO1yZYfpWCdEZ+Z7J4bHFKNY2Q7G4nSz2LIZ1xnA4eKcjektGkjHk2iHN4ZWV48awWaQVBdn0Wi9Erbp8y2PIwhEJofEh0LhQGUSBSLcVPW5ybUYU6UtQTubAheA2jRnUgLRzVogluAyk9h14H2WLnWXAPM3eZVWsP73nwTDLxzJM3/nSqCreAT6YBtq994D2UDfIECL1jyYHFKOX81t2ipiFhc3gC/RaGBs0sDCMp00gDyELOPg4MpfKGfAI3dVGnHzeCWAP20msIdmfdTE3++gRmzUI7ucR0tuk16bPzgpsP1EJD2HYRwLUMPxuQ0Bkat3k+SyBydo7+REc+YFiYEMvTLP73M1f/IaK85vnn9GSyue/JhL+jzKbCpZ/q3l+SRg9HfSYW/JBCskCSNQevW55Qnv22WIwkQa1Bt3wak/wPV/vZBy/7R03+cyDGgzdWm3l3HKDzMZstzXQipCzoIF6Fi8cNZHzShi6xlOMLMNzIyl8PgxgpCvGabf+Fzv6gE=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>