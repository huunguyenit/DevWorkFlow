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

  <!ENTITY Controller "'QuerySOApprovalRolesDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVdk52nLwqO0WnpGQJtCVmutEEWcEXSTMiuLXJb5wQs5xq0Rast7ltWY55563wzfU2cajITMTqfEMmG3JRs17VVd//35kLjM9gQmduXttuc5oO8aC/MzUEIA+fS9k6rOJbcix0qpNzDgqyS9H6JRAvn9yma/u1cd7BirkLeTmxbSbC9QkyNqIRxJHv3mV5EUlrg==FastBusiness.Encryption.End">
  
]>

<grid order="key_x" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo kiểu duyệt" e="Approval Category Detail"></title>
  <subTitle v="Chức năng: %c, kiểu duyệt: %m..." e="Function: %c, Approval Category: %m..."></subTitle>
  <fields>
    <field name="dvcs" width="100" allowFilter="true">
      <header v="Đơn vị" e="Đơn vị"></header>
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

    <field name="tk" width="100" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_tk%l" width="300" allowFilter="true">
      <header v="Tên tài khoản" e="Account Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_tu" type="Decimal" dataFormatString="@quantityViewFormat" width="120" allowFilter="true">
      <header v="Số lượng từ" e="Quantity from"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_den" type="Decimal" dataFormatString="@quantityViewFormat" width="120" allowFilter="true">
      <header v="Đến" e="To"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="tien_tu" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="true">
      <header v="Giá trị từ" e="Amount from"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_den" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="true">
      <header v="Đến" e="To"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="loai_ct" width="100" allowFilter="true">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_loai_ct%l" width="300" allowFilter="true">
      <header v="Tên loại chứng từ" e="Voucher Type Name"></header>
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
      <field name="nh_kh1"/>
      <field name="ten_nh1%l"/>
      <field name="nh_kh2"/>
      <field name="ten_nh2%l"/>
      <field name="nh_kh3"/>
      <field name="ten_nh3%l"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="sl_tu"/>
      <field name="sl_den"/>
      <field name="tien_tu"/>
      <field name="tien_den"/>
      <field name="ma_nt"/>
      <field name="loai_ct"/>
      <field name="ten_loai_ct%l"/>

      <field name="loai_duyet"/>
      <field name="ma_kieu"/>
      <field name="key_x"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4hLYsUY4Y2W9iVPyTyqFHrkp8VP39xHVHwEtrpJqVGhl2u8q+YwFWrW8ffcIWvW8hJGPfqShyShLlkLgBmtX/DV0+emsmn+y0/HdmVmrcfCYFVY4fuBOC6WyQ+//BDtOpoH/pktpcHhUSLKqTDDRqtVpNDsPBWACNbCRdA4V+uHWzXi8SeBjc/kZfY6Z0TT2mX80tDFoajqXtMkoA5yD/MylLea+zl7UpfuRy4IMWgkm8boPAPxVafNhZXIsU8749egNynqw0zHxcsBttaJnEzq/UMU0VVRZnFHqPuHA72gfdIXJ5P8IlLVUJ+QTEOFauwWVlWK02kFsulmewb+0BTEAVbwVUW1BphjrJDqQe5qtuuCdh99M0jYr+p31uCsgaq+cXTTlImbSxt9jOQymC6fYxUCbkCxtwK3sgYK2gryjAyOThU1szqvxDr4qX27jmv6C268Wma4xz/bMABO3UkMTpR2edNWeFQDszw8klnOwUvy35MDyoi9i2K5T+bAPiB/a6AWt9Jx63Z4yLUimYLhLNuMzD1TOwB4FF/SrbQh/mw+Hv6M+/lEUJp1QixzOJ/AGfRNUzF0xGCn2yBc0b52TLAW+apCymQ5WPBNdV1HUu2T7pdmjIF7GKOXhluRkqJbsabkf+lJo8unOhwF+LjvE7dcO4AML9Wci0697Rsv2xEmz1gyvWZn2UI2Noag8LTw/UyIG5ZqG04ESeCE8a4f11ev19H5jDwEPuDH0qL0j2oAVLxM9IWZN5xsk84MHw==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux4D+L6aPSkk7OGHNbKGnTabAuF35gqPuuD9ASgRPkNJiANez1G8v1Jth0Akz6Ee8xOGm5K4NuLP9UOA7LhDabihDWjlyE1Ayal4acawhsim7o74LNn52WgogmFJDNXqkJ6lPB498S7ujfNGpTjzj2WJa8ghzcBHuMwLZsMOq01SPAwYFEGIMw+5lvnAKl7AlMV7iZ/nUdSmlkkulURSbqOIJIy3Byw10ju2cshTYAsz9K8HLEev38yTyEi0UB2RHcNI/IRCWK29Da90V4hEnnS4EmbSnYWxYDrOlJ8Z3ismCXSRhSvjDLIJW0eFOzXIaavsv4z6lf0PDy/L5PUwLJuPDhm2JyeUiOQhO/8X7hKMB+PLXr8xH5JDis78t0NI8FPZbxfvcD99lYtkqklvwHOrEbZ1khZDiSPgLU6u7pUl5QKRjoojyx+DtBKnu1l7jp/SR+ZaHw+EAw6DDTVNMtie8WAhgj0G1k3Ucu+cHK07eocnH0qEGxOkmlCQ17rBtw==</Encrypted>]]>&FilterInitialize;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Rxt/BsBsvX4M6O3ueiaQf2nYRkqc4t7zsjuRhgfmnLhlr3VRqrIVZRZmiDLve3nYrQ05sxSbKKMvH+e7CFiXJeFCVOTexDPxzyacGt3HuAFiNlKOkkx8smlc3J4XPy2FUANhh+AqNIaoNJs9z8+Q25dZ1ILPJThkui3zMvVlgFd5N85+WZe8BJrRh723LSoUlJuhYm7CNVHw+k2Em0sSWnj1Co+0i3YEZRFMd/8WmtBtPbYBCJg1T1w/BtWHdQhFKUYZushDXs93L6wX7rJg+sJcRciSny039j62bfTSlI4bN40NO1VGx49sC0nuv5PLMnyP+i9+b7p7v5OijvjvprY5Gdr9lNdj0afKOx34ZH/VIXh94c/uFGNoRNE2EzpJiu6yA5u7+v2XSUaf5mOtqs=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2INirxwpxdnzmT5iBpOLssCzwv/48VZ+S6Hwya1tIj3eWfJZ5kcTZS6tU2mPqCQQrAfNUKgQog4ls27XDFO8iO0cXYmiR+kqLSQb6N11bzObO1TKDKl8riPYP2Ji9pPod0qRtq7r1jXqoXKZff1obcVzeQDUvphg8DZ2Vck81yDOgLXk/oWUm8Q02J/0EGismDNUVE+FDT+FNMuyG3tykCoF8S9SkVuVC7J84GDrN4lMzmscAnnTgoSIOH6GaT1qdHrcyunOUrYypXCjFnLxIyZ1ErE/FGAFtTUK+RoP32DKB6hnZG8f6fju+B3EqTfomE/noiKSGEuI6TVt2O6ZaIsbYajyHhRKMlG1SuVt7ro/g==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>