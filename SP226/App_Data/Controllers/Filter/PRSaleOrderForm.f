<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY Identity "PRSaleOrder">
]>

<dir table="mrctyc" code="ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Kế hoạch đặt hàng" e="Select Planned Order"></title>
  <fields>
    <field name="ma_bp"  external="true"  defaultValue="''" >
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" external="true"  defaultValue="''" readOnly ="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" isPrimaryKey="true" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="xac_nhan" isPrimaryKey="true" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="sap_xep"  external="true"  defaultValue="0" hidden ="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_dat1" external="true" defaultValue="null" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_dat2" external="true" defaultValue="null" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_nhan1" external="true" defaultValue="null" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_nhan2" external="true" defaultValue="null" hidden ="true">
      <header v="" e=""></header>
    </field>

    <field name="d2" external="true" clientDefault="0" defaultValue="0" rows="220" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chọn đơn hàng" e="Select Order"></label >
      <items style="Grid" controller="PRSaleOrderGrid" row="1">

        <item value="ForeignKey">
          <text v="String: ma_vt, ma_vt" e="String: ma_vt, ma_vt"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: xac_nhan, xac_nhan" e="String: xac_nhan, xac_nhan"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: sap_xep, sap_xep" e="String: sap_xep, sap_xep"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ngay_dat1, ngay_dat1" e="String: ngay_dat1, ngay_dat1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ngay_dat2, ngay_dat2" e="String: ngay_dat2, ngay_dat2"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ngay_nhan1, ngay_nhan1" e="String: ngay_nhan1, ngay_nhan1"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: ngay_nhan2, ngay_nhan2" e="String: ngay_nhan2, ngay_nhan2"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280" anchor="3">
      <item value="100, 100, 553, 0, 0, 0, 0"/>
      <item value ="111111: [ma_bp].Label, [ma_bp], [ten_bp], [ma_vt], [xac_nhan], [sap_xep]"/>
      <item value ="---1111:[ngay_dat1], [ngay_dat2], [ngay_nhan1], [ngay_nhan2]"/>
      <item value="1: [d2]"/>
      <categories>
        <category index="1" columns="769, 0" anchor="1">
          <header v="Đơn hàng" e="Information"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9I70IurW7DWC4qASO7AKzJuY7hwPMG78LGQ8lCwjnGfa+mMtQtAANJ0fYvogE0lEEA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87nv6wqFaRPlw2WP9J9HI7lCavXAvIAIVmIt44diszlQ4g==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1GoFs7JdDxRW//7AXbMHmJb2+7yFO/Wya+riMSbuV7LpLHbGEKAMg6q7UozjevTfjow7Hkg2xVj8De0wM63W6KGcKl2weV8ysVKmBVtvj0QraRR+cOsSRIXoFZ82O8LCP2tsA5ocKXtB5J1OSKvpjWeXkrATKCgXLMivyUp2u06rUXw5iRGFLPbxhmEAnhKVOdHUY2xjcE52pbNPON5mgYjUBiP0aEzrP4w9/UmyJ+irYckzaFsGdTzP7Jva2VWRiI=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojq1VQixSp/fILV/FOyF/Lg+2bjNmRdSt3GymUmAWTUrntgc2jhfgW5kXN8qgvO6Qu</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ks+cMykz6XumP0keQrCD4hqaN6hlVQP6WtIuLML2Y58NBA2XwwbSyr0+GHbJwCq3GPaS6xDk8l/A57+QWZJCVc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+xN/0QbKXX1S9ARGHpfqsfi39lTm4sA3C/u5lyadRvtmwzxn4IS8ofsfIzPUUGd6ohRbC5fonVSH3RHZ1CQ5BRkbM7G/2iiOslGYM7CKtA0df+U7enzl3h1n2o/OfX2CojFDVnqQpkhJf5DM7sL7NCJigidDRXzhnWPtWo7iHSSac6YQ8pQeJx76r5vBYHwmLe0QV2tz/0E/CoB74F9+JLcIaEEJbqtfeskOgjVey8M+VLkUF6I7mYnzuUVtRfaqg225ySlDFNdYULSDSQDkqci88UoaXNja0U2P54FG4xcus12dvPSyFlNYlfU+MbpKjOm846GXSvhqPRX+hsobM57t3oGv/IlBjQ3OebqMNJAgAyooiGpyCQF6mLTNlxcJqdPryNZ2JTuIcb1lsdt+k6axcR5Cpm0WjpaWbl63aA16GG6vtBeh6hUIYkYvefGAD81oJ7O4KJk4nENg7Xw0+OKLQutwbOHuGLc+CO81vD0AgBPflB4WN3pM89zTDMhL4KeIbq9wSrAX1Cj3z0JGWNVDyKNRDvFdsOvTAU/ZSxMo=</encrypted>]]>
    </text>
  </script>
</dir>