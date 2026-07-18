<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmcn" code="ma_cn" order="ma_cn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chuyên ngành" e="Education Major"></title>
  <fields>
    <field name="ma_cn" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chuyên ngành" e="Education Major"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cn" allowNulls="false">
      <header v="Tên chuyên ngành" e="Description"></header>
    </field>
    <field name="ten_cn2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330"/>
      <item value="1100: [ma_cn].Label, [ma_cn]"/>
      <item value="11000: [ten_cn].Label, [ten_cn]"/>
      <item value="11000: [ten_cn2].Label, [ten_cn2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdKjSym3hbsQc+F8uQJisyq+RuDueJchtMbq3vGmeQRyBxjcUkjC1fk/97rW+hKhBVACqVL3scosJZtBXxCjR2/</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxHqAY366rKGVNHlUEz4AR6XrPy4FXbmbkNzVlAJCsp0JmleohqIFAW370AOfsibeDksJSO2Q/8wzcLMezRqMlU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliIh+z35jtD1Gy3LfNY1IZSfpRV7zSmQz58wejutvTrIOAYs/APYYYaWEfraslwVF6vuHMCTBtuT02NTYOv6rH7p2DrFdFL1j7XFJKN5joG5tq6oqARwujZlfF2CBsDTSOhXbtCAQf2sAHIptpiB8ASamNyGZUQ7pHE8Ww1/ABJE+bBfkhUdbFiHRogVkrR55WXwgBGRZdBkCDe0NKCeonp2rpAkZXu+nz4we0+OCh0XFNT3jexZEd1iWcX0ivEnFOEKZsAA8z9u50cidTlz5xNXnASBOJPt9Tq7otCT+fV93bapM14D2QkxAkUIORCfp5sc/leFRi1Q5DMTeUPNM8rBhTO69VUHp+dJRv5RKm+Rc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nkGjfQwO6smgCqNmetu4OhzyYsFNbx50Ozw1ZgxF7Z6Ja7+hUimR+ON8xTvyHiytoPLmR1xH8f01uXuwyXYLiy43Ri9v7g65uC4N86eAKXHsCsFOcTnacik+nTINgCgywx9JjQ6StvPCptH3+x4pulYNq10nqUo9E1wrFneB+F0Awdf4dj9gzK/yR9VJsl0oM2We6OX6a2RQ3VYfqMiQSKiAE7cjd1b/17950Y0SxHow=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jTi/CoMh9gxrHnjw0Ggmd2wHN+x+VsOvuqYlJkCXQ4/VVTK6DRnnijYfDoe1DStGShjNpaeYBexv6znXP7Fp+JpRAg+4CoIPrrdz9aFLf5LMFDPxD52YCFsWwwK+f4Qt/t33OCmhXrCtlVEgD9o6IcIGxaXG5WYG2U/GJ17+pR10HN8i9qBpywuRmjmpHuwdFohEtfmgTp8mVJRqtxwm1d74sF6wxzJ/+nPlVl18ltucxeLvx1MAQIofOCxG0bFMT</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesjSucXcEdtDDRIqqRvSP/8hUxK+4368heSF3QBq617M</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkachn41WMX1MY00LLoHjgFIuc++hX0hHfQkOSrD5ooATc7OZMZYsenly84LaG/zpSpEJl/pXAh9AzabvsDdnLk8W7JZCc8PYtJCF/Z6nrR3k4RzVwew2hU7X5z27xVyDq97Nmhsu9yYzoHYpaWHaLPnNQihX/FaUPBYU/3OdIsqLEQYpnBbZwFSlkWaWbDzHGCuwc6dbpEd5O376LXuGumuYqj7BYGgs9wJe1LUSdVBioJDjIh/TpXwmq9CpoG8J16KljlQcKJiQrakxFGUD/MWatUIZN7gNMeIY05rZvPI84BhsFEr6PMQ2kvIrlmuvIX9gslv9nIpYUhDs2PDtTeF</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>