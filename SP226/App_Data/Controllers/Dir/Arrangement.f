<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Controller "Arrangement">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir table="arrangementcolumns" code="id, controller" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin" e="Information"></title>
  <fields>
    <field name="id" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="controller" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="header%l" external="true" defaultValue="''">
      <header v="Tên hiển thị" e="Field Name"></header>
    </field>
    <field name="tt_sx" external="true" defaultValue="''" inactivate="true">
      <header v="Thứ tự sắp xếp" e="Order"></header>
    </field>
    <field name="order_type">
      <header v="Loại sắp xếp" e="Range Type"></header>
      <items style="DropDownList">
        <item value="%a">
          <text v="Đặt sau" e="After"/>
        </item>
        <item value="%b">
          <text v="Đặt trước" e="Before"/>
        </item>
        <item value="%l0">
          <text v="Đặt cuối" e="Last"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS9TcZdv4MVV1zEH3weajDcnloRvzgosICsngJfzUuMF</encrypted>]]>&Controller;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMqk4SJHB9Ddb4/cOQuGbafJpg4u03J9xnWJ2kGD/OYr</encrypted>]]></clientScript>
    </field>
    <field name="order_id">
      <header v="Theo trường" e="By Field"></header>
      <items style="AutoComplete" controller="ListColumns" reference="order_field_name%l" key="status = '1' and field_name &lt;&gt; '{$%c[field]}' and controller = '{$%c[controller]}'&Operation.And;&FieldsFilter;" check="field_name &lt;&gt; '{$%c[field]}' and controller = '{$%c[controller]}'&Operation.And;&FieldsFilter;" information="id$freelistcolumns.header%l"/>
    </field>
    <field name="order_field_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" type="Boolean">
      <header v="Áp dụng" e="Apply"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="field" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="order_type_name%l" external="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="id_type" hidden="true" external="true" defaultValue="''" allowContain="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="20, 100, 20, 10, 70, 20, 190, 120, 0, 0"/>
      <item value="1010000001: [header%l].Label, [header%l], [field]"/>
      <item value="10------11: [tt_sx].Label, [id], [controller]"/>
      <item value="-11000000-: [order_type].Label, [order_type]"/>
      <item value="-1100100--: [order_id].Label, [order_id], [order_field_name%l]"/>

      <item value="1010----1: [status].Label, [status], [order_type_name%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4PuVsx8HPOHN9j1LElx/HzBMF52oDifsO9zk9U9uLH3</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTHwlh4q8Mn1z/7zPV5ZiNd3am9YWk4aPKB4sF8D+aDZLWtVegdidJKC7eLYsiSEPHA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%mQBbBFgTfEt0ocg19IHrQSPMmFbKKhjjR+3xG0BsTFh+Q3y3tYPJGbNXxzHRI/KxCZw5/yBNPlvnqyMmRBLvEatiOCBTRJvZBoXV8sxi9yMbdroRUUKaRXwXQcC4aRGGNC4NyREgzaZ+jfJZBMIpGnDI5e8DUIDbw4pfUL5JpzStFks6YmN62t0wkDQGpDVAPft307TxOKW3TyczYo00f5elPbTS35CZ7mMhG8GNyjeFraf7PdX3UTEzBQyJ5o1T5o7dXlWxAnH9XZriHF+iYf3OG9cIs9wWjyPm+/Ee1FemG9VKof2zeUoS/pGGTQO5qCKTFKfYk+qynkR4wsEZVw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a3daV0RtpOLbUhyZYikZlL/gJKxYcfvOCHkSxAoX/2r2dgh3g/gjQOfDwH01k8l2shNHBulJ2dJy/L920X2Eu832woJRlss6FVjIH9WsfcJREfPYYO5H5yUMgdWRNDZD1ViH/zkRhwu0kD1wMDyJ7AP+qxbyEhxlltpIqnE4VQUmljLjvKdaJ8oN8l36dqS4qhSkkf8K/ml7LilNxPu96Gq6TTcJUAEJpRoid2AsCFpgvFfV0MlPCgoM/CrEJmLkqFXs/4w6RRH8i1ADghqdKigpGXs4QoaxGx4Ja7G3PMs</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTByQV77Egwygy2A8uAidlLzTZlrX+G1AAgpjyURXeaTGG9239tBuanvjuWf9QkHLbAEvwk8wHqVA9U6rHtmLsEdoBWrbO2++W+iQHWHK2RPnEIJYQk5k7vbTu8ehtqSiNFa9eeDqyVh0Dwe3jFHYsjGjBbFn3StwMfn0aVxMOwRMFvDS3T/GwE0BB4cChTcrUw==</encrypted>]]>&Controller;<![CDATA[<encrypted>%Y8bwSGtG6E0BmTuAlFte745kdLuhf4KucO9tKCXit1700sFC1PihjQ2IkZfpinY0VvfyYEyGu14PHshjpC/ThyhXUuuBFIoQuger0k4wlIXpXx3Hnp5cqJ8K17qjzHU6</encrypted>]]>&Controller;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfE0VI1rFwfy7GSeBj2BWsCNZqMvEGXTdxBPZJLrNOs8jqvU9FgNM7DnIGzCNIsHJJSP0UZcw9n0QIP4k8/NeQDk=</encrypted>]]>&Controller;<![CDATA[<encrypted>%Y8bwSGtG6E0BmTuAlFte745kdLuhf4KucO9tKCXit1700sFC1PihjQ2IkZfpinY0NcmBFTaDArrKH5NNasa7USpLzIGLcGmFJ0J7WjrLwh8w76h7rsHjajA0ztxHWsf5b896PRt3tfRoJ9BUZEZTAbSmsjSBE8/fOjEZqXJ4Xw4mI/UDkbf7opOOBNpH+xD4f0DCELhernhYYD3d+Djt1stkcXgLLHH1dfKCPTvX5Xk=</encrypted>]]>&Controller;<![CDATA[<encrypted>%Y8bwSGtG6E0BmTuAlFte72qgAnefedDM635TRBYudMb+3ZVReNu9gJ2bWeHG3zbIj97AIudMq66H5CN4lShCSYdqrwKwFPb3De1tDSBi3Czm2Oh+Mynwx/uR4fL6VLSQRDKI0ERb2x29nekl8CVav80kZwiuxrw8aLeVC8McCy55PI9qZp/IbLhPbIaTNKmXMrzogAY3G16Sg4IlGdyHuc6nkiXFOwD6i3Ng7teEmCStEHBFiAmNFhcNrLtrolIxg2wdUO0tv5N0kfPMLLXTvem6DYxRxycp+EZVdiPLDxtFlSSiAJVVtXHJ2lH/igeyTYvxZO8gG6M1h4h6Z7rifjj3CYsH2VArSh43Mq9IIrm38+dH7x+Buo0z777ViSBRLGXYi3SOB8k2I3ZA5eKxdBGeWdoxbstS6bcL/19CGR5J3rpckPmlzgR1JSYqOOz5Nm2MMeFCcIXHKXDY0urek5eoMhPl8aAB9q1Yl2yl04eCS7GTnLn/73EE667HecbtJtcIzVtU2BnXa4O2hRu0qDudc/HSHqS6Z2/AFNkrgVqGHOF8rCl80oCJiWsdkfAlLkAAAmOttLQ+cQc8mzwL1XpZobTOuERZY+3reTu8W7eMqQUTLfMskoDvxz+hGw2B</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5uy1Z6N60E5aB6/vlhUbneiIqSIPkUa76CQUQkeLAQdh9FuFLqN/91wqA/a0PIs3K1fY0iuHw7/DBsem9pSWl0CKtiia4RZ8OKY1SLbchb+mIhhJx7OWtpY0uUfVAhcy4</encrypted>]]>
    </text>
  </css>
</dir>