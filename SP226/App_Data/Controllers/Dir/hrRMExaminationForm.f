<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
]>

<dir table="hrrmhttt" code="ma_ht" order="ma_ht" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hình thức thi tuyển" e="Examination Form"></title>
  <fields>
    <field name="ma_ht" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã hình thức" e="Form Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ht" allowNulls="false">
      <header v="Tên hình thức" e="Form Name"></header>
    </field>
    <field name="ten_ht2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_vtr" allowNulls="false">
      <header v="Vị trí tuyển dụng" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="hrrmhtttct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="259" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrRMExaminationFormDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ht, ma_ht" e="String: ma_ht, ma_ht"></text>
        </item>
      </items>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="319" anchor="4" split="6">
      <item value="100, 40, 60, 100, 137, 100, 8, 58, 50, 100"/>
      <item value="110: [ma_ht].Label, [ma_ht]"/>
      <item value="110000: [ten_ht].Label, [ten_ht]"/>
      <item value="110000: [ten_ht2].Label, [ten_ht2]"/>
      <item value="1101000: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110000---1: [ghi_chu].Label, [ghi_chu], [cookie]"/>
      <item value="1: [hrrmhtttct]"/>

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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9uObV7QOkBsfen+WZqTe4JbAfacaPeDJeBxjh8JJho40JPzDFt4ewUwhCv13OzXjGF3F0ndobr8rYBxOKLCZQa05vs53VfmxE4OWwkBdmPt</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8ixlcF62tgbs5XeUdjYRDCfKgYb8pIL1NQ2cRuDNxsitVCF2ydom4Whxvy9f8oPIJduObjJOW1qcsQR5x9ZVmrLJ</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli49Ms/QnsuP3AUNEfa+4WpuvBZj2v07sEwkuHtKuiTgkArlZoT8qLhgceTQZBBVBZLafWAEYMMheozW5LebbCfE7HnpbPzqSyHi2qMjMb7018ueIcqzvuoMSaPpYoGyYq6P7N4492S+fUmNVLTrYOWjFS2MQ6xw73mz5WPEL2XWpBBqVmGfz48T/H0+BP8xa6Vlqnml7QrAkbVOgLXvsmN8iRu8mNY452AhrKVthiiR0iA6W2+e+15kvFQEy5yAaeTlp7K+j9qes62AaV/k/cX6goH8VbIo/X6HqRtpm9Uo0S7+ZzTdWMf1XoY9PP0Sl44mdm0Zb179WZLDO0m3KThA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Ry5VjAbgrbSh0bI6OR5iYF+p1ja4cSLW2hWTC2v4thTIk1Vr41yfdD4O2grma5NCDgIbiAgi4lFU3CAVYE9oVPkFlkE00MWLjT76FE+FaYgpsMUjiZi1fcuU/kcMWk//jcSiVaVaX/etyszOfIntGJYatpff5E6oSibj9kYVEhq</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n+fxJWCgpNyjf1u7OFwkTuPUpB7fI6QusssVH5pUHqaTrc9f/Vl0vX3OcF9dCq/KyzhhXGY+DHmJ4zHMAE7NHO5ym7BZNpKhwPdOs9bHn2Z++TegGU7VY+Ds7ZDdl31wx1uE4mmH4JKVK5sOBO9QpZopFWRqQdS1++ajI6cz4ca//pGMwmnYbgHFgho67vYzGQOUi7mZDZfBY4leXXiuUa6BJfUxNkVKkHjZi9TAscjhRRY+xUTTa7XKaX87NkyUW</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3ErYVr5VMzq/QBwxwCP7k+7CPobD9KES3Sz8QgiREiHAkGteWTNpW+96J7GpYfi8w==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j5Z0pQFrteB0utOI+9SKFAVNYI3gJEEEalS0ZnARrd/dtSff89ALeackUa6ykmGTDlSBhb7BdY8m7k89At3r8RRdePD6R3iZdht+MK8Dhua51FC+R9neXSquCqRqE428Xsu+jR2D9Zl5+f/U0zrD8GvNJGUlRSskMaKWu+u/sj4ufPfD87NZcja5KelO26v7hPCy5wIMTQrWFGx16L+vtSQz4k0OTIzldcHsqfukuu3JQ3S7RQ1ZCG5czU1KL6bQVuSnP0QsxYdGvfHgDMBkaEy/ScNM5YeZVQxPz6m+wkusUjFKBl3UH+fT65McwQI4/movO7PzjPjjHdsyXnLqHWg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0/5yKSte8Y240qZ4IPjkiru3niNiIlDF5kTyv/v9Xug0Ug7Q4tWPFyErxDYlkAR3gCYNpVPEcWqMex/riK00rXhgTNS5mubAthkqfnOphi6w43J8MYPjiaVZ8xmViRo0znY+6K7CG69P+dtAGMMIQfgj06EzOO0ViQlyJxf2jslcdn5OV0Z9wphThWIhgIz2LVR/TKfYNmvLAX9Y+cuBbxCGwBukIvo8r3OJdEuDjwS</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Qbuw/sSC9z74G36qVtm/lEkVireT7QTIgBRbD5OZ6Dw6HWM3tr3kwJvKwpY55/IQQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AA3iCi7EttkGUwhCoLy6OzTXXBPs90cIllhChCguNh2F09laRpQfhLjbOJ1wgwQbkIbC8e11tSWElshj5ici9hmutvluZbz1gr8gB15cq4UxquEXrY+4iIi0/3hTOik5oxXy1FkyZUwKVIZTu/FyKJu4ptkwwSsV2RQLW+DHsmOdeaLRY0fd/xh8AZRgXJ69cJS2yZlhENVi2+bpZ5AH7wN/wrzwknSVfuOehRUWv6J5kMKyFNrROpkjUu3AxlEUNNBzqeJJWNUkigpVJzNKSdxWlPqSqvGSPtFh3uZvKVvAGDfizvrctCWIuFV4QtW4AtVQ6HPmhjEYTv1tiDlVlgMKicFSwwxJVFW7tqCGS7yNcK0kmA92F5ET3f2fRTHHMPzZ/+BNqPnsWVdmKs4jKpffSg98gCBIZV0ewF12Ne2oMpibw/plz2Y1EXXEFPfsfQC/GrROyhdCWjIrgMjiwmEww+8EP6nTWALKsCnX51UX8zRYQO+RcWP7qv8PCNd9ZSbVjW8K12Li25no8fXLysbkLUqiThz8ueBG9cseX4ZSHyseyIGl6JxEpfcebJl+w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gVLVUddU+TocPCdIctKSNoBSjDGRAGBiNX/C/MdiZlVoxaG7tx1NJI0wEvhSkk80lBHkciigqX5wY60XTTwm5e2jhorPmBqQjPwLOdvWdtjkbHvUYRvngwCBibOhxTRFnhpq7Sd/EEIuVISFwEvssEl7gZtzxCmUFPN2k+uky9HiC0G0CeBHuUd/FqUsBGGISuAQ7LEr7QOzQikzkk31V93uCSrzadZDRiJsYcFhkZCFzexLHdV2UPHYYud5v82OAoXMNMByDNTH2ZbV5W6ZkkiZDVMLq/KVp13DCqM2DDu8j+ygbD8dTHedvwfOO2HRRDe2rmB579EddS4uXF2Ff07a0dMUnAMgHjEBLpe0AxBGUk6fvyEmIR9+JnAeHShiGLriCMI5tOkqDuK+oBNiNFpZDIYJPAGqwf2URdNylzFOCLTBNoFEV7IegngnzPtYoPiGb+vT4oJ4/GbKNBhH9SHE2Yzt3XdxhFWnRjQ518vNKe8Ldk7pju7t1KT1ZIc+/o=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>