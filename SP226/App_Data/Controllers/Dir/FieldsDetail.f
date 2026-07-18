<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "FieldsDetail">
  <!ENTITY NumberFormat "otherNumericInputFormat">
  <!ENTITY AmountFormat "otherCurrencyAmountInputFormat">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir table="freecolumns" code="id, controller" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin" e="Information"></title>
  <fields>
    <field name="id" isPrimaryKey="true">
      <header v="Thông tin trường" e="Field Information"></header>
    </field>
    <field name="controller" isPrimaryKey="true" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="style" allowNulls="false">
      <header v="Kiểu dữ liệu" e="Data Type"></header>
      <items style="AutoComplete" controller="Style" reference="style_name%l" key="status = 1 and (type = '{$%c[type]}' or ('S' = '{$%c[type]}' and type = 'M')) and (('{$%c[filter_type]}' &lt;&gt; '4' and field &lt;&gt; '') or ('{$%c[filter_type]}' = '4' and field_dir &lt;&gt; ''))" check="(type = '{$%c[type]}' or ('S' = '{$%c[type]}' and type = 'M')) and (('{$%c[filter_type]}' &lt;&gt; '4' and field &lt;&gt; '') or ('{$%c[filter_type]}' = '4' and field_dir &lt;&gt; ''))" information="id$sysfreefields.header%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB7guHBWCThjgDwpZNEXD+m1I6KrzkojcvULD7Yfz1ga7</Encrypted>]]></clientScript>
    </field>
    <field name="style_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="header" allowNulls="false">
      <header v="Tên hiển thị" e="Field Name"></header>
    </field>
    <field name="header2" allowNulls="false">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="width" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Độ rộng" e="Width"></header>
      <items style="Numeric"/>
    </field>

    <field name="format">
      <header v="Định dạng" e="Format"></header>
      <items style="DropDownList">
        <item value="&NumberFormat;">
          <text v="Định dạng trường số" e="Input Mask for Number Field"/>
        </item>
        <item value="&AmountFormat;">
          <text v="Định dạng trường giá trị" e="Input Mask for Value Field"/>
        </item>
        <item value="baseCurrencyAmountInputFormat">
          <text v="Định dạng trường tiền" e="Input Mask for Amount Field"/>
        </item>
        <item value="foreignCurrencyAmountInputFormat">
          <text v="Định dạng trường tiền ngoại tệ" e="Input Mask for FC Amount Field"/>
        </item>
        <item value="baseCurrencyPriceInputFormat">
          <text v="Định dạng trường giá" e="Input Mask for Price Field"/>
        </item>
        <item value="foreignCurrencyPriceInputFormat">
          <text v="Định dạng trường giá ngoại tệ" e="Input Mask for FC Price Field"/>
        </item>
        <item value="quantityInputFormat">
          <text v="Định dạng trường số lượng" e="Input Mask of Quantity Field"/>
        </item>
        <item value="exchangeRateInputFormat">
          <text v="Định dạng trường tỷ giá" e="Input Mask for FC Rate Field"/>
        </item>
        <item value="coefficientInputFormat">
          <text v="Định dạng trường tỷ lệ" e="Input Mask for Ratio Field"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdu3El1iPEMV5g0WH8OzTsA+KcH3JV+36MRXHeCIUarNz</Encrypted>]]></clientScript>
    </field>

    <field name="nor_format" external="true" defaultValue="''" allowContain="true" dataFormatString="@upperCaseFormat">
      <header v="Định dạng" e="Format"></header>
      <items style="Mask"/>
    </field>

    <field name="round" type="Decimal" dataFormatString="0" clientDefault="0">
      <header v="Số lẻ" e="Scale"></header>
      <items style="Numeric"/>
    </field>

    <field name="tt_sx" external="true" defaultValue="''" inactivate="true">
      <header v="Thứ tự sắp xếp" e="Order"></header>
    </field>

    <field name="order_type">
      <header v="Loại sắp xếp" e="Range Type"></header>
      <items style="DropDownList">
        <item value="%a">
          <text v="Đặt sau" e="After"/>
        </item>
        <item value="%b">
          <text v="Đặt trước" e="Before"/>
        </item>
        <item value="%l0">
          <text v="Đặt cuối" e="Last"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHSpQPkBB0ZyJg8mOfu1qEFsBsyVJmigeukkzkYS2GoRS</Encrypted>]]></clientScript>
    </field>

    <field name="order_id">
      <header v="Theo trường" e="By Field"></header>
      <items style="AutoComplete" controller="ListColumns" reference="order_field_name%l" key="status = '1' and controller = '{$%c[controller]}'&Operation.And;&FieldsFilter;" check="controller = '{$%c[controller]}'&Operation.And;&FieldsFilter;" information="id$freelistcolumns.header%l"/>
    </field>
    <field name="order_field_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="allownulls_yn" type="Boolean" defaultValue="0">
      <header v="Bắt buộc nhập" e="Required Field"></header>
    </field>

    <field name="client_default" dataFormatString="@upperCaseFormat">
      <header v="Giá trị ngầm định" e="Default Value"></header>
      <items style="Mask"/>
    </field>

    <field name="post_yn" type="Boolean">
      <header v="Nhóm khi lưu sổ cái" e="Group when Posting"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>

    <field name="merge_yn" type="Boolean" defaultValue="0">
      <header v="Gộp với dòng trên" e="Merge with above Line"></header>
    </field>

    <field name="status" type="Boolean">
      <header v="Sử dụng" e="Use"></header>
    </field>

    <field name="type" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="format_type_name%l" external="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="order_type_name%l" external="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="filter_type" readOnly="true" hidden="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="i" type="Int32" filterSource="Vacant" external="true" defaultValue="0" >
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="20, 100, 20, 10, 70, 20, 190, 120, 0, 0"/>
      <item value="10100--1: [id].Label, [id], [controller]"/>

      <item value="10000000: [post_yn].Description"/>
      <item value="101001001: [style].Label, [style], [style_name%l], [filter_type]"/>
      <item value="10100000: [header].Label, [header]"/>
      <item value="10100000: [header2].Label, [header2]"/>
      <item value="10100: [width].Label, [width]"/>
      <item value="1010000: [format].Label, [format]"/>
      <item value="10100: [nor_format].Label, [nor_format]"/>
      <item value="10100: [round].Label, [round]"/>
      <item value="10------11: [tt_sx].Label, [order_type_name%l], [format_type_name%l]"/>
      <item value="-110000: [order_type].Label, [order_type]"/>
      <item value="-1100100: [order_id].Label, [order_id], [order_field_name%l]"/>
      <item value="1010--1: [allownulls_yn].Label, [allownulls_yn], [type]"/>
      <item value="10100: [client_default].Label, [client_default]"/>

      <item value="10000000: [post_yn].Description"/>
      <item value="1010: [post_yn].Label, [post_yn]"/>
      <item value="1010: [merge_yn].Label, [merge_yn]"/>
      <item value="1010: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4MD/9FWWq3JyC+/AN8nm3asEBtlJIBYswVlD+/RvB7fJJIJkKO4pc2d+QDSKJCvs6IdzOUMyt62PChpSefUskruC5f2s5LVFEqCfWhXnvf394vDTD4+F1i+Tvb11EM0Iw5kSyL0p/ExhiYziWmp2ftvaRr0AvFZYb79Q78jcSYA+11CpRAPKn93AMOnvvy172zBqs23/7u1Y8aidccI7Ime1SciMsQloTMY306Gbqhc/I0Td0jZoopeff6eppkDfFisNgV56pCUUjUH+41Sjfs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdiURvHyMig5LA7vUtktXkVcJ1fIZlSFqwJsA+QaNqlhArmjreTC2IAOxb11kjugoREHxhHjvAwqRvzm8djDe8lViWs6aX30KbstpPNqgihmG</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB0lK8vZk1HYaB1M+X6XoRiRNs9oTPC171XhXy32yqWf3gwCpAfVuEzgYBQPPje5ajQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4MD/9FWWq3JyC+/AN8nm3bGjo2HzmJrj06fIfJU6zgRRwIYGejOAbx70/pkJ3nL6umyxAhaAW3KJJ5HfLgNdKCQspdQzt2FWochOYEELMd28IhyOV4+5zyGf4p9lw76AV/GiT9P4mAVcM8yhcQ4sCnUCPZbqRG6RYP0Bx9eodB9F1xR2i0AkkDB7HZp7M4ynX5Nd/OQ+mKcgT/UVfT+rrx/WdtX3xEcZrRsP8M4u7woxasdg9tqlvQHECApNSX2CVw4aBRutH2BYSn/E4NE+pFAAuuHyDT0N6LZbKg82Kb+HXEJK0Iq12zdxow9pxaKHW7ATgWh+8aRs9UBoShKP/VaE4KyreSHxoAIZlCeDf8mSqPw192htPuDdPj0SFoIfg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4MD/9FWWq3JyC+/AN8nm3a2i1stvWmJOjSBSVGhpFHvG1ZmJRJGuO7MUfLuc5fz/EoUMbSwJ1o8FZiTLyy3l7rPeUyH7A+4dmEhffVa8bXoL1ZA/0Jn0ufLV7i9/zRbUptYt7V6dfRLwg5t0Rd07Ulc3i7BsbTw8Gd87sg5BXuzFyCE/JrzDiENds6JtdZOrQufN/znPXgNlBgCFxaIKPj4KQ+XCySlK7QwIBDPdfEFzH1g05QnC3PvLT/CTEox2EG3xoSu0mHRszU5myuVg3Gil3oO1Dq3BebCdhgh5coMcH6hHHzpS9dQIGzfzt1Xc3298DdF4PEoqdi2yMX/9SEtLWcAeh+HTgzfL5i0FjC26MHDnjtsfwdCMrohaonEt4hnYEnwsYm2FmCXQj9iWdKakVdclLk0F9dhSI2aeVihIP1mjL3KSUJOyx987c05nQA+q/J9/Nj6xe7cJgGzsOyKooSUPuZHFx9f54cdtjrfnr68da3hJuUJ7Z5qgKbKwPwlW/GpO4QuPmrE6Bz+QP+Wq76Cp/H7HKFclngLpQKl9fXgJk0lYT3yhu5cQpewuw+INxbrB4SEeb4HpMm3lO9fHIS9a2TL7uJyT79EhEVTl15Aekgk/OSgAgzavYNBCLDk9kgEoF8ftxbiDWE61GxrMoymFlE5IeYyelvvbAFxPx12fWykx0upav40/+VHV2mEJge4x/v9/h35ihWydPPta1vrDG8L76suJZPbAC4hcAnQoEBYJIH2MWs1ZX7QKH653HPUGknN+8Zcz0/nF5Nu5riqi84IVNI0W8vrD0kX5a2IcCXyH83Dr+Epv8G3im+PmuivDEEYqZP4TB5a2z+kA2H3jY3V5QYP6Ee/gLrmFmaBqlfVSh03YBHVcwQeM8evpo7t1YepV/WRiY2gFqCkAoeTS1gYyQbhWqoctni6EqV7KW3KbyzdSFArVih7tSdiym39JOIXRp2ZG0wCa5gvE6oUEJWk7rtqIDarCgBY</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EQyXfTrtb9mrZM+hcRUZ5fap/Fd+t8HkBiyaDzj71LiaIe3BrkMtrHywL4atRr6QWXeJ0erMTCRZOV/hKf8ZZ1tA+9+DSgB1vGnGY1Sgwx/5jLDeKfaZBssxSVQrYKIMuJ35u0DK7rg4bQOnKyAtYHk=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdpIhG8r40/kszc1bMOjG8sdYiXcGVZlVBlW0YhD8X6RDfBBkytvUWQqJtl3u3qxYPeolvcJADjrmO2WT+GLt6F2PHmQ/S76vNDG7ah0c3cFjfs1NhFdbC4itDjCs9pcQEBGFT5jx/ZegqD9hw++eaOEDYFGNhT8Cjn8b/nMqViBsGt5j8htvqnjYr+cvlfXZhv52hPv/YGgV16u9OFyGfGyQBJ232N/4hAxtBYzHNiAr9WOP+sg6L4nwolXsb0sz1vO1+e9YtJ/vgBdT4NNGBflp9xXRqKEv3PNEaRf2YZWh7mjTqDnNrz5a6mM8cnOl2YbQZFNlh8VJNki93vrqufndE3mbZ0mFX8+5PxHZ6+xGavqM9ORtDt0Q9l3IL3qaMqDQ6EWSZr+z2Azo+dWs1XR3uoxIcwDQ1uCLdV+o2zvutnj1WKbHgum/LoRYk8Ohix1V13UzYcprYOk7eR5nGKc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdo6pP8/77qeAPAs1f4s3l8IZ4v8KhaIsatxfvBpxMRcPSm5dA1biad8l4VYq9a392jW5dQuvvVpyCBwnNudAJP1guSuHixOaIC2wfhvdqb3wxVBwaZJ8lR0yOh0LAY7KeyY/N+7k6bG5KTI6CoboK+nJ5HHfiSvuUKKJ1UPrHrWQ8+Kh7xME6+9Q70KUsCPRPA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqB7yuuOBC8zImr77achQbzbq4156pj9/T0RLKjd3ZvKGTPBuWn7BiBxs3Y9kLkXhPf6IOmG19qwcnTRxB7Y3NeajTEeJuoro8ieu3qDp8fnXAUjNAuTIeNMrAFq+dhAB+Oci/Evb18OUIoKiQKdfawYDkJ3C3Bg5W921xSruu+2Wjtnzed+p/YQjEpOSWt3szFtldCj/RijP0kKs6n7WS3/Y=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB2OWrcFrORcdCtWv4US1gQtXkOmOVNkWEuKMdt8YVJ6X</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqB367NM73JJyivQ80F9Uk2KNTCT7rJD0Wautnd69Xpt03oBeWLKXBrkM3qss4jZAdnXR4KK42IRQhuQYSVuVj7X0=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB3+BYL8MBDPTPEKONAdA8cZthsNRe4juvgeypbaWFMHA</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqB3GzODFPNFljoYiXOwW0BXRJQT/Uy1ThHAUf/49dH6uFsmgyFu7EtniTFSSdjKCu+D3qeX8FZDA7L0FX0V/BXBM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdru5VbhgJlvFGk2umCdfcwbX+7cPqQxgWDf4bUp101DZAecVjmKJ0+AQOEC8ZGCdbA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqBwX/04kNg5D4QOGfN5uzE1yqwMUylAYO87FS/8QlHlpfK2fT9qrCyCdSGFcQFpO4hlBYoU91ieGFIegaEfiXYcahzf9uE4J58Hru2DlOGgd8+E9ofB3EkFtDZVqJNRDS+jkhXj6PZUvnYNFQTvE9TaUWeGpNtVtCiTZ9RKfnn6UQ</Encrypted>]]>&NumberFormat;<![CDATA[<Encrypted>&ysTa0Nr7HUdNcdzMbnNw22UtNBx6ymByjdXWhDTP+j0Um6+omEWIxhWYRpLuEvs3</Encrypted>]]>&AmountFormat;<![CDATA[<Encrypted>&ysTa0Nr7HUdNcdzMbnNw26dcjvRK+k8/vau/RpPHS6+yaTRmH2RZJX3lprQrHspiI4u92RqAkP24QTenAOAfNe/kXBCBcquvjYMhy/UyTXJuw8jCiwITQQRudDRHx+Fb</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHcdCto3pHElBwObNfi2g8vWL1sn+BnJ/WjuXm9MsMV5xX0o+u5rO1lkjqnRojLdd9L2/oyvcFd9gnEwD43efTQo=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqB7yuuOBC8zImr77achQbzbpgsmvTefIkFdzuPNG5wnDAe7n136NXP92dGXwDlaYxKsUOpFz+EYCeHIw3hMbt1kZXD4h3OO0uon2vxgaChkEjNQIKRPZ898DMF9dHgDlWZPBVmEvIVakFkAmuQI2tA0DDZQtkEWJli1R4M1Sau0j6iXm/yqbtzBT/1a2hVzh6Aa6762HsOmzoT7BFKvsLd2WUI5ObibNpugyFAmLtkrue</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&uIBOCjtPeDf0M/ArCvxqByFIGfL43E7rng452x/RyhTz+hBwUlnDztfd2MTchKgc+zLknSUXmcsjtPMm58J5e873tPofiW+MW0fuBE1UluTUxt45O59tFDOfIGZN72s6jMZI4Y87bvj/TKxIoOO6CSaHqAbOoBJjXqLP7yRCi4CopRswfETcf2D4qTwLDSFOAwViwssndIx48sLnbwOLHZdGcITu22SXSbLRuvStlzfb12azuvXLpE5gS5UedWvAz1sCXYintGKzfZQURJbFOwdnRGzpTAFCMYu/V4C5KeeT4u3ky3bvzLN49yAzPFwLsU1Flx1MB8SQVyShwgcMww==</Encrypted>]]>&NumberFormat;<![CDATA[<Encrypted>&ctgY3oyu1j0+8F19hICO6gaCoc39foZjRnghfRiwEm2tnQ6hTGSuTe0Osj9NudbD</Encrypted>]]>&AmountFormat;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egd+Cf2ahiPwxjbGHSuUU/odad/D0fT4KMcd2zQxAaQF+hZTEJ2dBch6lL1eveKlEQd8wNaUCHx06AknFvhis2KHTw/joG13NtdKsTn0laM83sZj+YPjvMHQQyTItu9CxsKRq672QB6pQlVTo81Kz+Y5kSIsixvxmjS8S9spbMnGI8mGL85G3NFnoQLDKf3dyXr4PLla8CZa+zLc7mZATFnac+xEDfn4Ja06EhgqzQRO0j9g34PHFeuKLUG8YTqxpLkCKDGGhK/KX0v3qnXDAJPsOE1RAljrFSp6S0OFzWq7+XM6q+eva4FuiJJ9uIx4c+fWPGul86XOmq/TyNIf15DZw/g7i2qUBNQJLzLjafOHrgiX/AeDuYFOBlLnia8080Xifvn8JWsKye04S/bVlcZc4Cy/OUaP9tIWCmGl8AcDh4hOymjw3gjyyKis2S+brxtuQsDnhfZO5yCFiZCdtloV2zlShxrvTZR5fpQyUwfyjF/wYjN06gEg/wJO400sdE4qmhgtyV+uMARKnyp6Je00RPz1cNsKBONe2AC5uPVNcsv48BigBzArkmzgfsnUrnc1GFlB1Tm6okPCU5VYKHM9I6VvLIAFmkQyjKU9dxVVLTjaeb4UiqR7PKxNA/ios5awi+rbnxXZnnndzlSeUVrg71Owo0vRoLg9YqV3BwRciLB/1DJUet2Qa4yq2VZ3TN2DwPLuzaxmYAIYsxlVqdNAezKHP0M3HqbsWqSX1D3fMLRwMYj0ncghXqDN4j99+AHbdXzdnqfgLUAn2vUwWQe+HktmXuJNVm4WWo03SSvreThTVwAERDpSSOnZ/eF7QQVrAo5dJ9Yb7oYliUKovngNsLoR4rz7xefppvQZfvAouvAS6YTSGJN4AgMgL9PcdIsdIxgmPHxjlIO6lOCXtu2HDNUC5Z9/mg2r47Z2e1FmVgAhSrkxlLCxjzvJZHFbqtyHoalkqHQzdUY83GIRmXLubiFJ8Jw6OXG2G0VNmJiJFnGXGV9BPnsYhYxCE/MywvzovcrayEb/3xg8ldKoAUI5+EK2aMhaWA7p98OHNOvZgI8rzCCyYszfPmTpEgwES6055rZ8hsbp26vr6MQBX7eui1fS2TJJISiUufSRvthBAL2O2T5+Z9LC54bZdKvamK2RUcORlRos0S/oSMHstvBhB5Sf1SSvi+rqb7yzl4MCivXh2w5IC6WoGuxPhaPuYjJRmd3Kc30sV9mLMCY+MzezYhc1QLnDRE3MIvLZNx/1tDU/Isna1kpq4kvzOzRQRB4WkbRISzL+VVg1HFCpA9iUEOB2VB2w5mLj6NF8CtWWkJeZPJOh6wPzNINxoNFEAWS6BUznMmG10tbDsoMIeli3mQhy3m+7Ii4O5Cjlp5F8/pzqBnFPMgBz4S0FV3HhZUA==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wM7oLN2ioSgcRR7aqdAUw4aFGF1dXY65y1l3FsfUWnQcsA4xKrYh3NKMtd8Qj1s4cFt8BbDmK8QMUm1E80aZACbzDj7viFgufugIBf5DdoofYc87c/4ji3p12ENdZOxCvj</Encrypted>]]>
    </text>
  </css>
</dir>