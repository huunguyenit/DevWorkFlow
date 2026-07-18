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

  <!ENTITY Controller "'QueryPurchaseApprovalRolesDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVfOasnsagMGNo0r3Bntaz/oJ7zH+ktC/MhbuAdMy1ILtV7SwofSITVhx8bZqLys9C1cKWj9hfBFavP4sno82IR4SOTvCMI5UL+2sLtipkcHrav9JYxpdnXrHV55stO5PsCLWqoicMvO/JPBNXuXmgmO4jE2thYkFZ7HgBVVsKWsB4x46SMemmw43xPzOzLTTuw==FastBusiness.Encryption.End">
  
]>

<grid order="key_x" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo kiểu duyệt" e="Approval Category Detail"></title>
  <subTitle v="Loại duyệt: %c. Mã kiểu duyệt: %m..." e="Type: %c, Approval Category: %m..."></subTitle>
  <fields>
    <field name="dvcs" width="100" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_md" width="100" allowFilter="true">
      <header v="Mức độ" e="Priority"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_md%l" width="300" allowFilter="true">
      <header v="Tên mức độ" e="Priority Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="nh_kh1" width="100" allowFilter="true">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_nh1%l" width="300" allowFilter="true">
      <header v="Tên nhóm khách hàng 1" e="Customer Group Name 1"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh2" width="100" allowFilter="true">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_nh2%l" width="300" allowFilter="true">
      <header v="Tên nhóm khách hàng 2" e="Customer Group Name 2"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_kh3" width="100" allowFilter="true">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_nh3%l" width="300" allowFilter="true">
      <header v="Tên nhóm khách hàng 3" e="Customer Group Name 3"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="tien_tu" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá trị từ" e="Amount from"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_den" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Đến" e="To"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="loai_duyet" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kieu" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="key_x" hidden="true" width="0" allowFilter="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="dvcs"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_md"/>
      <field name="ten_md%l"/>
      <field name="nh_kh1"/>
      <field name="ten_nh1%l"/>
      <field name="nh_kh2"/>
      <field name="ten_nh2%l"/>
      <field name="nh_kh3"/>
      <field name="ten_nh3%l"/>
      <field name="tien_tu"/>
      <field name="tien_den"/>
      <field name="ma_nt"/>

      <field name="loai_duyet"/>
      <field name="ma_kieu"/>
      <field name="key_x"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4hLYsUY4Y2W9iVPyTyqFHrkp8VP39xHVHwEtrpJqVGhl2u8q+YwFWrW8ffcIWvW8jujIFsYhsSMvXOVDjFjbAUQfApCHx0qoscAdi/o2HrR+7tpE5LLqi0ZdOG5JqQ8QNw03NkCCZOmtBBQaMgw7cHZZM3CKzFCNQGOd7n7hJROZZeUBvcj4UazEWOJ+zdYQ3skTRpItDKZVGXe+BqBmB75cvGh0ra973bEEJzsGLmL7Rs8oKz0HqyLOeuYwZsO5gRZ5KhlpPDMT5XN/C19aV0mE40S7UgVDOnobk9ppnk001SM0qh/9ZSZ0MFZMVoZvDMwTsibQY3VDjgTyLAJYyxwEOGg93003uX6HhIwW77TBT4yMIJ9DDWXVq/Cx13KEwOfjRvAMqOTAfDdNgUhRJH+4nPoU79Ghq+m42Wk2FkbnOJm0ZRxLY/Z2kFi8VGmAcj6vF0lKZWx2S+2FK4iV3IOYZObRJ3aDvivO8aZI+tGyRgxbbFvEKiwizBpyb9UiBVFFZ6Vu02o7OtdPdwGWlS3W+PVYmXT0Cn2cTkqkbp1oUHBWloprqeEebtDxAhGgG2Y249vMGW0p7hFxKvlCAt/8AYAuxBl6Hai0sYhTsejirKHLe4TQYnAHhV1dRGrtWHtzL+HNPa+osRRq4bvMdgyAlsd9ijoYQxuEaJhioVRHNOtd/pBgl/Mg7zn1Y+UNqtQ6g7a3kEN3PTBrPrloX18zG4GCJxGd4958dBakTsM</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux4D+L6aPSkk7OGHNbKGnTabAuF35gqPuuD9ASgRPkNJiANez1G8v1Jth0Akz6Ee8xOGm5K4NuLP9UOA7LhDabihDWjlyE1Ayal4acawhsim7o74LNn52WgogmFJDNXqkJ6lPB498S7ujfNGpTjzj2WJa8ghzcBHuMwLZsMOq01SPAwYFEGIMw+5lvnAKl7AlMV7iZ/nUdSmlkkulURSbqMxVDRRnvJaG0u7yaNrl/5q4CQQI+5J8JqQgkqBwGNhWzeLKE2QirzTYchPiHnI8zgF8X/YniUeEJ2gRA1S0FMN5ekoLiEq66/I5NB2gokqHAFFfbcTQrGBzwcm4UyyRpafJtoOg58pzzVYTzVDVcWKUjrmLW/6EfGb68ItT6Y+/VBCFoVFf2ym69S2zDGKS7x8HcqSwOJvatY7RXBKtxxvPdZGz0O6uisgRsPpkYa4yhbV1/+Edf8eI2wNugCUPjE=</Encrypted>]]>&FilterInitialize;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTnYu2hWUirTXB+S9/XpMEtmO686D6+dImoujmbTddZXKaNnnjOkmI69W2Hir2pOdy4xhBtKi9/+urFlg6J1uSuNZsO2p8Owi0Y5cN9yXN9+2JBpGFJis4C0jQXxcY8i8nT2/rWwyNRW27Es87a/fjqgJ41bWCHef3ZWMxLHe2E9+P0aXVr3+qrN/4Ff3oXSE0Z0X9AYopHmvoBBB+a9DCr9U2ODf5Q8Qol4IAt5MMCHh7kpKRiPvI546G87kfqCYg4IglC4jdvIkfRjvicmcpNp5t3QQlF4ZvghM3Qz4VzJoG+SV2oGha+Q1onQhBHIVQWQLGNJXm0O6pUDzl/UaHPiX96QcEtpVhw3oBXuOA52Q==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2INirxwpxdnzmT5iBpOLssCzwv/48VZ+S6Hwya1tIj3eWfJZ5kcTZS6tU2mPqCQQrAfNUKgQog4ls27XDFO8iO0cXYmiR+kqLSQb6N11bzObO1TKDKl8riPYP2Ji9pPod0qRtq7r1jXqoXKZff1obcV1HoxkxiF5Y7U3+oTY9NWHtK3MLXTTVspACZ+h269w//txoOImFqsTMMNYmC69hBGIu5t0yRxfLKBshqVOUFdWhsxb6Sfcn7ir2ND1gz8HSyyIO9bh5SIc+UJ494kSs3N1C4f9Mh+y6XdsLmOFM8sgZD/KMM8iqqUHcupgvXva5cxG2qgnQCiSz9VvofJSOEt</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>