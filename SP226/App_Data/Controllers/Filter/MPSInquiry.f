<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "MPSInquiry">
  <!ENTITY c1 "&lt;div id=&quot;&Identity;&quot; class=&quot;&Identity;&quot; align=&quot;center&quot; onclick=&quot;refresh$&Identity;Form(this);&quot;&gt;">
  <!ENTITY c2 "&lt;/div&gt;">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Truy vấn, xác nhận kế hoạch sản xuất" e="Master Production Scheduled Detail Inquiry"></title>

  <fields>
    <field name="ma_vt" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' and status = '1'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZU0fWszg7cqdn47gfVQEMamc7ttX/nWkw353+gkXgXuM</encrypted>]]>&Identity;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vxLt6na8zQrNYad98Sr556IP98thb5//zsI7je8noVoG</encrypted>]]></clientScript>
      <footer v="&c1;Làm tươi...&c2;" e="&c1;Refresh...&c2;"/>
    </field>
    <field name="ten_vt%l">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hoạch định" e="Planning Date"></header>
    </field>
    <field name="ma_ky" readOnly ="true">
      <header v="Kỳ hoạch định" e="Planning Bucket"></header>
    </field>
    <field name="ten_ky%l" external="true" disabled="true">
      <header v="" e=""></header>
    </field>
    <field name="dvt" allowNulls="false">
      <header v="Đvt" e="UOM"/>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
    </field>
    <field name="ten_loai_vt%l" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>

    <field name="version" dataFormatString="@upperCaseFormat" onDemand="true">
      <header v="Phiên bản" e="Version"></header>
      <items style="AutoComplete" controller="MPSVersionList" reference="version_name%l" key="status = '1' and loai = '1'" check="1=1 and loai = '1'"/>
    </field>
    <field name="version_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="d1" external="true" readOnly="true" clientDefault="0" defaultValue="0" rows="283" categoryIndex="1">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="MPSDetail" row="1"/>
    </field>

    <field name="d2" external="true" readOnly="true" clientDefault="0" defaultValue="0" rows="283" categoryIndex="2">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="MPSBucket" row="1"/>
    </field>

    <field name="kieu_hd" dataFormatString="0, 1, 2, 3" clientDefault="1" align="right" categoryIndex="3" >
      <header v="Kiểu hoạch định" e="Order Policy"></header>
      <footer v="0 - Không hoạch định, 1 - Rời rạc, 2 - Cỡ lô, 3 - Cố định kỳ đặt hàng" e="0 - None, 1 - Discrete, 2 - Fixed Order Q'ty, 3 - Period Order Q'ty"></footer>
      <items style="Mask"/>
    </field>
    <field name="ton_at" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="3">
      <header v="Tồn kho an toàn" e="Safety Stock"></header>
      <items style="Numeric"/>
    </field>
    <field name="co_lo" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="3">
      <header v="Cỡ lô" e="Lot Size"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_ngay_dh" type="Decimal" dataFormatString="####" align="right" categoryIndex="3">
      <header v="Số ngày đặt lại hàng" e="Interval Days"></header>
    </field>
    <field name="tg_th" type="Decimal" dataFormatString="####" align="right" categoryIndex="3">
      <header v="Tgth sản xuất" e="MFG Lead Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="vung_hd" type="Decimal" dataFormatString="####" align="right" categoryIndex="3">
      <header v="Vùng cận kề" e="Time Fence"></header>
    </field>
    <field name="ton_kho" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="3">
      <header v="Tồn kho" e="Q'ty On Hand"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_tinh" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="3">
      <header v="Ngày tính" e="Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="343" anchor="5" split="5">
      <item value="100, 100, 137, 100, 100, 8, 58, 50, 100"/>
      <item value="1110--101: [ma_vt].Label, [ma_vt], [ma_vt].Description, [ngay].Label, [ngay]"/>
      <item value="11000-101: [ten_vt%l].Label, [ten_vt%l], [ma_ky].Label, [ten_ky%l]"/>
      <item value="11-111: [dvt].Label, [dvt], [loai_vt].Label, [ten_loai_vt%l], [ten_dvt%l]"/>
      <item value="1110: [version].Label, [version], [version_name%l]"/>

      <item value="1: [d1]"/>
      <item value="1: [d2]"/>

      <item value="1110: [kieu_hd].Label, [kieu_hd], [kieu_hd].Description"/>
      <item value="110: [ton_at].Label, [ton_at]"/>
      <item value="110: [co_lo].Label, [co_lo]"/>
      <item value="110: [so_ngay_dh].Label, [so_ngay_dh]"/>
      <item value="110: [tg_th].Label, [tg_th]"/>
      <item value="110: [vung_hd].Label, [vung_hd]"/>
      <item value="110: [ton_kho].Label, [ton_kho]"/>
      <item value="110: [ngay_tinh].Label, [ngay_tinh]"/>

      <categories>
        <category index="1" columns="769, 0" anchor="1">
          <header v="Chi tiết" e="Details"/>
        </category>
        <category index="2" columns="769, 0" anchor="1">
          <header v="Theo kỳ" e="Bucketed View"/>
        </category>
        <category index="3" columns="120, 30, 70, 330">
          <header v="Tham số" e="Planning Parameters"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1uI/LCLO16RHfPfwIkIPBzltyB2C1Ds9KabDbXGBviot8ueyDbTEuRRfGym1t7rBT31tkwaY8vcw/3Jnna4++w=</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Qga6QGoK6kJv+toQ/pLV49JPIADktmBG7F8yCON1Zpl4y5HM04zTKqeCVoBHH6iIWrmHKAOj9uisiDaEJISbSrGPE/bYYUhPFX3YhVXenov5i7e94SznsYq9nu38U6R7eakEVL8M+eZdm61pioiPm76FPxGiLCB5W8gBwn0zMxQ5nMjibXeIlwj/kcoPRfD4fBGCAoo7mbYg1jBIkuYY2xRIUfGVnN1VZjASGi9yu+875YQ7OPrBCpprCToGqQVtpyjZxJ3AgA/BAaiuMkhNS58Jl9BfcQsiOiY4w2DFnY1h/MVYIiEyzRwxyxOs7URnc1CzUqGrodCn+f1XcwAKBO8WLB0olArMVvZy1ErCMm/JlLQ1eT515qbEbBXsUDY9oy5HAIDIGQ6smMqTgOlstZNenEUwmOYtB0ILp6slP1OWhy61zGBBbhm8N0H9r+0bg==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4PuVsx8HPOHN9j1LElx/HzBMF52oDifsO9zk9U9uLH3</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERujriFo29/Q0gqOwIOfozexZb5bsSi9HWrkIZNpBMrom</encrypted>]]>&Identity;<![CDATA[<encrypted>%0zykrLrNegqps1ohJUdnjo8+TDrq91MpeMj8LIRD0M7JaZFTknNnnkplTuxtgltlPBWTKW4ZAqhfBkLFiLbSr6mvvd5/gvr2D4V927+W5OM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lZOpTx8QxHmPNkLj1WKlQ88J3AtKVxpQRBYBmCoXEnhdtN04DpyFkMVy/Fe7P09NTH1UdJUjYfhaY3RCJlzW2Da</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WF8NgysVmttq94vz2xZ5nDXWh1eD/uHtUpK1nm5vve6ZYI+A8kOVnc9ueizy4Ir5GNUAHf3VwUq50NYW+PpeItCXHdVcoSTonVeTXxnesXBoECm+3Uyq32cz33gdAd+pwhCrJAotkJTeq1P7NPhY7+NejSzRwKWHZ141VsSsCaAntPgfA6hxx2wN++IozBvgh4M+SR1E/o7vooS3d0FVz6PNKX63uaxcwH6jkf1YD+vol/jBAC0XC66eZ7UvrzmXshHAF6mw5QQIVaW+JZsbGEw=</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERvk96+tHhGQwpRhYUtEs8YJv2T218VL1Bvacfa04l42R/VINQo0ItV/+itUO1Hb+unAg3UEcynK9QbVLJSCc9UoedOLZYm4YG3QR4xWKj/YOk2B667xNLhNwNfsWqnmzqfNo8zbhg1GL7EUOwcFhu/0A9dVW5fjSW6ySjZqTxB5Gsl9mXWZb+gqolUZnK21qvw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WMb0iJewtuwisOHQqzH9UtoJ/KKAiKEVQ7Ob4Hpdwo0tvDpKMu4rQu0eZcyRcQd4tUEBRQQ/jb+YjRFqgH4+cYCCuNCj1GTJjTdx58ShYZT4O0/f+dN6WmnHbpvAZb8rhA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7EHUdCAm1C6YpTd3s5K4yO+Z16qfg/KEy0cJyPsX3HgoGqEFmNcStuGwM15+Ps8AHHjEDElafF9ZQAYlG+uLWFuPP6tAbqVru10Eo7ZKGgGRhGKRduD0zffQam/oZz8OnzFnkzq546UCTiLfZaiwkrzOtvYYq97MmJGogSn1TAM6Ys4U2AyFvCWO9/W3gYXXgla3UsX66+XyI0ucRFM/sn9rRARhUDcHfmAsnNGbQ/M+GN+yusnUFZg2w4CAZF2qIHT/TYHevYEWFQgQRFLCa2W+0i08Qn9vhvDcBkEgjd/6MqxKa9c9UEyho/LMaZliWYf4asKMl0cxetmYq2F5rb6BkVXiSh5gUVS8yriE2toI3VKZSVRE/w0ENyeq8w9fuCpDUvNEXOLc2yzBdZNP/FFecATnui9ErsfBGanFgswV38Sj+yL9pXPAH3iYPJhwoYDak3KZu0B86sQPbM3+EI+n7BRGO1r7rKqlQRD4YYaoSr8qAUSN/uV9nD1zTmhLcyGWepJcQTz4aNCXwQhc/nDt8/ss/CtvewKd89ZFxGDEJ3oCEIsQg2LTqSGOkUw/pHgrSFmfhgrZE7nIcppSyCUxz3acPreMXLN+WtM3W03H3eVCevSR9P6XTUVUKneUmWaaCCKNWCDFsNktvEgoZvtp6PZnRPRvKj3DYF9w0bP4+xFo2+m+Ls9k2VJnpcjtQOOfIdSf5ZJuH0JjoUFG3On3rGWdsh+urBMYxGk7v71Qw4OmVYLBgyj+fV6iXL/1+Nq8DmZPmfPcjjYI1PyhFVEakBGIDZ08a3P+AuJrSH64v8ZLQCQM4J7oRW6tJE7kDJxRrn1Gu6x1D4UzkghGhwiBLbwEffC+J68XZDdGwQHHKFerYvyOteRZv8mxLvt6i</encrypted>]]>&Identity;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v+4PyfckcnxRrWUatXznJKxpECXm4irHh1vcFBDG8MtnKr9qVd/Qhq5fMFwRZ0gughkFAx4yil14y6QHpw58JpqSar5CiM5jWeSHr6rNpHllqTgMaewG+PbxrS+cBUggUUAcsL7HWNwWN8PU95Uq+I9sr/4G/45IqZcgAMq9Wbh4gP5v03fSGhEtJXEU/cTW1cITk+sRmwpNHBtYosbHs1Ood4OqAYFit1BF/jebMgiiP64K5GRq1xrMPQdh5bqqcaXJB8ze65CyHaEXkyMyxW3qgEq79EKh/x2Qae7WBG+1dn0rfPPlL8jGlzbO6Whi/3ZVxbtzxsEYrdgDMy6keEQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9CEnwFw7Ur7ltmYGbTGJFEwm7HxUW9FZWv4tbjhvb+f0Jv6rSZHN4WHQxgbUtENNDaKGZnlakv/xj7nhByHJRxZwnRGLIo0dsEJ1veDUfecvzDCOH3nFocoiNa1LdVE4MJgsRhOrdON4ScSyTIhAOgFFjnCZnz50RsZnfJjHxqAP/5RXKQLH51x2nW6Q/wst8Kbfai/ebsVXYlvLd1cb5iSO9Zl7WxkMf8aRiYiZ/SZe416R3/35kXahIqG75VliPamNlImPXcoTaJzzAeofF2BLMU3U5aRndUoW/p3P3/l65qtjcNFxVW4XyjfmtUmZIvrTpCcQm85kct/aCwHwJP4vm/5wsUSVbU4TcPvfL1DMjZXDkE0B4LZKEAWBls7LRA==</encrypted>]]>

    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TM6fvK7Y059H1vOr4HtdTk=</encrypted>]]>&Identity;<![CDATA[<encrypted>%Kbufz2Ma0t2rOdHaaRlgJZQ+qjAwhIH75YSRc9+nasoIJqbcyJxDUQDeQQgPBMKYzURT4LElQpxCTgFJ1OGNoQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%4LTJz8GKx3FEGuPX3Q5xYBEN26AeGseo90FeE5x3cjiFJWrjU3LKdAzPfXo8B96T/UzQPaNM9N+ItitSPp1WWv4OzwVhC2jQaY79MNL1GtOx64cHi6/dY2JDgxpWw+yxYOlY40UDHv6JzTVXBzbo9dxMhV7Q93q4xh+gJ1Bnnt8=</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLBxk+v1jssxS0c6WoxWt8WzUdwH0vDulX1DvDDaSphiW5tVrMheowxiZpPsYMuRDxG4HRVsxnjuTWNtHcmCyr2M+H7XdO1f0nfsDzigSjCRPcEcDvfpniPIFwUeVR1s1r4qf9yqBeoe5BG1Ayyx4MJ4xFUraJ76K7rQMDoOY7IBf00ybKDpvwmwB6r1X2RLrzGWdF+86Jar3YyJcbtu2wpWHpEpNDACCIJiZ1VJ4D9X8Pdu57Avubo32ujlpwz8QwA1Z8OHNcQA2HOBu8jkzgpyYxKLis4S2M+GrM97zRyQecZjRTkN+iYc1penH8vY7HOymBQO3pffUwa/4x7vt/QOSYIJtrhO+rdPMUTB/Z1IvZE5yaif1ocsPj5Pv7lWQjfg==</encrypted>]]>
      </text>
    </action>

    <action id="Period">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XM4h4WitZuR0Hgkjld7iv5JZmccXWU43Ii2DyI0BaqrqZrtm9lh+vNV3A5nnEYN7xSKQ/LUd5J05fqWzlJV0Dzz++jtxe9ZoIh7hU8M8Vb5fva3tVOIXXR0pQ7Ng9UC9VyCS84hWl6NaNfff2ISv3wuswmYxQZTdZ1UrhxdmOPRJl9DEnlTEuQjY+xmuqkNgLs4NZxDHDCfY8WaM/iUOM8IADqVNlX+zUOmqHQEGPsLHgi5abBJt3Eg3EFmjGQIU47SJL9n/lDxXed7pUfjXC+DYNyUmqE/d6bVAVOmjT6kbeJRjFLPBKoBcXhpwbUqAh4gLh0d3UVMadVzrjNPZEEMjp6kwHEbr2wjSnigDNq2</encrypted>]]>
      </text>
    </action>
  </response>
</dir>