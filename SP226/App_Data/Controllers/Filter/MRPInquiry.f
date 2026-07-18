<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "MRPInquiry">
  <!ENTITY c1 "&lt;div id=&quot;&Identity;&quot; class=&quot;&Identity;&quot; align=&quot;center&quot; onclick=&quot;refresh$&Identity;Form(this);&quot;&gt;">
  <!ENTITY c2 "&lt;/div&gt;">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Truy vấn, xác nhận đặt hàng" e="Requirements Planning Detail Inquiry"></title>
  <fields>
    <field name="ma_vt" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1'" check="kieu_hd &lt;&gt; '0'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
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
      <items style="AutoComplete" controller="MPSVersionList" reference="version_name%l" key="status = '1' and loai = '2'" check="1=1 and loai = '2'"/>
    </field>
    <field name="version_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="d1" external="true" readOnly="true" clientDefault="0" defaultValue="0" rows="283" categoryIndex="1">
      <header v="" e=""></header>
      <label v="" e=""></label>
      <items style="Grid" controller="MRPDetail" row="1"/>
    </field>

    <field name="d2" external="true" readOnly="true" clientDefault="0" defaultValue="0" rows="283" categoryIndex="2">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="MRPBucket" row="1"/>
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
      <header v="Thời gian mua hàng" e="Purchased Lead Time"></header>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Qga6QGoK6kJv+toQ/pLV49JPIADktmBG7F8yCON1Zpl4y5HM04zTKqeCVoBHH6iIWrmHKAOj9uisiDaEJISbSrGPE/bYYUhPFX3YhVXenov5i7e94SznsYq9nu38U6R7eakEVL8M+eZdm61pioiPm76FPxGiLCB5W8gBwn0zMxQ5nMjibXeIlwj/kcoPRfD4fBGCAoo7mbYg1jBIkuYY2w6Lt0hLal8TmFWL9dclWxuXLuRQcLUoa9dT4Y2OCErvV7R26qqNirlAd0JNhQngKuRCjxNnSUGa01LZTT4NNFjqdu3v2BwR+pc+nPk0tHHp5Oqhrx86gdmBD9//QMl5PLHYeIBlJKlm0ILPDM+Y+Vy4+1R4n6HIJQwh5HHy3M2LCEhR9TmeIzzB4T+XIlrPDZq/8MKOcDQFrpFlL/NiHI3JGlxMqXPstJK3dpndweu5WAAtPrW5gIGUcPjQjRhhtg=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERujriFo29/Q0gqOwIOfozexZb5bsSi9HWrkIZNpBMrom</encrypted>]]>&Identity;<![CDATA[<encrypted>%0zykrLrNegqps1ohJUdnjo8+TDrq91MpeMj8LIRD0M7JaZFTknNnnkplTuxtgltlPBWTKW4ZAqhfBkLFiLbSr6mvvd5/gvr2D4V927+W5OM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lZOpTx8QxHmPNkLj1WKlQ88J3AtKVxpQRBYBmCoXEnhdtN04DpyFkMVy/Fe7P09NTH1UdJUjYfhaY3RCJlzW2Da</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WF8NgysVmttq94vz2xZ5nDXWh1eD/uHtUpK1nm5vve6ZYI+A8kOVnc9ueizy4Ir5GNUAHf3VwUq50NYW+PpeItCXHdVcoSTonVeTXxnesXBoECm+3Uyq32cz33gdAd+pwhCrJAotkJTeq1P7NPhY7+NejSzRwKWHZ141VsSsCaAntPgfA6hxx2wN++IozBvgh4M+SR1E/o7vooS3d0FVz6PNKX63uaxcwH6jkf1YD+vol/jBAC0XC66eZ7UvrzmXshHAF6mw5QQIVaW+JZsbGEw=</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERvk96+tHhGQwpRhYUtEs8YJv2T218VL1Bvacfa04l42RwqSwuk/cy+iq5rKaGG9f9N1RrMavKxJn5LTPDE9kYas=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LTZvRiP91f+o2zisAZ84LHFCX4cg0Q0tSN7FYFjEzfogjN/xmcCeyGULv/xIySr9JJwRDbFMDUnr0zSTV94Sh1DLjJ6JLIT1uIk5hZUWGVxgg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WAxMoePBY8KOQHaSPlFv9uRUDJIUG0D+pKuicCK22ctnUsmA6+RJFRcRewtt19z1NU2gfnbe2HncBEAfuYGRzho=</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WMb0iJewtuwisOHQqzH9UtoJ/KKAiKEVQ7Ob4Hpdwo0tvDpKMu4rQu0eZcyRcQd4tUEBRQQ/jb+YjRFqgH4+cYCCuNCj1GTJjTdx58ShYZT4O0/f+dN6WmnHbpvAZb8rhA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7EHUdCAm1C6YpTd3s5K4yO+Z16qfg/KEy0cJyPsX3HgoGqEFmNcStuGwM15+Ps8AHHjEDElafF9ZQAYlG+uLWFuPP6tAbqVru10Eo7ZKGgGRhGKRduD0zffQam/oZz8OnzFnkzq546UCTiLfZaiwkrzOtvYYq97MmJGogSn1TAM6Ys4U2AyFvCWO9/W3gYXXgla3UsX66+XyI0ucRFM/sn9rRARhUDcHfmAsnNGbQ/M+GN+yusnUFZg2w4CAZF2qIHT/TYHevYEWFQgQRFLCa2W+0i08Qn9vhvDcBkEgjd/6MqxKa9c9UEyho/LMaZliWYf4asKMl0cxetmYq2F5rb6BkVXiSh5gUVS8yriE2toLwQ3mPz4vEGiW7EVlMC6zRJG2XDVzQERUvu6fqgyplmxapAez+RHvPwR2J7MfDd9Y7vnAvHCZnmf4zPtT1xPoILkkYHnOdsgyFGO5YbSkn/p3z9fgAaOclf8AAGrBL/LCBY6Mkeu/G2Q08UWWi1qKlJpDwTGbejacn9L4rIySCrVqmLGBrX0y0R+A+ejiqLC9IsmLu3pUn9HLYMM2oGdUdv/8lSYdLi8jJI5gItvxyTNoEto3OJzNE5ThE7NCl/BWGn8CcGVB821kjcsfGsEilSTzFB+jrjswNJ5btwDsOhmzVyimguzN6+vlRmHV66c1KGPLXyFZkIAVV8yRwro0bHQzpp6Aba48ZMWTVKyQmf8+N95GgcM3waObB7sPpGj0FCIiqLsx2DpqZU/q5FfkdH7TVIkeGQKmgc+5/40UAymBGOcLMSCR9o55lKUikCoz147lXOMs9NWEWKzn2IdNICraWDJc9JVDvHi1EyTu6/jgFzBFVFxNBRMj8zCsLxc+7dCnmPiG+fKmE+kJfqMIN</encrypted>]]>&Identity;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v+4PyfckcnxRrWUatXznJKxpECXm4irHh1vcFBDG8MtnKr9qVd/Qhq5fMFwRZ0gughkFAx4yil14y6QHpw58JpqSar5CiM5jWeSHr6rNpHllqTgMaewG+PbxrS+cBUggUYqtFKDeV7L0/f4iNQSBa/QHRcv+YV18kQVN52w7dfNDFspz9xFwcrhZ9HRg1aeemilVgXl1tcTZ96F3CsWqC9lJnaa+e8IQTl3GvLnj3aSwrnHVVHGkXlF38MIduUXyxujPWYXY75z/QzpSIHmXCDaa3f4ut2uxs9htkHz58BZagpieJ5qNkxo6djEpp2TL4KdBURx6LXogKjoe0s9u424=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9CEnwFw7Ur7ltmYGbTGJFEwm7HxUW9FZWv4tbjhvb+f0Jv6rSZHN4WHQxgbUtENNDaKGZnlakv/xj7nhByHJRxZwnRGLIo0dsEJ1veDUfecvzDCOH3nFocoiNa1LdVE4MJgsRhOrdON4ScSyTIhAOgFFjnCZnz50RsZnfJjHxqAP/5RXKQLH51x2nW6Q/wst8Kbfai/ebsVXYlvLd1cb5iQ/OiNj6F/Qg9xAtDGHS20oH/6uRALJxwKfmSThXxPKJbRspWi6tI97mWo8SFMQO3KHC3LejAtxm+iuDqLn+ilV/xRxRMQCTkokKaXlZYDeD9PMfWYjl/mKPi8Sg5EzZDGg2Vo2DPuXKTXLDd6vpDQj4runZKg67B1wJSGWC0J0lA==</encrypted>]]>
      
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLBxk+v1jssxS0c6WoxWt8WzUdwH0vDulX1DvDDaSphiW5tVrMheowxiZpPsYMuRDxG4HRVsxnjuTWNtHcmCyr2M9i/514yWp4o+LR1xpgD7S0mOQKekARoA92CBGPS2/M+B4LipfQDcF6S5247Sk22SA5KK+hbEljYD0FVXzq21mlf3cPHblKyXq45XSazCyluNGTmuiz1NenAAXi1gS8hcDg0HwWv5JSx2XdGg3hKB+jqj5XR1pFxETkAmbgVhf36iiA7RvIbG7lK37NOJowFrlbH293agWqyyxMayDBF+Xgv8p8k1/0n9367GtItS/YqmiHB8TTX87Q4sc+V+ngNm6DqEu1dPji/ZO+e0LZqHH9ihDX0vqPLBNbUdEdLGT7hA==</encrypted>]]>
      </text>
    </action>

    <action id="Period">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XM4h4WitZuR0Hgkjld7iv5JZmccXWU43Ii2DyI0BaqrqZrtm9lh+vNV3A5nnEYN7xSKQ/LUd5J05fqWzlJV0DyROo5DFkG7y5HPc4+sTKc1EpeVxWGhvddD5DJdGinmib2wurZe4nmxYwhdNBtYR1vfpSu3EEPiBik1CoT8yTj1Cx9pwXExOFmnX3BjQdWVcs8Adam/R+3v9a2SPRlMMWib8s49+rPgOoLxjuV+Z5PWGi/KJfF5zJqqB+zoTRremS42x9Xrv7mnC8SOGpLJmmT7VOJzOrj6BrYfD/ZRc2gz2g4u8f7H1FCjsb5rfnhyynKRzClzRJtMhH/D8it2zv7zC+Q8e6lcjX1Hg+wL4s3d</encrypted>]]>
      </text>
    </action>
  </response>
</dir>