<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="tdmtn" code="ma_tn" order="ma_tn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu thu nhập/giảm trừ" e="Income/Deduction"></title>
  <fields>
    <field name="ma_tn" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_tn" allowNulls="false">
      <header v="Tên chỉ tiêu" e="Article Name"></header>
    </field>
    <field name="ten_tn2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_tn" allowNulls="false">
      <header v="Loại thu nhập" e="Income Type"/>
      <items style="AutoComplete" controller="IncomeType" key="status='1'" check="1=1" reference="ten_loai%l" information="ma_loai$tdmloaitn.ten_loai%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUwAoWNq2jHpUOpp2GFJG3VMb4hILGpS38gLyGwashc0RRIySTu/kg1cFnP07RTbOA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="kieu_thue" external="true" defaultValue="1" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="loai" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Tính chất" e="Type"></header>
      <footer v="1 - Thu nhập, 2 - Giảm trừ" e="1 - Income, 0 - Deduction"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZc3yqadYDFVo7gZ9rFCBzxkJ32pxOaiZraha5zMOlUovqA7MbKXN5W3y+379ImyYYA==</encrypted>]]></clientScript>
    </field>
    <field name="nguong_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0">
      <header v="Ngưỡng chịu thuế" e="Tax Threshold"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguong_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" defaultValue="0">
      <header v="Ngưỡng chịu thuế nt" e="FC Tax Threshold"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_thue_tp" filterSource="Optional">
      <header v="Mã thuế" e="Tax Code"/>
      <items style="AutoComplete" controller="CompleteTariff" key="status='1'" check="1=1" reference="ten_thue%l" information="ma_thue$tdmthuetp.ten_thue%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfsYCR8M2K1Qx8uWI5axQCw23nCG7N0/DbjWe1fobb0Y0LO/Hm69p6sF51mgyyfGoQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" defaultValue="0" disabled="true" external="true">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="##0" clientDefault="Default" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="232">
      <item value="120, 30, 20, 50, 100, 100, 130"/>
      <item value="1100--1: [ma_tn].Label, [ma_tn], [kieu_thue]"/>
      <item value="1100000: [ten_tn].Label, [ten_tn]"/>
      <item value="1100000: [ten_tn2].Label, [ten_tn2]"/>
      <item value="1100100: [loai_tn].Label, [loai_tn], [ten_loai%l]"/>
      <item value="1110000: [loai].Label, [loai], [loai].Description"/>
      <item value="1100: [nguong_thue].Label, [nguong_thue]"/>
      <item value="1100: [nguong_thue_nt].Label, [nguong_thue_nt]"/>
      <item value="1100100: [ma_thue_tp].Label, [ma_thue_tp], [ten_thue%l]"/>
      <item value="1100: [thue_suat].Label, [thue_suat]"/>
      <item value="11: [stt].Label, [stt]"/>
      <item value="1100000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwenIPWu3TS8+jE6SFQmUoFf+1ovvLc2XbBc0yH9KigbC7+E4pZmSDBLepPyGvcX6tI=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyKnXBmEw6DYKI2ILG6IQpAzb/BaCy/3nyjawcqU9J2g10aJcorDpGSEHeEzPkYsCgO6Rv+138hFGr2/I7Kn510=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN27/+iP0N85aCEXx7c/MrgnuIYTOYENNf+P486mKwHK3T4Vy13UhfCUhveTD35b9HE=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3qxCbUW6WhnYSQQIMPI8mhW5/TzthQAWywsBBNbpjNPITKt4zCE9ayMtl33c4nfYOZYQFSev/V3qS0toBkd6QmxSjqg0tDnrAK5c46tchddSzS141WhMcdtfTe6Gh2JKthj/E5XvUV7uMqK0iy1ZNdmaJ+nDayy+/LIvJu2Fu9eOvy4aFk+UkfW2wi5vr5C9YVoXp1/oD6RqLq2dDzeTRp9/aVrjgtjWe+a2Pmpz5hs8mbKg4XtPItMA3/SqqkO5jFm2cXNzQcqDqCh23ho1rJQrm4CYjeoIfaD5WKrcqff5LO8t/4fJe2EBq0v5UPjT7nwI3EtmkhZG4VTDD5yHM9W7u9O6jRAv+XaKeFeKDS8UgnBQvDyNrglZp9N6vzwpk/oDaSnic8IXrIOng6sFkm5YSqHjf2Jg4ZhDP/QG/H+B9rubN/Rtk82EU9zwpDS6VQ=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6f77Uro9urTGsJf5THIq2oj6d+uzYhDpkY4fcDNoBhcmg5WQTY/7SLZaya9CFE0urCa/fpXgeXToCIDkqO/D+bdmm8La5GCsijKXx/egYcjTezj2rA2tS40Yjy4CoEdoneRR6wEO4ox8JUHowRvnVZg+waBwykEV2Bfbwyd+X8R5m2BVoUgvFo73tcTS/0qSbL+YgFBSMd5AuiZGgFAIEKXImOIOSvfaOGw/KJBN/+3F4z4b4dIk1b1V4vttqEPM/5bhkJCuPW1akZRTtK7FIFc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nv6WZAxKbd+/Zbl3xQc/mmJIu0Yk9LN3h7420BJPYTdvk+XKCShOPftvmBTGjrlIeI+XUQZn4mahSxpP2e1puJV3yOykq0CJOD6uOPIvaj46ETum1pPdlqzGrUEH0679bnMfNjKcI4SCpyO3kGOYJgUT7Db5adccYvqjeL145qsW7pDS53jvrYdXgINUyIto03sMa1hyIfAu8fU5ak+XRtA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jX7R5sMuLc8bH2RaqWbbU3TGq8nwskhRSq6ZGXxHnP7RZ6LkfKZtnWIte+LO/g045rmIrIT33TWpS3bRlkoo7D1WDJwuFZiqCEGuqxXtsHiEUfqn2b5z9xlOqlMZyh70KXIP73FDrgUtsatH0pid2TfjHL4MWHnmBBz4HsT0wJTE8U/3dX3I2t7lDfiZAcpciSkmV4iVBTWon14j7uVLcp5AsWBLF7Mq3cjpjY9/6PgMuvG32w5Q2nBqWKbhL2N77</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeq8ISijILhioiUY7K5VIBm8njkzSPcWYsP8nlZMJ+sXe</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkb9tn7au/vMRVTxb0yK69fbFipXr7rGCnVPV3+ZBxulkNl4wIwlDzjJpWTAckGkO6Fxo48FWaG3yHTPHt/wc4X7Pae+TDK6SZdic0EX2LpmmIIPiJ2XTQ3Auc7p2ZpmdPAbfOkDB9mLvnYvUriZFtKe2W+ayUohk8aQS7hLgc+FO0sNKhXUFIw6xCG0a3V3zdtGtBSkwNzTKOFJLUumayLdRLmFJlmeyoD4ojQAeSczT+5Vfj6qeCKFwjt84Gn+8nl3DL+2wmPeXQfjQIBd/XlZysLUiz/L5RKrbphlYAnW6v3gUVSkt5HzEcLzYPRNGsRh7OCDL8Zk0V3F6oFVjT6lWIx1xK4xx9BVTkXrUVySnD5pfBg6M0lLj3jBqXfWlK3Dw/oxoZMkjManG13r0B5XM+zQh7Uo0geZdtrXBlOKVInCOOcs9rHmjZjg8XuWrFpPcn4fBidqWPhWdX2YI6JiK1N15FY/DpNDsFdUomCKRKQkQgE9po+dcrdZWrY8L+I3wYlzinp05FdBVlw6IVbjYonU1x/GtgUYPJVwuBLnsi6fp5M+sxXIBzxhEJ4x86+2NnQt1fpQRGrEGHBcD/F9le/LNcjsl/o5zMtQ5ly+XG+1YEU80K9RPqB80Rkjy8uTUQoOHXY7/nXcgGekWvWaEbOdUGWNNthvuTGWRKTTQ2JUWicHJO5y4OkPQaSZEvIJcvUHLKGJ7a2pV0lhW6dAQlhTX9hqgG0ncA2sQjIwCPeeLYklyKe9nhZnEe9oqAcG/qISfQHcj3MoPEfHaCUnCYDAz3vC/1KXRvwxqFcZW3BZ2LTq25Ah2eGTiEVJ9ancIjAatmCWDYAW1QLGSMMOU8sVkIj7trZTCRAaNpJrboLcqQ/GPGxJvJwg32URycjoH9FvxGV8Pk1SsmXSxArkMOra/jn0zLBXo08ugY+uRKYaVhx2ALO7dyEi3z7g5F49cKgBaYDyFhnA0QXlVQriHyS3Mpa12WLQHtTetmDTpq+XzFm/X/yj76SU2I06SBZtnxt9RjG+mRdAIZXI4b/e5NPv2tValtkT51W4GT+L3zRf68Crfsio0hciI1h8y6Mg1le5TkeM9I1+T9dXxudf</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="IncomeType">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1qXZ2AXdTN+/Bb9mZVeFC2rDSTnb1cJ/CL6NM/EJ1eUl7eQWoaSWI0x5Qt3qPngnS9JYkJW6EsZ5eMyzehAQtH2infwAkCZh4MER3GCbVKh7drEW7AAsD6swisR1JF9eA==</encrypted>]]>
      </text>
    </action>

    <action id="TaxCode">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1qXZ2AXdTN+/Bb9mZVeFC3LHiWKJx4QJPCAZO2XGTv/Gid3OpUWviWyVdhrE7atxI1t3b4LAnVsDgF10uKsx2mtNgGWtyU/urwwVFwKKuIqL1/tOFyJ52lv9jbzyGgmFA==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>