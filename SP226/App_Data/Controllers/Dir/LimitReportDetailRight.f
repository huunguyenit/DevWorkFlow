<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ReportDetailRight "
declare @user_yn tinyint, @user_name char(30), @user_lst varchar(4000), @i int, @c int
select @user_yn = user_yn, @user_name = rtrim(name) from userinfo2 where id = @user_id

if @user_yn = 1 begin
  exec FastBusiness$System$UpdateReportDetailLimits @user_name, @@appDatabaseName, @@sysDatabaseName
end
else begin
  select @user_lst = ltrim(rtrim(user_lst)) from userinfo2 where id = @user_id
  select @i = 0, @c = @@appDatabaseName.dbo.ff_GetWordCount(@user_lst)
  while @i &lt; @c begin
    set @i = @i + 1
    set @user_name = ltrim(rtrim(@@appDatabaseName.dbo.ff_GetWordNum(@user_lst, @i)))
    if @user_name &lt;&gt; '' begin
      exec FastBusiness$System$UpdateReportDetailLimits @user_name, @@appDatabaseName, @@sysDatabaseName
    end
  end
end
">
]>

<dir table="sysvaluelimitsdetail0" code="user_id" order="user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn chi tiết quyền truy cập cho các báo cáo" e="Limit Detail Access Right to Reports"></title>
  <fields>
    <field name="name" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment" key="@@admin = 1 and admin = 0" check="@@admin = 1 and admin = 0" information="name$userinfo2.comment%l"/>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" readOnly="true" allowContain="true">
      <items style="Numeric"></items>
    </field>

    <field name="comment" external="true" defaultValue="''" disabled="true" readOnly="true">
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>

    <field name="treeView" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 442px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 442px;&quot; &gt;&lt;/div&gt;"></footer>
    </field>
    <field name="flag" external="true" defaultValue="0" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="r1" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r2" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r3" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r4" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r5" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r6" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r7" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r8" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r9" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r10" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130, 0, 0, 0, 0"/>
      <item value="1101001: [name].Label, [name], [comment], [user_id]"/>
      <item value="100000: [comment].Description"/>
      <item value="10000011: [treeView].Description, [treeView], [flag]"/>
      <item value="1111111111: [r1], [r2], [r3], [r4], [r5], [r6], [r7], [r8], [r9], [r10]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/ckpAo0/H/URcTCmqyL6SELW2rrMvAvGar3RqvUzwXQkLEmS75PrZW5gYmlOkVIkT0BAagbOUlctCKmz7kQM8euR90xwKMn9acoHtJ/tfE0RTMHwg/W0nsIJI5IoZt++Q==</encrypted>]]>
      </text>
    </command>
    
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Dl+6eICMV1THtvwWPw6cOIo4A8qVqf5m6zFOAuiDoKOOontbgs3Nc82ReO7NTLK96DF++UEqP1AS9ynmgV3I1lryqG7007X6gu4UBJRSG0jSAJZBHfUrg1OUs3HNf25UFfJH9nfhyrphAju9qafw9qjVWYbP7rrsRnSw5/DNxG</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0FZB1lF0yv8suGdUO2QTVEPVGNqzh0x8C1rGV1kPwwsx1TgyJXL4K5aFVfYC1cm2dPiTJ9P+htSiYZwM6fP8Fo=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI2DZfPG6sRPqn6NK+08Y8+xAO1cH0H2vpGKmXj8G1LJ1yqU/mQJ11CSmuFXuuMzDVUqBN9Cgn5TavmwrI56t4ZNpmW0eaTWya/6U+omxRWL1SiRhAryJFZDFCmzgL0H9xvJNWxl4SuSd5DEKATm6uE5LWa7oUio27laT6vFoqa19Rfi/HlTh6qps6cOJOxQ9DQA8lTdmkP1/h7B6RtvTByGp91YF6yyMTqk9yk3J11GlZhqvC5NM/dGRWaeW01ri3BZY854X7xcfmv5r18rCKSISaZPcGeoxi5GzuupoGDvfqUSyjIiyf8m/tVLdCNbARdWriQWxw+VUV7K7RUaPOjxI3WNLwq1zhVghfvkwQEHSg7Whu5R7JYcF4T5LANbYi4K44sFtMPAsQrSq0hlmeBfZrXWW8jYYB9E8c25luSxM11nSfpthm+rAqnUCg9Q114EiPN3gi4uD5kBqq2VI+MXGLJcv427LHFFAIEl75BJYvmd55RKrbVqzahc62DJEN9Uz3Um716YFX+FIqoftsH8=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CtoQm01wAdVF0idhKMueuLxpqGtzqnHVEnSp4Gh35I3J4KQE5pAjQVQqcbg9IH1ArBHCXWRWuHVqTGD24+JQD8ip2bw4nNTWJ/JMFJK37WPD+GeSpV0ej9KKdZtuFNcYBV1tP1X8r7L862b04KUqtj</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzICb8lirkgVgqWf7jZcu7wdebN60iQp52KXK+fq4P1RmIQ3MHRh2p5dSFqqNXwt1KzLyvWTc0NS19csCTb1bMsNWfjhto6hZj5dwpzyc89juyBwmA2xhQZvUx/eYIcUEIK6U4d+feSAEfzEPhP49AScibQMi/gqovEbKtRSkm3wbXz8vgF70mDfB9cymPs73iV9QGf16PVwZ8n2t/ccSQWHWLPd1zZNNLUU1myRLMMGdw+6B3mpOUc6EkKUqVAf/BEi8eDVWe+vVabDY4/Pbh7yX3OWqTwc0AEffAQ39bGGlHSYH33SIt8S7/rKb9DrHLcLSds2W1x8MS/WYsSbGpGj5SRA0+4oBOQFSb94RDoMxFdMnDQXoZtOIgL1aTBMCyQx1JXYRLvHtu+r39keZGnd</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9R7HUUwtT0Tq5/bBTQeS/AS1E177SW3tctBf4LYuoZAkbBwpqOpzJKBVw5OHLQ5J70Cy6PJeHnoEFJfXYUPgR9OHIZMyRZL2x456r2PF8Xy50gp02rFEqLgQfSuUC1ODZSX9us83Ddalwbt8aCvtq+28x0qvpb0yGZuKUPnVr04A5kGYcvdl0ub2KArBeUmQwzA0q/kmolsaP/paZ5IDStB8BcglFAEmGRWD2JOrtjQDI9L/ZN1K484/wCiiM9Qnxs7lpdDyp4Kbofv+Kh6kJxqq8XAbBLwX9YIVpJ5LfW0+PduqAwWkt37tIGYqFSv21UV9VxZkEhFNy7WQR5G1WpboadXTIwYemTZC6JIKAhGHkbn2zbgYWPaniBLzmquVfvNwM2cSDzIx51vVs7vdEti4NP0QMKl/+z2r6+3IZWJ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzLTxnqykXhm3e42corDfSWzdp3OkzHhhrX9XpJW3ZTnfs0yzpLt9VpxElJ4VRNVEeH4gjIvccDnI3P+Z9QxOkUbkUPhvy/lANEjcHHVKfMrYCKSjtQuZQqSkPY6MzYGDPyKy0PUspnUfFIADBDVoKZ2E5WuixBBz8V2ul96Eq3vrvFlspZ1bJdBvPgWVLXbcnMKNYtHCeqSW2Dgb9KRK5e/LZiA5vzywc2ECko8o+aZzJJ7gLrnDMNMAd+HnJwc8BPQIQ661pDz9wEMcPZUKY7BPQ5T+yLdUyAWhIH1D75aP6E3fCLzFHWnLjhF173AZEZ+7aterKJLHp7SwJM/QTm+</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9R7HUUwtT0Tq5/bBTQeS/AS1E177SW3tctBf4LYuoZAkbBwpqOpzJKBVw5OHLQ5J70Cy6PJeHnoEFJfXYUPgR9OHIZMyRZL2x456r2PF8Xy50gp02rFEqLgQfSuUC1ODTct/Bmtm59sTMIwdxmMVeFhSBdOvhNhPOez44Y9wE8lUbrRqr2y31kLcOroMzRE06Un3zmCVvPXBqvJsoDETEDbCUMFRtctrGM1+RKadTypmu2IFxPhCoLseG5IeqdGwXe+MkHgNwgCAmQ+xv2rVuDbitUVY//NGQ31YOw1OY84cwlBbo7AJo1Wb61JYPTVwEvWwp26rE5XXPoJEionP1TdW+FMOxsuaG7YFEL0584qI4462UkfmTjnoyZuB5Pbd0knRhYwMEyCsfyCZpRLp4Q=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6T+0iBO17JCDnoXj7tGKbKTdrdTFnd+ES/TN7/BRKuDgU+3VreANzsw+uvKooLzbiNbm0S1AUvUVFoYkZ3CcDJs=</encrypted>]]>
        &ReportDetailRight;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BjHNtpeQ/hK+cDSgRPhUaZik8Tk83DWd5Slt/VLahUT1skNisTOrIj9LoZ+2ptgOg34r7E7FBk+aqZUKaAhgt0CxNRkQhWOyaQ2Z0tOzFAaZFGcRIJ/ySO0GCiVmDND0IBxPSwJ+hHxvoiIVaUzU5nJ0yTPWlx4ng84852fYmVKLPQtqSV6WkyAcGM8wQevPO6J1Pdr6CY9PZy2PwcKx6D2J0NxEzMkjLdZUHxbCCV2cUAa+9st/ZTE75eAX/yn4w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%j1otayK5ACecpldW/VwtPIgCkhddSeWykoo4dD3BetISsiquiuVRS+GdA+r3p9nMgXDwqfvTT3EYFd060SfME4PTBE8t4cDMsDi7FTpPHDsJer74I7NZvJxFkuhGIn1UgN7P9mzo6KOoRlGSCA2u4Pyq81yuy6mnVlZXZq0ESfQ/vQ1G4av8Bn1OEJOYL20h+NG2PXrnhaYtIB5iIjQuK8FbcONAmgrwzDa6hkZ+EnkN3fplh3fnX4laHAG4urlnd1l/GqpTxEuWh+FklsMAc2Ua7d1o/HKdCaR11L3YMByxEZZ2mJKI5b9E4a+2FhNbaswwqjroYNYrjH7yHsPOkuyDk6514u/7UjiajvH6BJFD7EOopYJpkI1CLF4U7743UqSiFNQq0W94ulEAJM1zQWnnZPu+2nz9e1zDis7h6yIfZkO8t0q0zqjjmjyDRo3BxdVEx7MlixoH0c9mSKXvMwyYs6w0stBCJLUuv1xfoL0/lxe/GWUUoKPFpzKS1XJ2hV5i2B0Tsrf/9mEAqLHT9k9pXxc9ZKxmrZfpsFTWVgOStN+rPRXCykJlUkLEAqx+0sKtdcNRhI5oem6EuB9K7+5WdGImDNgfOdkGPZGDJUGWLZUpJng7V417I3Kib5sWlL41HW1V4eAlQybwHASLTaVYg1NaeY/NvS5nETLSRkWFCa1x5ANuOm/MiWysj9khEpOFlh+4lFJS7A7sicflEXQ8Qs65g5qfFmMXv3nUv0pMCPg5s9End12XBETbA53ZnEVZymyfPHzN9OjSRKRM/Y8rsEbhN/hhRkhA0rr772RvosTAcfgxS3eWDapYYtYwAgKt7GV8QNs6HhzsaP4wEsi74sbNEmEn/NA7YMHyQhWzJEaGqbuR/GynprqvgSHNligPRlTguOqviLADBYMuuS6UugKkcuaVfeV32IrnF10=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIeH9UHoF7OLMnmqvjSq6gx37YttE2l2jVwXvh5fbCg6n</encrypted>]]>
    </text>
  </css>
</dir>