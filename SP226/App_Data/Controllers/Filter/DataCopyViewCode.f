<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Key "declare @rk varchar(16)
select @rk = rkey from @@sysDatabaseName..userinfo2 where id = @@userID">
]>

<dir table="dmscsl" code="id" order="id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Mã số" e="Authentication Code"></title>
  <fields>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP4iinL4cgjui839YgdRSXLVrtIf1r+9cfW/Vq+rFmfL/8FW3O8Qp/ceFtXpEf0Ty7o=</encrypted>]]></clientScript>
      <footer v="&lt;div id=&quot;btnViewCode&quot; class=&quot;divOriginal&quot; align=&quot;center&quot; onclick=&quot;showAuthenticationCode(this);&quot;&gt;Hiển thị&lt;/div&gt;" e="&lt;div id=&quot;btnViewCode&quot;class=&quot;divOriginal&quot; align=&quot;center&quot; onclick=&quot;showAuthenticationCode(this);&quot;&gt;Show&lt;/div&gt;"/>
    </field>

    <field name="chkpass" type="Int32" external="true" defaultValue="0" allowContain="true" inactivate="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_so" dataFormatString="@upperCaseFormat" inactivate="true">
      <header v="Mã số" e="Authentication Code"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="209">
      <item value="120, 100, 100, 230, 0, 0"/>
      <item value="11011: [cpass].Label, [cpass], [cpass].Description, [chkpass]"/>
      <item value="11: [ma_so].Label, [ma_so]"/>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1uI/LCLO16RHfPfwIkIPBzltyB2C1Ds9KabDbXGBviot8ueyDbTEuRRfGym1t7rBT31tkwaY8vcw/3Jnna4++w=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxC7INKAEBjWCEnd6uLmP7cn6Fy9WswAsVgOXdDDaJKDNa+XzleJRj8xVfCrmMIYs/vY3k/GlUFECcbCmUl9DCfKFVgF3FuD+MYXQHkzypkfclCeOuaLXWVjwHoMxT6NX7mjdQOfXu7ZLV8lC0Y83hRJp+bQ3bJM3AQdcAEBoR7AVdW2zl0mCje8nU4JfdgiE85SHGzAarW55jFR/z4KFtm0ArZbeLcreBVUj0Yb7Xs6</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxofxlfzvPc09UahCXkyZPBQ18d7Vx9hWcxdUISqykgpezw/zetmkmy+YE9s1LKdjWc0TziAUbKF1REqeT3Pijs=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FCqeYHhE1ax5nXv08ZrZw7Cbch4GKYQEWDnTxg+WAAE1tAuLEQfHrs56B/a49cxNJ7Z4y8tDSCG5wK2ij1Y0UImYEXJmisNBV39R22Yfmify0I4JHQDkluE+HueXgO0Q45bsXHlc37nIohCpuDjlarmFIG+myiELWCBivtyoJq8lRvsniNiuAioFj7XXgDQ4IQwTEsz2sTUE3uyNTP0CSe64Achc4WfotVYFqu91OZ3i3VYNexd/2Pf9ulmzE/Yq2SVXAyp175C0KLQLrlDePPqWDwnYn+LV4Q5PI2EhTrL3ijRLbD2wPnZeuw3oBEP0YGPHBgwsXKCY5mioQZdz8OkGpSwAL6XQxWWHnvOa+qDkwGkS5T1oaOCSTOwvMdBECb5CYA8bB5v0lc4waNl3ClIg2c2yDNpSiwV5oKEpkwusIzoomp3qgsLvWn1zw/Mqu8mADxkpkxWvOOy8d8DAAi2txPhGVx32zXGdSxFWwfKsVMgO0LonTjxYZ9AvofvoemDCqA35aok5F5ZldJB3KO0F+jir+toc17GkWbLr+SLMpSb25yP7OEP0EWyunubNlTl2Hk/qXRwdZlSDh5DOrAKraauUvA/l8aw9EqjeTsZw2yZMbUmaclGxi+B/7fZiA/e/TWZ3Q1Emg6TdaY2b1CUGpCVrk9YgMraPHdUQmuE6pcXumDoPaRjdeOAD9R4S0lVTFouN/zb+GDpzaJ4Pe86iIbqBLWf1EHwJlQD6h3CxWysBBUvG7lvCNDXJIBBd9hqaSy2PFbrosdtlFBr5gNA48Vr+srlT65y8iNTwBnVMIemZZ1tmCnjkmqWPNYS8ECc9WVnG01Wj8Egh9ZBuKI8DCi2Kk9EDDfKLo0zSIj6pkKDCD/4tiDkH4M8Gmo19yqbedXuz7uYWgOVwdK8P7nwvWptgsediFSqGCaG1PWyu3fP33A5LfSWeUiwoMqGPnuIbp2wQCfFg42YeTZi0nikAJ643t/k18YJpalVqqH5Fb6yaDB1VMN/NZPuGbhWvhbWiFqqLix3qUbiU/nTwHfrXuAdSJIGjk3hBEi3AMpTpTVHGp7+QenwGx8/rRc/3Dg3w84ZfFfioxp0miefR6kz8BytjQW8IMcH6ctjEdh4uY5J9XgcQiNYgV0A5oaVdI29N41QjKAPB4IfCAXoRPk=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZQSuWRKbacbBZJKnFsYXj2FM0qAcfJNILUpnV85LRV0EfTc4e/B8I+gJ+UQHgZvPROa6vzb4RiTWSrMREntjLWJt2Kbmf/zmhO+tmm5jgEYissNItegX/zBV1lPGPqZewppPB+bkqErzJHM5DTCL0/htqpdzdY7yw6OcZP1ZOJV97S8wEoIhr3H8mnYv7ObUiQt6sP5Knt1KDMnjlylo3VSI9cD78mEqi4LA6kSESfi</encrypted>]]>
    </text>
  </css>
</dir>