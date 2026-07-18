<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
]>

<dir table="hrkbctdg" code="stt_rec" order="stt_rec" id="HCT" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu đánh giá" e="Appraisal Criteria"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nv" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXsVdq/Uc1Bi5sfDD+Mevy2DpDdmFLhzB4H+b9Lf3CoaeeENvIJYEZRQjSup/JNmxA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" inactivate="true" external="true" defaultValue="''">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr%l" inactivate="true" external="true" defaultValue="''">
      <header v="Vị trí" e="Position"></header>
    </field>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="Default" allowContain="true">
      <header v="Hiệu lực từ kỳ" e="Effective from Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" clientDefault="Default" allowContain="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="dct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="283" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrAMCriteriaDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="343" split="7" anchor="4">
      <item value="120, 50, 50, 100, 100, 117, 8, 58, 42, 8, 100"/>
      <item value="110100-100111: [ma_nv].Label, [ma_nv], [ten_nv], [ky].Label, [ky], [stt_rec], [stt_rec_nv]"/>
      <item value="110000-1001-1: [ten_bp%l].Label, [ten_bp%l], [nam].Label, [nam], [cookie]"/>
      <item value="110000: [ten_vtr%l].Label, [ten_vtr%l]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>

      <item value="1: [dct]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyWzqgNTJhH/yi8aBqTa/wojOy0em95NjSRkN1r6mhW2cqYx+yxEKDSW0lR/J2tCwde9ZblIB4mx8LFXn8Snvhs=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3l5HBUXWJ0+7ltAdYVlz310opVaS6uqG1f5IPjj5heW3RZq+IBH32GuWW0r2xd8iVPoNc1VaxlyxZuPOVjQa4I=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf75jiJqIQTrjZlnq9kvx3y8Y58r8y795pHnmevTvFnDkz7bIPULH9CHnJsQd/AdV+rqOBOz3fwHvp2WRA8YY0aA=</encrypted>]]>
      </text>
    </command>

    <command event="Copying">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6AV2m8bLVesUEa17mg8ne8lwrJP2uj/JOHbwiF8b9aZlFZiu4xyD0BqnFy2mDEUtURDyl0sA7Rgb2mNJol2flcFSbmRkI0SLIykba9sSumt</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliJkpm35LrOBt/TFJJrNk107WxLCtk8WORxEsZ3pw7WxeMQ9cP7mtdtxP0Lw+Vpvs2clJZwSx/Afwusb9nlzFNkVKIoPleKfxk5v1Sn6AhCnQpVygf3FNiQH5PPUc8ar28alfzFrb6pnHGcyi9p3slRxcI94aK90aYZge07BpMZj6o9D+X8h8rqkBdFoada8qC8qvQ0okRz4x+lfSmksZ0ovQMythr1qap4uWST5peujNm/EN+sQqbG4VF6YA8tLHVfdhpbh0QXAXT3FaXTKvRZw==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6chHApv4+cQaQPDMpTEJ9u+ZxLknk0rr3WD/6ig6BGCOBICVwWFTGB/cSJ9rDxUKhR5Ze7+GdrTb803QdJpPnLKzPgb5oXq+8Asw5U1FSzofWVUYmVOPlrJudyJHr9Etj5OXoXvqI7+tJtRjixjVi2oZgrfcPZH2Wnoj07NpFFQh4Xos4zgIYuuum61xXPKIFgD7K1cLQlBY40i/PNwKZkzQ3i9OrfuG8xznlXBIBmr3dqZxNaSNVh37kZwiAotoOm3yCZXVRubzvwfZlmvcFJmprIgLJO04eqgFZmFKgRCV6WEpIeSCaRryjRpZ7QTpjw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82na4MSkFNDZZNhDT3Y97+mdFUUutgj0hUd5rYN/FaCrI7R7k249ukKg3777H5SpEuC9vdIIjhcni0/W6qzik0C07seb3OS1D74jV7H3cBIPg6MKpmcTTgu/OhboqB4i6f/42AQTRH68mKRsO/ASU2ltMugnV9ZdxivWMCojumJFFMusrpa0GhXz5nvVj5Nl6FpnbZeYfwH+XVVafXj7W2/xHygSp86laD2VUuz31XN/M8oSeHQCRJSuEYNS+rZh2up</encrypted>]]>
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cB8gKSxzG8N7TBzeY3QBMJT3A+KIN0M8GklkGoLR4JSsi2mLmq+jeW4hAm7f4ZyQw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3B89siYChRHkwiBbaaecCPKE+WYEb/A+42yrVdM/tFjjFc26rVAKjdbH3++fV2+QqIy+kNk3qwEF1ZRSAc2YiQ6zDnEVsVa4E3THCuHNJrJ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6QbnWHlGm0+SzBiKGtnSvMPjqN6u7M8apFFDtaQMgMZ3g08Bl7v9p/6pJATOrIJ0bW6KzEtqzemc9OaL9MT2ryPWHlXcFQ/3t4a0iodwgogRCO0TAvH5kgXgastytIsRx9bcoUZX+N9imE3sLPFoZJbwaYTXRyX4A8vScqIxZYE8FPR6jk2cv6eLc4FgsR6i7xOqWb5XSPLYyF+YLjDp5HvggXsXk2R+nhyAEWXrryd10021mmJP5lBaSKJDKCvSNyEzK0MF4V4w8FGH30QQ4ka/grr8gsf15UoEp7gjp2+0CYn1m25wMGbwCBw61o1uKTWo0bldEClsCUJjOj0O0UkeFHE/xTw2bgpbRXYwy4O7xdnVIfEvBFfL6+3Hc4OB21NjaeQpFjrf5wfb8tAfgdWPawvO/Ut72BIKGACAA4jwbfzHnEsBBLgZl75rDPY3oQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0N5aZs6Z77QBtiRM+bPmlVQVmr8Z6qtTUcX6EluyrhQNFYJum9ZEx/K5zidyEBjGfvLZH84f9BeIcww6ijnOxME9dcv/yMt0RVMFME99MCwYjZ/2ZwJZWiO/C3TrVS80GB7VzMpKG9nahaRcsw46SJh1+krATqyJs+htxfkLnxkH4qOHZt35of9dNOw7RE72g==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TDHrXpwMnD2eNp7ICY3/HHBCukr+JiPhKqRwgeO9PpnapKRRayPUjsuvE1zPXlZgQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JwrFIjALGeRBeUCbJGJFfOEVHdHFQOO56YxyYlqfWPDYVw+eFK25kVaixc8W9L7IkY7F5vbi7pdIrfeq2pYA4mxeP921dKpBclyhbvTwLrHZ1o4e51cSlkA3D5oVakFplnUP0cJzrKB9jSMLh/xVsYhqaZGKq3iBnqY8H057RNg3BEd7fBxgVCb9cXmtcr3+cHkZYp6vmTp88SCWrZSRKomzHmm8tdjOZefV33PIYp21s3s634LlC2zGXNBCvJIJbYehT3VNr95kvszB2THfOv+FJbdF5ZTD2x9mq3AvekhKHRf2yHJOsG5bThVhrYDKkagdfyXAXged856cVoANHQvZ+JmBt3yk30M1YhERXPWsbD4pKQ5MJfV9Lrctl1mq+bgsTIDPGQ35KNrImlY6mqI+eBSYGLASo10bPOFrlehxqWbpsf6N3OfnBUStNWEuowk9RYh6OtB9VxBM8NjJrIFcbUwkJXFrRB68lFCw1eS31a8iKwNf9MZXSqciVsEZr5Tm5WLQnHO0+7U45VaSH8caVwZA4AiWQJ03F/wL7COBMlYuUheWPKlrlZ7SzGtBGIgEAKa/m2LdRD8B9B7MFjc/xbv3TihOGDflJqEiSCT4L+Xp1KQHtgEXI5H4zEF/6BhlzXgQFqUAECh6GQZgbo+Adav+l09+6WpegXnwyDZ+/n+Oqo5kYuzf36A4anjTj1zqHtQwmlmHrY8ooGR8WLCixTToQR9WIBaEmYwhRMk</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Employee">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNeXYSF2q8rqJxneixwRgKY6MMUkJ+PohH37kWBSDFe1m9SFpW/gZsrr5q7sjsXdyBlwWgH8ZmQY7N6vDkfzk5G39EWIjTziGqF4Py+R+1nBqz15xiPi5xI7GFDzupao1nHAksn3JrctnJC6A0O//q+4pLhPWxz9IvbzxOqJ8SUky</encrypted>]]>
      </text>
    </action>
  </response>
</dir>