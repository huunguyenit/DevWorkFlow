<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
]>

<dir table="hrtbl" code="ma_bp, ngay_hl" order="ma_bp, ngay_hl" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thang bảng lương" e="Salary Scale"></title>
  <fields>
    <field name="ma_bp" allowNulls="false" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="hrtblct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="307" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrBasePayrollLevelDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_bp, ma_bp" e="String: ma_bp, ma_bp"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: id_ngay_hl, id_ngay_hl" e="String: id_ngay_hl, id_ngay_hl"></text>
        </item>
      </items>
    </field>

    <field name="id_ngay_hl" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="4">
      <item value="120, 100, 100, 433, 0"/>
      <item value="11101: [ma_bp].Label, [ma_bp], [ten_bp%l], [cookie]"/>
      <item value="11--1: [ngay_hl].Label, [ngay_hl], [id_ngay_hl]"/>
      <item value="1100: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [hrtblct]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulin3peYnnrcOSvDf0tWqFgbURPGySslx4qbiab8LHciZoGLEHognpCe9SEyxV6sEn59aNfJqFE9BCZ24cfe/qER/Gj6UekJEaOKTUBVtjksU4LnAvi1kSB1VgjEsKYCXFiPtux6lZyPaCJQu2G/qWnSwI7DqUtaBDYlM1wM/yxIevnR0zxLg/d2z0TSRb+xGEbCVD8IuV8NFQ8BMPi9oW/OOWT5cSZI8Nb7D7QMD2yhohOTA0IzRUxdavWQ/tk0UXZGPp+iLqFYP1JFYqRLmacINZ4ct9cUdGedAw23hOcE3XWYE8+mgY3UWxZp6SeF39VA0q8KTA1AATOlsPgRUc5bcxzug6aYuLy099VnTkD2uqYbGWBmoPZ2Fj9dQoN9WZ+</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/U9h1mMmjFbFS+pJ60UA68bGud6vLEV7UZNNLb4RLTsRPPv+ucOVE/XBkHwrc1n7+DpQbRL85X0zdK7B/bqcwuGidlgRL4s0Tm5yze2+1JTxCZ5SJy9yDplXEYU7V6e5Otz0dDwsiZn5EqmeBHHWeE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nqOdXWM7pi8qCe/eqeQQlCdPBPAE6Pi4qGSI+BfijYlRNh1mLMhEFkK3uw6qcasz6sqPgr3Eyeym2a90sFGecacB3p5BXxtWRXWk0jAr1B5oeEq19ZP26x3uK57uc7ushzKIhD8hqhegZisMJPQm2rG9d2YyB/W2XKDHfzeEWP1dlxRSD5Txrg2k7ZHLGHbCwb+7EUVsAYTmskTO6gNSHvHCbT5fWaRRDRtwuYkB70gXWPXlPIOWifRtq7X0VtgkqquEp2VC8V+Z9otGjre5BsYo3RoVWIWsKTtjcVNRop2c=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2snAjCoQPTqSajMqwQGzWMcBwhEB4QTcQJ0QEaxFaVFA52KeoTXpVFfHaEKKWRAww==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSQHCh4JmiM8XwXASpTrkuvVkwmkS4xWzAtEVojqBMIqqSs0YOobTeJzJpzVfSnVBq0C5gq0k1FieTFTyreyfIiPS45KAGmGtuF/YKnPnNiMJ8D6kmQl6bdxeFMKfw6X6cXN097RiJrQ+oc38V7z5LpElw8Y3X7EPAD5dZ1A2Q7GO7fzxbmJuUmivXABJdgQAlrQNaklKWdIb17Is9UsXWruF21hZX5bzb3GkwbKB65Cf5901D20GI3S8Owq33NFimHjcFWZa99vNL1fr0VUJw1kWiLIP8lUPgLETJEcH8ws2cMz6zGMJ9guXWXcqBSUT15oN4ZgeHeu1HhgqFpVJZR1foW8G7YdEqA09COQMFqrbeyVgNqg/0juArMe/9RoE78RYJaoHioslmPVnaoBVwHlPJL4UR5ldxS47DHwKvy7l</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwJ2gHHuNKMKUvnm9lJhQcJy6+73xBa/0e2MRqyqsd0mFtK7Ldn/99gHjO5tQO9mH9N0pD3b5jtkkXt1eRgxJJdsi1f32UUu3C5L5iiY/gnTn8YO2TfU1g6N2+xfM+T5u9N+oAN9KLYt3zecwkuXXtQBn3hRtM8iXJSfnjiNby4HD+laFpdSEG4YNg1Sw9uMvROo73v+6ZGDZdpEw+XRYYtVDr7NxDplpvRHBh0/Sd1P</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dfn1+d/VIhNR8LlET68lyG4fjzIPhhaoOotUMQP2jyP/lxMLO+9Oo2wRSPlU+WBrtEThkksYcaufk/xXkRkfvM=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krjp509zGCV032qaGuLa611hDeprjKW9Y9iLEv03SRedZSboL/TRJdqQb0cB2FEcIhE8hjvpqqYB3ZaZPnXDYJWVzkVf/Z3HvD0yZDCBsX9p017s1lsuKIdB58/Xefe40Y8SkkA5WHgBH0c5J8w6SCFetZiHRh/fiBnnZzdr1UlhCrcb3nZIoEB0ktZXPbFOsrpxIvnSszyQYSVtwaQQFf8oliAeiAgQ8RNbCN1CJ5sAJOqy85xCDj5JXPTIcCn7auWM0u3xW7l/DZCjHlMdWtV2bYsm//LKwI5Ld9F8D5P3WSwTt6TGIec5FOIH0xIDjFnOER0CWPRB9V/uxu3iQYgMgZhnXDRDxm7jY7/SIkki0EVBVClMYTeSGDKfYVJnbr3qcDY7tjYzLEACocXf8Pn/QsqK9pwFM7k4lzpDnUPHJ7HVTwRYHxzHIJsEDChvLw0i+UVfSoiMcCbx29ZaEdVVPgoWOw5EDjre667oc+maVZIUWZzaKLE/ze3JyEpc4YXSJHslFcGMXYit8MsFJsI+PV66dD01p1B08jN1S3p9eY/nk9zzf+jEpuUC25ODO7XNp0GoP2Uj/3ntc10bpwmAS5k1+zDDkusOq57/2XoO3QGkC495YnDWhDrEkSBArbO8jaUobkILLvh7CofLtOOk</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
    </text>
  </script>
</dir>