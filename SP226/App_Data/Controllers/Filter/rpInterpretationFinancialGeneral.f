<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY defaultTable "V30GLTCTMTH">
]>

<dir table="v20dmmaubc" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc mẫu báo cáo" e="Report Form Filter"></title>
  <fields>
    <field name="ma_maubc" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_ma_maubc%l" readOnly="true" external="true" defaultValue="Default" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="form" allowNulls="false">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}') and (kieu_bc = 0 or exists(select 1 from options a where name = 'm_kieu_bc' and rtrim(isnull(a.val, 0)) = v20dmmaubc.kieu_bc))" check="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}') and (kieu_bc = 0 or exists(select 1 from options a where name = 'm_kieu_bc' and rtrim(isnull(a.val, 0)) = v20dmmaubc.kieu_bc))" information="form$ReportForm.ten_maubc%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2q3fhAVTRG8kgfL78wbojHF4XcHXSUA3EdRUBbacZfTZw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" readOnly="true" external="true" defaultValue="Default">
      <header v="" e=""></header>
    </field>

    <field name="loai" external="true" dataFormatString="1, 2, 3" clientDefault="2" align="right" allowContain="true" defaultValue="Default">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Tạo mẫu, 2 - Sửa mẫu, 3 - Xóa mẫu" e="1 - New, 2 - Edit, 3 - Delete"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2raBw0IpQ5/chFGwoEs8Hbd1Jr3Xc/ocdPgfx50gSGqQg==</encrypted>]]></clientScript>
    </field>

    <field name="ten_maubc" categoryIndex="1">
      <header v="Tên mẫu báo cáo" e="Report Name"></header>
    </field>
    <field name="ten_maubc2" categoryIndex="1">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="xoa_yn" categoryIndex="1" type="Boolean" external="true" allowContain="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Xác nhận xóa mẫu báo cáo" e="Confirm delete"></footer>
      <items style="CheckBox"/>
    </field>

    <field name="h_line1" categoryIndex="9">
      <header v="Thông tin" e="Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line12" categoryIndex="9">
      <header v="Thông tin khác" e="Other Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin khác&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Other Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line2" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line22" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line3" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line32" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line4" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line42" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line5" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line52" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="157">
      <item value="120, 20, 80, 100, 220, 10"/>
      <item value="110100: [form].Label, [form], [ten_form%l]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>

      <item value="110001: [ten_maubc].Label, [ten_maubc], [ma_maubc]"/>
      <item value="11000-: [ten_maubc2].Label, [ten_maubc2]"/>
      <item value="-1100-: [xoa_yn], [xoa_yn].Description"/>

      <item value="1-1: [h_line1].Desciption, [h_line12].Desciption"/>
      <item value="1-1: [h_line1], [h_line12]"/>
      <item value="1-1: [h_line2], [h_line22]"/>
      <item value="1-1: [h_line3], [h_line32]"/>
      <item value="1-1: [h_line4], [h_line42]"/>
      <item value="1-1: [h_line5], [h_line52]"/>
      <categories>
        <category index="1" columns="120, 20, 80, 100, 230, 0">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="9" columns="271, 8, 271">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Q8M/QNyyhQgbtZ5e/JFp0dX8gtRO9cYmco5pGVoregwxbCGxWwie5qIcQPS5zRb1qWqG/oZ+cHh9NeTuBrNkKEkQs0CXSrqCbSZWWMg6iS7JG6y+yXIdgJnzT6RjONcIx2THLfbdjObsVMLX/UdPpYBSIIkLRMZNQe9LXQLKjL9NEG9HQFa+PZ5Jsa55X+5etvQYIyC6a4B+XxFsF3U6Ksl4TFWRSIH2/YsflDrwX9JV/hl9gMsGiDRsY47XMz1MqoIZNAonEFR8/C2TJTZvqg=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDojhl2jodEb/njdI+S2SXVzzKxBoYoUov5StKAIp/DfHWozUVWV6kSmZHJZ3PuikJ/q/mU9DRxRhuymtLfpGhg5EbCtSnCcFTQHLt+u1zmrGZObnT55eBBkqPo5sQc+zJPpf+LKqbb/J4r5vwFWLg/60PkLH/FuJT5tcq5uAXRNRQekP63aOdY3YUa7qa4Wtwr8=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf0iwzKIl/ip1Y4NsMA8QnLdlYG6Z4BkJbpo8jdCZJS3bWy8yMREunuoTS5envd40LqWNXDHbI8dGv7zgpjHnqlA1+bAA50BHF38mHiiKmWukO/K/D1hfbszacn/F9RS8Sq58B52x66rVuyF0f0117P3r54L/pdD2rf08TOsiwCMGzQ/+xYWOhdeqGth4oKH36A==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf0iwzKIl/ip1Y4NsMA8QnLfT8v0CtKGrClLZ5vaAF0iWS24V7RplvwvXpJWSLaY4RTGB63+h9B986c8J65WmvAH+/P//F13+GsJBfEjZJxS4iPV1NdnyQ69rjTDZohoxa4hC6hybQP2kZtA8AJmgo6w9YsBEppkSx7f09sRn1Fhx8NjGY83e4w/CAI/vHj6uQNfj8XO/2lxXZWeeacTwm2j1mwudAYaCmGyScXLNnmUS2okLduSvJ2e7OLsk716yBiN85uovUo+9vWBf1rOtz2UUOBazVEFLNApStxtO9PHG6si5T6c6j4GHHYqd2UdOIoe5XJpqyEwvZpaeLQzfMm8=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6mYWhc4nYvR9jN96NYRh8WYaQp4hVNvQtC4sToggC6e8+SZ8vv/mPenz+DawFU+rIa6Vszez+RtRgG2DrrShPSjOIdhMhscd5D3f5N4uvzVquVDABz9q8ciXVlpAo8s9SpC9t3GLiTDnwBO380Uzv8T89cJDES6S33tKmAoOm0X</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp8kIDQkQwVXy5lGVCekhvOCHWmaMheiXTWA3XRE2+T1CyozDB7xiu5ExiHcyjzFG2T78PhPPQUTRbbAFZm8aoli36SVNDJD0SBkhrgekWeRWqI4m5eNLbuA+LLhzBokiCijx7uDYxop4T1JYR5aM5+re/GA/t7E6hkYfRvvmtKAaFVd/ndQD7GnyBNQTEm2gVFVgD4QwM8tkdCXcYCn8ltf51SOsAY8RDF6eqv3AdBAeIMI+XcZTGHu7KVp1HIoqiepHl6059HWKgm5qjpxbyOENBW5WbjHeb9nDjFNeUvYNSByLPzLH2cdjVkwft+MXdZTm9ZTGWNbcK3d32UqMPtlyE4J9lprOHKT0zbcxBy4I7GYESiSpoUjav4QpQTuF/qRY0keqhzciT9qCAm2d9AKGo1DDIcKa+R1Vyw4PFxNfpKPtbHUySVxxm70i/5nzkD0mNcGL3A/BDGQCE/9rE7DCx7Y4qPLgr5W9x2MO7+CDNaxmwpeJBtn25Qb2KhoyWPLcsyYuNwCbiqLKzE/3jr7WNHnaDYa1F/a8y+Y2SQf/ciVS0EZYViv+6OfNUBpHMRpXxI3idOZw2Qmci0L1ygjoMVKo5faNoCbSSdoo/gQE4qVmGPy+/p+bXirAXX5tx2eOOTWFEFFQBtVgJyc+vUOepIJZgSEZJL/HmMXh7TJCzXL35IMiTTrJTYzWZwlbsT/o9aRyYO8ncfORuq0DL+ImeXVeSFeSK5sFRMz/pUVAaTeVnnct+7WM/E6WtG5KVxH6rx0koeBb8Fkm0lOLODIh3umVq/a74LZCg7YxwuIW+HVfPVGo2ni1DK2skc5NKsSlfiV51dcofXPow9e+Em0NoRsFXwDcLFnCyjdjsnKVeYORdpaKoTKIe6KSabA0SwZHibXCvUJYVe8DKoMQRNRFzjuMezLvQHG+McS4ilJ+KvbQBNn+/CW6evDd4yqXuoNUt+L/WC9PtJmaFiMUTiJl2cFAax4QuZM55F87r4y6DJrP/iMPeUsT6Q1Mklg5wilGM1OhPZu+Kl+mjeDkm9QwQGi/IsdKjR5e2qhdyAQVFBByL9htDIAshYW35wpQUGXJq0T8v1IPfsFybh7dNdYOpcY0pjN/bDTlbpN7isG8nqSyR9XFQ2XFghpgYg74YE1uk3EpIX+2TSylKWNWmwMMRoKHXlAfQZpWVd3XBmlb5ZDj++GpXzzcTb6+f1iwrvESUXdLgHxJ1oRrNputrwjF9zLukOAhqIS4BvSqs79U</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp1PLnPBo+C59D1PHqRannakR5HRrd7z0xsRK/krPLlkH761C54j8bmyjabmaMTVUb4yqdztGeb4G5dqt75DJdmA=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%+JShMBxygFsMjL+5/FpvEVUFl+7ZVBg4tuqsLZrbz5JSRxSEUdbIf5wNcVaSvQLdzpJpobLvefqajaxpf5CRtQZz75ib2UQ4QNiMFjQSIuIUo6mlSMlDqgEl3aLOhR2SBOTT3xTecyIhUZPi+t0DQRuIMiQRj5RjI/dSFoOFI34=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PldN23+Zg3NpuDqAcd6ybQ/N4lBF2icWNN5xJK0KxksIU0cEeWAiGrpDVJdF9CmjNgEVpR0dLT4PYNTRmdmGMP7zNZSG1OeQmGuzi2GiDv2e+/VKXjkCJ0bW1GB5zYn+5MOHszk9RdgUqF/+sg0Il/4Bv9wykxy16axkdVT1CAIOE9fuGNM7cI3bPZNbdddkUrBA4iH3CajmUntgaaQ6N+60rEyXKoTEilzcYP6s8BM8xs0HRvkknE6ipiNcbXvDh6LPKp4mydhDrjcKgVdg6+sovhxpcN+C+Vqnsprgw8wNBP2E1MYf139Ai2Sm/+ujR9Ale/hpHJcUyFmptPuC7Fvm4C+fXlMqKMB/yQ+dBYvYOZivz9JdL8itUPOc40mCwcnW9MYcuIN+tqili7eqvgCHkkgUwkDBkuc1vC+Qy2tyOLTzZ2zTYFB535d+9B0jyEl8fu1fxdusSaBHT6M3lMiIJQkigCzEJUBVg0NChGpcsYdV9XHpNM1w7G6EOTg8Fbt9sqKCh654AyiMnJu68qiAvN7M1lYPhHUJHXhqeaK458AVwXjTksd7t/Rxb1s9xmR4v8vGFG/YFjktx7iUcRxpbnrbaJrq3jQiQhZh0ZbYpFN4XsiyON8Dj3FXbpi7LvPnVCJcTbHsBJGSC7Jh/742PofI9YXy/O/Od2sQqw8w1FhPdI3GQFLp3cL6daTb5+2jIWRMFTcGEVd5mhEX30uE/FMTqCHejc6xKPhATlacmU5cyApcV5/fwgeHXM5bvPZbpwZQgiExLQ1sjPs1w+xLE/Yqi/hNG2JcJAP4pi7YR+1PnetlsNcUqHLILe9Tmz4lU9DLyo1+yjrZa4/zzsHwdV+Kzhu1RtAU7vJOZn9nJ6Na1TL2rBnnTnrPsZmdeDjzjWOiZ+7ZsWf63rZlnJ1EDl7/EGt8LgFW/6vLGCYqmbLBStrZXhaRewD+RRt5CZDv2yfC32/wpTPgckrRDNrP8Sk5oWIC+s4R8JaCNgSFNSPA8FDP8H07gvDS7uj6gYNmI0eR8z0y4m15VagNG/d9afWGw+Heq8z0+264o/zgSwFeZRHtFaxgXQLEewQJyHFyxYZTIfcaObX/bdx/0pDHk/Of3JKNXXP0aTmLjB/uNNCvfYsQudA3sFZa0qTNxI/Oiq8BWpH38FnCB2GcL40F4L3MvJZvHnV3GgMaEZOWc2Jcx6GyAj10rxGiYbsOfZJSbhE5D/mbaXPd4xrffEU7zNGlyKq92xSTpwQlD/tQVR3z10l1kGKsxwK19ZKdd9uOEy12iP1kaqjXhilhMx67tA/RFtFPZ1UPT9tDWY5B2mGUoKyv03EEY14RWOYCKa+3T99yH5T6i05rqqF2576YelRYz5KfGzg7WKX5b1q</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4E1o7Is7aq+wrwMknHEW88WYInagQGulzZyMdwsO998ksTcAEucYb9eQP9qNEOP/IC/RgSQEMaykr9aUeBKwrllIxQVAr+29qM6B3hweZD+8xYjZ+oD5rsI+ppbQU6SegHRmgmdkQInfiC94y5m0gb</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ayGeBGQudaG3KaHZ9rzRUoilRlLnkc0MB/ykekvrte95hdrpMP6mtRccjSgwrsfOLQwg3opxoDJDXY1RkoxhOxv84VzGSY0OhL6Ag5FB5tu</encrypted>]]>
    </text>
  </css>
</dir>