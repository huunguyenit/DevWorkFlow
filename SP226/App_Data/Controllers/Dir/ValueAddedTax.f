<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmthue" code="ma_thue" order="ma_thue" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thuế suất thuế GTGT" e="Value Added Tax"></title>
  <fields>
    <field name="ma_thue" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã thuế" e="Code"></header>
      <footer v="Tài khoản thuế GTGT:" e="VAT Account:"/>
      <items style="Mask"></items>
    </field>
    <field  name="ten_thue" allowNulls="false">
      <header v="Tên thuế" e="Description"></header>
    </field>
    <field name="ten_thue2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="nhom_thue">
      <header v="Nhóm thuế" e="Tax Group"/>
      <items style="AutoComplete" controller="TaxGroup" reference="ten_nh%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhthue.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="##0.00" clientDefault="0">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_co">
      <header v="Tài khoản thuế đầu ra" e="Output VAT Account"></header>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu ra&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Output&lt;/span&gt;"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tk_thue_no">
      <header v="Tài khoản thuế đầu ra được giảm" e="Output VAT Deduction Account"/>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu ra được giảm&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Output Deduction&lt;/span&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tk_thue_no3">
      <header v="Tài khoản thuế đầu vào" e="Input VAT Account"/>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu vào&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Input&lt;/span&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no3%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no3%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tk_thue_co3">
      <header v="Tài khoản thuế đầu vào được giảm" e="Input VAT Deduction Account"/>
      <footer v="&lt;span class=&quot;DoubleTab&quot;&gt;Đầu vào được giảm&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Input Deduction&lt;/span&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co3%l" key="loai_tk =1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co3%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="## ##0" clientDefault="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
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
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_thue].Label, [ma_thue]"/>
      <item value="1100: [ten_thue].Label, [ten_thue]"/>
      <item value="1100: [ten_thue2].Label, [ten_thue2]"/>
      <item value="1101: [nhom_thue].Label, [nhom_thue],  [ten_nh%l]"/>
      <item value="110-: [thue_suat].Label, [thue_suat]"/>
      <item value="1000: [thue_suat].Description"/>
      <item value="1---: [ma_thue].Description"/>
      <item value="1101: [tk_thue_co].Description, [tk_thue_co], [ten_tk_co%l]"/>
      <item value="1101: [tk_thue_no].Description, [tk_thue_no], [ten_tk_no%l]"/>
      <item value="1101: [tk_thue_no3].Description, [tk_thue_no3], [ten_tk_no3%l]"/>
      <item value="1101: [tk_thue_co3].Description, [tk_thue_co3], [ten_tk_co3%l]"/>
      <item value="1000: [stt].Description"/>
      <item value="110-: [stt].Label, [stt]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfck38pkWnUQFQda18luyY/SGFnCsfwp+AQ5Lh7VUWslfgUZ7Fst6uXa/Dxbnlq9Hf2vuskbDxTU/CvYNZsFHoB</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYLn9sETfHEH1s5RAD+poVWeg13AemjSo9mBQpgdMwpzEjlZICmwSQ5ZGWZ1C8hUr6M=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26Qcmk44mnGd6DIoYZsFQUTYARHMlWBmD03N4/Aq1iqkRMbr6UwOjY9EwzN1dntgi+BnoCH3dIobvPl52eEofXfVHgXsUA1dDUocPJSnEOQTd2WSg7qtiPN618iVIdcwVhDJNCQQvRGCUpZvk3Prck6YmupQrXOk6Vvh+blM0z8rdRkt5dj2KRwhRCtSWpq67EPU0rtHsNELE9uUJIEC3POTcUoSd/Q//wbIu8xNrTOYuKHB/klTMgKQmEkWA2b6umZcizL/Zt0NwOzR01l61ucaegkgDqcQjhHW9x/2an5cM5BeOu1LZCiojJ3HcooKk+sjW6ZlDcQluVEjNqhi1tTU9VuHB/1f0Q/XIeHPuxEvhrUH/LomA3FUaU4m7vhiE6p+gwhF2vw14iUH5uBGJe8NDU=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nDLbUN3Mpdm0mffFQ/WSEHnJfUaFBz1g9esxz6hj+J4ywivQOnH7ZKrAZ15AELUZV5d+3HB2eUOhnDLpY8yR17/HSspbkQnpSIkht07HD7qg7+UfDNcYXgMlFsnqJc/xyffYJdrUesMR9s+TJ1jMvVzlL7Mv+DqOHytk57RyVnnrrC3q6I6E6o53UXNBz4lMQdQSQhy3XIxPj3T8+o6wpRpZrjodFidFO3E76fUMpQJo=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jiBJ4HSxTxgjkBChEGiWd0ODrqlXf7pZayB/KIlCwgZtcQFLCdhTd/xyPQNWWQmeHFdMrY4+Cyy6J7tkosiqCMatsaWiazvtiF2ahi6d7+ECIzZ8L7c0tyUZ/4juWfiXUckRTCV7S+yt2s06+OrIHXwCfa0WtK68JvHwAbDpWkCs0nc/Dg/GbPU/gv6QQvCVeumWbIM5k3CSfnmZ4eS91TA+5nWiiFqouOHE4VvXs1qU=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KkNaneva/l4OG+bRv0oPBxwTb9iSU3Lb4fsohMZIFmAQEl5hSxYf8WsJ3yWjmYb0kdo59jdanLimdQcUEW+nE6wag8nYIjaluU18Oen0/8pb</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbTzhK6sTTI6hpD6+QPQT0qcx0gYKE4TeF6VXLpjUq1GGAMQqEI+uw2dSJDEL0w9Wcd9OETfjxXka3a5tyeW1rV0bHql8CEtbi4I5aC1DJ1Kah4kltszUvDvv0jG3UJ5xeXTY2JX0iHy5olcY6lcVQROWyRhvb0ePIeZKv6jjKr7yUNuh3pRgNgMweUucbjKuxlu6OrTux+YjEZCsSgw7kS/q2zkqRKNnAVMzZlurNoHKkFGrdMq2LOdafPk/QJS/eRh8mp9ex8ehK+aRApJ21fITkyyHRvVVHMICilTrWwo6KOuOTYK7G2f6ymUhIIkbIFG690CBa9tJYSx68NtxFe</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8Lx/v62N8rhzgfdk32mYEa8ddnKFVXSfHj5cWtIbTj6UM9ZS0xLWE4L3UWM8tSGRlM=</encrypted>]]>
    </text>
  </css>
</dir>