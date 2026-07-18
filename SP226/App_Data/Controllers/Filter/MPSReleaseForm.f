<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "MPSReleaseForm">
]>

<dir table="mpctyc" code="ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đơn hàng" e="Select Planned Order"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" readOnly ="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site Code"></header>
    </field>
    <field name="ten_kho" readOnly ="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct1" external="true" hidden ="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" external="true" hidden ="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>
    <field name="xac_nhan" external="true" hidden ="true">
      <header v="" e=""></header>
    </field>

    <field name="d2" external="true" clientDefault="0" defaultValue="0" rows="196" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chọn đơn hàng" e="Select Order"></label >
      <items style="Grid" controller="MPSReleaseGrid" row="1">
        <item value="ForeignKey">
          <text v="String: ma_vt, ma_vt" e="String: ma_vt, ma_vt"></text>
        </item>
        <item value="ForeignKey">
          <text v="DateTime: ngay_ct1, ngay_ct1" e="DateTime: ngay_ct1, ngay_ct1"></text>
        </item>
        <item value="ForeignKey">
          <text v="DateTime: ngay_ct2, ngay_ct2" e="DateTime: ngay_ct2, ngay_ct2"></text>
        </item>
        <item value="ForeignKey">
          <text v="String: xac_nhan, xac_nhan" e="String: xac_nhan, xac_nhan"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256" anchor="3">
      <item value="100, 100, 553"/>
      <item value ="111: [ma_kho].Label, [ma_kho], [ten_kho]"/>
      <item value ="111: [ma_vt].Label, [ma_vt], [ten_vt]"/>
      <item value="---111: [xac_nhan], [ngay_ct1], [ngay_ct2]"/>
      <item value="1: [d2]"/>
      <categories>
        <category index="1" columns="769, 0" anchor="1">
          <header v="Đơn hàng" e="Information"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2xlK8qHzvkvVP8ToujfaeunrDzIlMODk0ff78ePL1Gr</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Kan+1XD0VV3ujfIAC7OIcyrAh5DtluQZLNPvFKIaGLz16HQbMYJCS5OYFQ8zgRL6A==</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Kan+1XD0VV3ujfIAC7OIcyrAh5DtluQZLNPvFKIaGLz16HQbMYJCS5OYFQ8zgRL6A==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Kan+1XD0VV3ujfIAC7OIcyrAh5DtluQZLNPvFKIaGLz16HQbMYJCS5OYFQ8zgRL6A==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OjTND5+TmkDFRGs8SJq1BRs5Gfx/uOBWAuxhlZbExIjmhRM/e6sNht6rH0UiAGW7ddU49xRXFCkRpw1njppxq8xDFXFmNh9aFEcjCtdm3oe8iI5LLCjBfWhgj9Ceo+YR3JNcvDds0cLNWlWvIMTfAU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVgOOtWjuC0IWKiVHhWj+dej7kn1hEEKawLGjQkyxA1ja</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EYTt6Q6eG1P08EdtWyDePFmWyJmDHaTFU6Z/E73IXk1gWeMtJT0g+bxMzF0ZucshU1sEEip/ZTkfMnEjPxjNEdyVhnbvq0x63gq0w6CsB1gi27DIKzllTWklHjmZamBJnazLpr/UdRMlpxYyBcJ481aM44BCLnP5RwiT8i/hTlgMPSLeludkQL3xRrQOi2CdeCI+9Ej0/jpabtjr2slGSs=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1GoFs7JdDxRW//7AXbMHmJbJp3bTG2ybHwQuwmEOtGKAp19AVenu8T/V3QByHoDeBapkmpxxNyX1goI7FfemOIz/vApvmYzfkp0REEGKkWiMlnckZZWBFCtkPieUl4Zinu5JP4mpTtHfMAxO4ye+asE2KoIqVcjd2zULl+4pGTOw1N6hXCgbtipECqmEhKg4kHSpa1Y5UBOYMMPcza5g23O</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9PbOKjnbYFIu/AgLzKQGNB2POG2AzFm1FuZP7GLpTqxcO+HhEkbMzcMxSwuKdXLw0AaxgDNEkvvQNF7RwOxQ2EzQTC95X5A2l3cCOLqvxYhGH6KMcXT1Gk7t/7U+5nzd0XmVkiD/EV+CloXYWm4cQIQ/CJ9av+Tp3aJpotfHgVSXMxVezaIHgg7Zxda9Ejqp5y9PIH+YkzGoOOTCSGtO1XqWU70jbE1KqlURddTQ3/35AQovqSzNMbJNSmJzTCO6f9RRN1GHBPXAvFguXoSpnOGEiT5/JAI+tDzSNDdzuAjmWll1FYGic/+pDv5A1VifTYN4mPO0kZCEalccovPolPg8Jy1fxtXnWfme9ebDkvoDNgbiF5BIN3ObfvPzyZsgKXiwLYNcK0tmc6ric+0eXs+G24twG5AJMtSYFKVQe9iLuyMb+qNp2iSH15WRw/57akT0Q5eBNcIArNR8+KwDIGye5SJdkuDHtcw+PdGK+iqdd6kLDJG0+2fQ4tw7MV4YqaR6eIjwfMoD2y0ZoCRDjhZ3HTeyFXvzz2gamo0dEG1Yy6tnRToBz/UY0ANgtigyQ6XpFB/RErLjprhX6bCyYGOCRfyJUxdUk4xdyPU285nUwdwUkxKGl1diy+Engf59OHZhNFN9g58gtCqTt9veacH078vLbfuIaUytX8oxNuHI</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Confirm">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6SwKVD6j16jvWaP6j2w8ItpPlPK2e8ZkBkxVEnk5vejw1FDr8+CtbpnPl6+XVemVIbAUKXxlMt1olqdZu5hpOjJy9mjETe04/A9VfbldNWfSVhiXrpDrXqcSRDdYTCth2r1/11LycUTj98Yeri7xUEISUCuao+NOUBdP8vLqUZ7zMEAVNs6cIGmm76tPnYuQc1kSfBnhnkpkaI0IaDYoM18+dV/yXvnZ6g4Z3MuB1LteWSKtrF2xFmzmXTVA5IrkxCgLSnqyK9423O7Y7VM4QvN1oDy0BbffiA7aRJy5B3k/YyiwM9hlVMTsK6uZRCCZWNR7LfmQ5hWnRtGaWWjUBCCiE8Y75DlJsKiwl6uCr/PxD2EnGbOI2+qlIO7zNRuWNaqlyHzmS8eIi3X8BGAQlAiNZNsFsLMVA05N6Vyk6BtQ5PjzIvAvK/bVpkSjZsmZAdOdhiJg5jPfFHWEvRjq1ixacx9UyAbKb9jeUFIuO/r5rhyR5r3im5YFDLBzXCeHvpnTt/u/0DIM9bYJUdd44WuyfFrkvAU1LyZsrqJhqcG7</encrypted>]]>
      </text>
    </action>
  </response>

</dir>