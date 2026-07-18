<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;
]>

<dir table="sfdmcumcv" code="ma_ccv" order="ma_ccv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="trung tâm công việc" e="Work Center"></title>

  <fields>
    <field name="ma_ccv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã trung tâm cv" e="Work Center"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ccv" allowNulls="false">
      <header v="Tên trung tâm cv" e="Description"></header>
    </field>
    <field name="ten_ccv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tg_ca1" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="1">
      <header v="Số giờ ca 1" e="Hours Shift 1"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_ca2" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="1">
      <header v="Số giờ ca 2" e="Hours Shift 2"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_ca3" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="1">
      <header v="Số giờ ca 3" e="Hours Shift 3"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_ca1" type="Decimal" dataFormatString="### ##0" align="right" categoryIndex="1">
      <header v="Nguồn lực ca 1" e="Resource Units 1"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_ca2" type="Decimal" dataFormatString="### ##0" align="right" categoryIndex="1">
      <header v="Nguồn lực ca 2" e="Resource Units 2"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_ca3" type="Decimal" dataFormatString="### ##0" align="right" categoryIndex="1">
      <header v="Nguồn lực ca 3" e="Resource Units 3"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_may" type="Decimal" dataFormatString="## ##0" align="right" categoryIndex="1">
      <header v="Số lượng máy" e="No. of Station"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_cai_dat" type="Decimal" dataFormatString="## ##0" align="right" categoryIndex="1">
      <header v="Đội cài đặt" e="Setup Crew"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_th" type="Decimal" dataFormatString="## ##0" align="right" categoryIndex="1">
      <header v="Đội vận hành" e="Run Crew"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_cho" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="1">
      <header v="Thời gian chờ" e="Queue Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="hieu_suat" allowNulls="false" type="Decimal" dataFormatString="##0.00" align="right" categoryIndex="1">
      <header v="Hiệu suất (%)" e="Std Efficiency (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="hs_sd" allowNulls="false" type="Decimal" dataFormatString="##0.00" align="right" categoryIndex="1">
      <header v="Hệ số sử dụng (%)" e="Std Utilization (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="pt_lich" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Phụ thuộc lịch" e="Use Calendar"></header>
      <footer v="1 - Phụ thuộc, 0 - Không" e="1 - Use Calendar, 0 - Not Use Calendar"></footer>
      <items style="Mask"/>
    </field>
    <field name="cs_gh" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Công suất giới hạn" e="Critical Work Center"></header>
      <footer v="1 - Giới hạn, 0 - Không giới hạn" e="1 - Critical, 0 - Not Critical"></footer>
      <items style="Mask"/>
    </field>

    <field name="sfctdmcumcv" external="true" clientDefault="0" defaultValue="0" rows="242" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CRWorkCenterListDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ccv, ma_ccv" e="String: ma_ccv, ma_ccv"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="3">
      <item value="120, 100, 533"/>

      <item value="11: [ma_ccv].Label, [ma_ccv]"/>
      <item value="110: [ten_ccv].Label, [ten_ccv]"/>
      <item value="110: [ten_ccv2].Label, [ten_ccv2]"/>
      <item value="111: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="110-11: [tg_ca1].Label, [tg_ca1], [nc_ca1].Label, [nc_ca1]"/>
      <item value="110-11: [tg_ca2].Label, [tg_ca2], [nc_ca2].Label, [nc_ca2]"/>
      <item value="110-11: [tg_ca3].Label, [tg_ca3], [nc_ca3].Label, [nc_ca3]"/>
      <item value="110-11: [sl_may].Label, [sl_may], [tg_cho].Label, [tg_cho]"/>
      <item value="110-11: [nc_cai_dat].Label, [nc_cai_dat], [hieu_suat].Label, [hieu_suat]"/>
      <item value="110-11: [nc_th].Label, [nc_th], [hs_sd].Label, [hs_sd]"/>
      <item value="111000: [pt_lich].Label, [pt_lich], [pt_lich].Description"/>
      <item value="111000: [cs_gh].Label, [cs_gh], [cs_gh].Description"/>

      <item value="1: [sfctdmcumcv]"/>

      <item value="1110: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 110, 120, 100, 203" anchor="4">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        <category index="-1" columns="120, 30, 70, 533" anchor="3">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVsEVAeKiADW9XDnmjeMulMqIEkO1wH0NCWapsmC11yQQFBAsR9jtjDLTK2pxk0JxW53BtrrBG9wdfJxw0XQER7JbY2KEHoI0JHiAQOPCwWYhokvI2CXBzc49kNt5Sh+WtA5huEnEBrPPxtbQyivd5ZFJbpHn4IcA3RemPcc/VXrnAlck2AGzd+jYlw1M0DGeoJwILj8CC90cHzebARiqDFQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEe3LNE9Popi71rNj8JJBGva/zMBsm/24mZkGwNvPKLlrvtcrx+nLFGfPdNG0ESgTeDcADj4RNo27vHVglw5AHdYOol/h1kWvQk24v37rEvQ</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIEsaGRTtYaoVEisValtOv+bY99syPM/p8w5axAWBZv6yqkxUi2cyALRLSxiuxyMQEOat1uapE6R3aIxc1AR+qWTWGx6o9OYt+W4bQhn2RO6PVHc9GUJ/RNusIw4IQkleloeXtjwsfzfsnwmn08o2LeXyDiwU1jrnaYAhLcXJKeBiwn23kcx/T9JqY6tp1rpxqQ826XlEMMsNDyZdtNremFU/4KYzzGTSX3pQ+/8CQ0GCRAV7gfnhCMQUX70KaCdl0AUyOaJPoRIsciM+3yU7hlb9Ew+E4GEO0bUs2Wye73TFReUSD0GQGkBv5vbp2tLHCOcMdc/dWPeo//HwoRYLfuc+6dPQ+XH7v1YpAZiiq4+k=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C/ySTkRqvZSibrupULp1xchDmuzqEyfDsraPs694SEnLvokgFkVg1psIVuV8ggOMbr/gAPZXvDvYlZKu+VfR7BCuRBKFtXKPIF/V1KgOD4nNs+jOhY8E+Fk37y7lbvk5KDS4+bwywF91uMY62nwY8oVVg+O1VW8dohzSeJAkOlvMtusN8SAVA7nZwa9XYz0W/+i399H5Zh21BK/fGgHug+PIa+jhaOtbk2i5fizlMNz15HUkVc0ZG7FKRvyItMOpD</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOknSJy1wKW/4/ZFytH6U2c9o8azz1YTTF4xKqq8eBJoFDax1tWoVEmgcAKQXKeewlcE4ivQLjPP6M07SMCwIpkY1SLryBcCln7o4ZahFb291TUvHXYby2/2dSyzkoeyU7SrlX7K+6fQlcWgN5g8wU0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteWspG1+mQPDb/bW1tgrHgxpvBjGP8Hu68LIWSKDyj3GprgvCetmOsaT9PamfSTz7L6G9v4HKlytM71VwOBgeGEzmIv/aD4IYsFF00c78DWKVApo5D6aJXrEmoGzgJxI6qMVi7ahK2StmF69sUZMoGrAoaKm/ZRRvnWnTuWaLh4VqHOswaprsGks16uJaczRdqwJsbH8V2JtxBJjzCPbFqrGvcsEmU+x12ILThELGbJ75COzOb3WA7uR5ts3uIDIeGJSe6Q5gZorQBLClBSMJPdpPFV4tsJkz+yNcWOhjxN3eUzRHfdhKEa5YoM8ep7pU6cQhkthD80foYu2NhSRkUVEme+WfUcOBuEZN4DEOpEgo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVy7EzdbrLmgqXVXPhr7LCTYULN6bI/SQbbvlbD7sOf0mI0SIdPXcbHcarzbCwKKsElPqBmQA6znAJAVetQ8qDIlDqjukFFcwDomfRnYgAxzNmq35swu6NrRZYmcEhEOL6tCeKkkTIcmHFAKn0AkTkHTWdf436yLMx5GMnzoEzba5aL5hhUyCj6cTk/xbweTj1eWwmqGZbEbznIkEqV+0YLk=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2bsq5b6OFQTQKWUqaVt2REMR99Szm55gnJGowo4ldPEd5j4yVE3hvu9PWhxlh9paw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKaBUrspbPJs/UZF6A52n6fH9Aj6pDD0VS6zgnBjQqz1lX/TB/EjrjQUt955hwI0UgnB6O89ldGuv0Mtc7lhY/h9McxJ3RzPbVlrJJnRjWtAlqeGAnALMkhgbfMpUrMF/PfzGOafCzbzOXRXrARrpSO6RJ1zw0xrcvQ3zYjcgpw4lmbssF8awAvQXDGiz8BRF+Sl+aGIonQsPZjMBm9+P6x3VwBisvSM3chmRUIAQVMvEfjIhYfj1Us0c6AyliiPsQVNbO8hBZ1ytSrQidReMmLNBB6kwvYzRwsU5KcMmY/HdGx4NVsqfsgXsiX7e4+IKGYj5DkKIIPeF6j7g4JXZqZjsaA3Dpok18nNaDV8ipsjTFrPpdF1ZZkXM9PvBF3ZFXoOllGgCJlrKPl9igecJt3t3gQUWmkVvx9gIY83wbKTrS7wHDfw9aEL4tIEtc++Le/My/sDZxxyjMjijNRpDcb2+ixh0B8sVB6fVyXDu7ebb/VuYTUGIUUq1wPGfOxMQGdy4Ghds1WVOI3q07QtIsu/uAfc6vKcyHeTVqJXIeh/47oSZ8dO1UDCxbFtnKk0xqfLerpWuFfP9wppAQZCVT5Q5Stkt9QVQaYm0R7dXlTl7cDjOn0WBX55ZZ/6UEw++hXomvBFObG5Db/uXS9sVPxF2LSp88OIdGBxybrunjobr/VUy4GctBzicWfKQJy7sl41En3lNWA7uc0g8OU7Dw0fvL91V6Bsk5nGg5g4RXThYFvfuGT+LXv3MPZYLlbW8gBxppNqJI7IruH5bSYVqdIec0IVycgBhn3+9r65La2bopAPNP9xsJONNABx+XumBk0hqu4HXwUl5f15Uf5zW1gNueCt/px3DvD2iIRdaU6FsUQhOWByXR5p3RVkr6+BV+vmlzROmUo7ezBHUjLcnrdECBap8DXoSfEsPVsbiiho3ukrx9n7mj5V1stlF/Eww==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptIrregular;
      <![CDATA[<Encrypted>&0OcHBq554hlKe+RSHmnm08YJhoLTe2FEUDFMQAkHPLq297tyfRr933saJ3lvK4r96epQk3y0uiDaIopBagPaeFQt+TTb2vHrDVrZopTTkGEYOzNpkdZA6kvEeVg58Pc5vdhMx5SK/4Q6rgn2cktNpCKgL8Mj2WxtaA9HgM4AJPPCXEUfB+JEEmPribxThSuP9vJM9HvCGEemXYT9fSp1myNUegufW/3T2ITxpq/43y0J+AhvMg0ZGJt2YF9U1usXK8aQ3DDO1sEbLvNzgwjLdiGhzYT2pGrumDn54fevGuW/F9Wve88udhlP3y2Fo3wCj5W5unRh7Y5RIeOKX6qSk2VaOGPA8Elcr283QkELWK3oXb2wV8Q24QYuwgFJxt9lY0j/0n8OeVIw23ydXGtezDWiohTL4A/VN0FC5a3Fs3Dx1/16PdURtwu/1/k1XZuTu+mib8JRlEuKsNQgoHo1zF7GZTSK4N0Fs7LziVLAH0Wg9dQr97/YD41Hh4OJy5ZEditfyvGeFnLandt9UbvWd6jX6hhf4gBybYguaBWh/kt4T7pqQjdFHW7IMRN99zwVPeNkm+Nd4X40Tc5QtzVNp/10wUk30VJ6yF/VGDpBzyEHAjBUXhKtKpw4GCBu3/H6y7BDa6XYPBnKE6sfZNTYB+3qiz+Zl9bVM2Q6n/yR7uRucgz/00uQUHlOcbeGpgpb2W+fhqliED+JIS00tBSqZA==</Encrypted>]]>
    </text>
  </script>

</dir>