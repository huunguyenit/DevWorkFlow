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

  <!ENTITY Controller "'QueryApprovalRolesDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVfOasnsagMGNo0r3Bntaz/oJ7zH+ktC/MhbuAdMy1ILtV7SwofSITVhx8bZqLys9C1cKWj9hfBFavP4sno82IR4SOTvCMI5UL+2sLtipkcHrav9JYxpdnXrHV55stO5PsCLWqoicMvO/JPBNXuXmgmO4jE2thYkFZ7HgBVVsKWsB4x46SMemmw43xPzOzLTTuw==FastBusiness.Encryption.End">
  
]>

<grid order="key_x" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo kiểu duyệt" e="Approval Category Detail"></title>
  <subTitle v="Chức năng: %c, kiểu duyệt: %m..." e="Function: %c, Approval Category: %m..."></subTitle>
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
    <field name="ma_hrbp" width="100" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_hrbp%l" width="300" allowFilter="true">
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

    <field name="sl_tu" type="Decimal" dataFormatString="@quantityViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng từ" e="Quantity from"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_den" type="Decimal" dataFormatString="@quantityViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Đến" e="To"></header>
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
      <field name="ma_hrbp"/>
      <field name="ten_hrbp%l"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4hLYsUY4Y2W9iVPyTyqFHrkp8VP39xHVHwEtrpJqVGhl2u8q+YwFWrW8ffcIWvW8hJGPfqShyShLlkLgBmtX/Azfy5E/FDPVBdV43XXySti0cEP9yeWVT5ly8CvOObe6QgcQoEB/tXK3Q6uDVV6wjGRZeK3FhUiBe4O8dNfq76z7ebo7hnP96Q9vnLYaGPzkCnNh7jKniFnji2KIfpzIV1mzEULnLG+l9IIYjUEeRFmlBUzZfBJVimjSX4iOmbHPHDda8pGg090FMR8eKV8jv1J2HJpehuQJ2/l1QXIXGa+TS2dtKG7FRJ6AU9/m/zkPfjeeDXySbz2iHXcGFYVoETiA800N59yXDF8P3yVGQSHRRHzJUsNEZaL/Q+Mk7neijjmdGNEtKtkTS0gKBs+1mbEh0dLxpXuJj3pc4ypENYDU7SX6om5rYtV7Z88buJ/Q410BhgaBYH65gQJT9xA+NZgVTQbqzkbbNUfbtOb5foVuZCiD69ywSj/Y1s1Z37kEMkc3poEEAs5gyViPfcqgdFMSCj+dmUyPOE0ePj3m7MOt3Tqm1nJujwPxD9q7QIJN3LMZWoevN89D/WiZmqnw0pfxMQtLpDVpUIHGXxSfidTK0rSKlUovmwOOkbj7vqBmEIoIgL6N8Pj75h7oIBs3dAOZZ6yya8mdHV+DgDOC1G82PfYyqaxlM1gLh5Oc8hrThZNC3McErBifK8h1N1mwbUiUF+e1RPAz+/IT8pOfuMN77FplKY2QcMH6uReulNheW7MGSMcIw7YzxruS7/6dQg=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMux4D+L6aPSkk7OGHNbKGnTabAuF35gqPuuD9ASgRPkNJiANez1G8v1Jth0Akz6Ee8xOGm5K4NuLP9UOA7LhDabihDWjlyE1Ayal4acawhsim7o74LNn52WgogmFJDNXqkJ6lPB498S7ujfNGpTjzj2WJa8ghzcBHuMwLZsMOq01SPAwYFEGIMw+5lvnAKl7AlMV7iZ/nUdSmlkkulURSbqM3/rBipX3sYq5izZjdwGcYrxL+d8v5tiiHh702xn2O6gHo1/PUJ9hRtQh6hryrcxMmjnlmRkrNvoziISoygHlEeH0RP/bP2n/HsR0+39BOcFf3BVHh6k6anNPNELs8NxffEJOijZ0fmbfprwmMDwTfE4u7CypXokwGeJWZRj59m08StqM1iBlGTQ2BVtISxRkYZj7IfavqxYbCUiKC8+/V1HfemnL94jZgoR5rZrvV40v6uBGeqcJeQ63eqtY7/N4GnX6u4hVG3byVvtHTul+bEaF39v9tvKdbUZ6jGA3g+ABaEng0XHG3FeddY/inC7I=</Encrypted>]]>&FilterInitialize;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Rxt/BsBsvX4M6O3ueiaQf2nYRkqc4t7zsjuRhgfmnLhBUgeDp9o6F/+ZDb7XbGBFnGAUtcg/Cms6mMKL3Teu92c5biRpAqFgStyBxmluFIqPDM8kNnkok3YNJuRF2nITFu83fMrD3BO4kuY6XbA81Clamvv0e+1ET4gC04m/AZ7YCZgLFnxbyJcntmMmkxv2uFewk6iXwxAdSmHM1SEpJtdO3jnZaXooieugDIHPnGuXrmfua8rquazO41E0NKR6iWQdVGZnrQpZJKQ666hUKIsY9Z4ubzhdONwrqewpas8BnyzB3pj6MZbNsdbMEMha23ULaHwlJ2+ZLfnfoQ6ddLiXZM6xpPfFSZMi/rmosO4tJIgyCqMj7SpkhR4/OshDCgJlWLeHQxOpsOxsfzfixY=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2INirxwpxdnzmT5iBpOLssCzwv/48VZ+S6Hwya1tIj3eWfJZ5kcTZS6tU2mPqCQQrAfNUKgQog4ls27XDFO8iO0cXYmiR+kqLSQb6N11bzObO1TKDKl8riPYP2Ji9pPod0qRtq7r1jXqoXKZff1obcVzeQDUvphg8DZ2Vck81yDOk2D1qFq/GGilBLrke3HJHEiafwookoGPWECQobRJ+3yTgAqv0sD2j0niGmBZVg5HeZcpr7fNZo8UyuxLqsXJMPnNHZUBt8wSlrdXfQIMZI1kIp2LxQx3hT1zjWa2iPYVUjCBtxZub1Ijv379Yb2ZOOF3KAP/uOkA6AlGg2BHHOTcyaM4wb7duMZbx4CBoK2Q3XBeUxday9DE6XyrgMitEY=</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>