<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY defaultTable "DTTHDT">
  <!ENTITY defaultForm "DTTHDT">
]>

<dir table="v20dmmaubc" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc mẫu báo cáo" e="Filter Condition"></title>
  <fields>
    <field name="ma_maubc" categoryIndex="1" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_ma_maubc%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="form" allowNulls="false" defaultValue="&defaultForm;" clientDefault="&defaultForm;">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}')" check="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}')" information="form$ReportForm.ten_maubc%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2q3fhAVTRG8kgfL78wbojHF4XcHXSUA3EdRUBbacZfTZw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default">
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
  </fields>

  <views>
    <view id="Dir" height="78">
      <item value="120, 20, 80, 100, 220, 10"/>
      <item value="110100: [form].Label, [form], [ten_form%l]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>

      <item value="110001: [ten_maubc].Label, [ten_maubc], [ma_maubc]"/>
      <item value="11000-: [ten_maubc2].Label, [ten_maubc2]"/>
      <item value="-1100-: [xoa_yn], [xoa_yn].Description"/>
      <categories>
        <category index="1" columns="120, 20, 80, 100, 230, 0">
          <header v="Thông tin chung" e="General Information"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDoh7DBNsYbDT3ej3cze9dCdHPeIVS0CKI4bibDVmEiFqoxGVAtVBng9tP6BVUlBbKIme2MIm/T/ArXmndg97QIcfimoQyMjC9Nt74fCgDAdyP/QEQ9rUWJwGFLR9ZSNjROrkW1dXMoVOvKmVi0czxc2KCW0C9jgtSt/aBxBJAdxMG7xQ1gJ2G+pDbZyxq3sTm3yYf1bOaYRFumeprWo7sWxV</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%aFAbyVXPX5GjVk6SkpZgUeTzBKKuGpK/Vn5c/ZqzXNQ=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6mYWhc4nYvR9jN96NYRh8WYaQp4hVNvQtC4sToggC6e8+SZ8vv/mPenz+DawFU+rIa6Vszez+RtRgG2DrrShPSjOIdhMhscd5D3f5N4uvzVquVDABz9q8ciXVlpAo8s9SpC9t3GLiTDnwBO380Uzv8T89cJDES6S33tKmAoOm0X</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp8kIDQkQwVXy5lGVCekhvOCHWmaMheiXTWA3XRE2+T1CyozDB7xiu5ExiHcyjzFG2T78PhPPQUTRbbAFZm8aoli36SVNDJD0SBkhrgekWeRWqI4m5eNLbuA+LLhzBokiCijx7uDYxop4T1JYR5aM5+re/GA/t7E6hkYfRvvmtKAaFVd/ndQD7GnyBNQTEm2gVFVgD4QwM8tkdCXcYCn8ltf51SOsAY8RDF6eqv3AdBAeIMI+XcZTGHu7KVp1HIoqiepHl6059HWKgm5qjpxbyOENBW5WbjHeb9nDjFNeUvYNSByLPzLH2cdjVkwft+MXdZTm9ZTGWNbcK3d32UqMPtlyE4J9lprOHKT0zbcxBy4I7GYESiSpoUjav4QpQTuF/qRY0keqhzciT9qCAm2d9AKGo1DDIcKa+R1Vyw4PFxNfpKPtbHUySVxxm70i/5nzkD0mNcGL3A/BDGQCE/9rE7DCx7Y4qPLgr5W9x2MO7+CDNaxmwpeJBtn25Qb2KhoyWPLcsyYuNwCbiqLKzE/3jr7WNHnaDYa1F/a8y+Y2SQf/ciVS0EZYViv+6OfNUBpHMRpXxI3idOZw2Qmci0L1ygjoMVKo5faNoCbSSdoo/gQEivILwBovPasBVFnADXad3b2HBpSkf3bG/6TQTZkYluSkq4uGBk1Zb4TxOAQNFt4rlqrpwOT6HEgKAEqkrYSOjmbl0YaMR34BG55Sl1k3aVJYCMWT8DSNaDQLzJXmf7rPfM5A+Nc/pEhScIwrm5g4SG4eBKwJQd8BJYj7wV5kZG2tcDfAHsjFSR9M3SA9y/vyk8QuDJYW7F7VQizjrTTY10TLc5jlkR65yObvBymINxwBjl2Wl9RYPZNwBPn2+4/o+ms0yhQrTBnV9d3loxs1xoqQDRzytxN5NJ6MaNg5Ck+ieE5rSRcNtUzcGMhkW4QPMxId+CYto9+OytRkOj4RCZnadFbZSqMRVzDO8hGtAdZEXyvLbaj+AHgvLLUjMHbsD8DzS4nGNAdo4srYo+dKXioPyn0Sm0WDgTPhankqZaVTyh6RZV43yNllazSqzKrDW5UQMyuj0AvWL9tuhQyuCYjw++iy+tX4UU//h7SNX2/SfWvzImp9oOaImbHzn3qhtQDsCLn/AYWLy4n2qOzcNQ==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp1PLnPBo+C59D1PHqRannakR5HRrd7z0xsRK/krPLlkH761C54j8bmyjabmaMTVUb4yqdztGeb4G5dqt75DJdmA=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%+JShMBxygFsMjL+5/FpvEVUFl+7ZVBg4tuqsLZrbz5JSRxSEUdbIf5wNcVaSvQLdzpJpobLvefqajaxpf5CRtQZz75ib2UQ4QNiMFjQSIuIUo6mlSMlDqgEl3aLOhR2SBOTT3xTecyIhUZPi+t0DQRuIMiQRj5RjI/dSFoOFI34=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JVAU7kSPYn/O4W9vtyXO72aktO/ycdbRDmQEW0SC55zMV0E80Kb94rr0GAowturNP1/QidmH7XqVL6KX7rgu7BQxCEQOPwPpU8KIlRHfyuzID+vDO7Reud7OOmjp78RkiqxW622u9oMeU4/0ovVl6A0v4fEhP/GYMbIAY1AkgoJ2INA5Gn8bsIsTwtlYnxJmqqh+XJEi2ZSKZb/yXXh8y6C5HizERrzV/qjhcAOL5aW7+ZHFuklK/BBYyFGGbCbGiC4lXswihnZ+vxZHhW7VSvF2d+WK7qk95kLPbV6kw5hfkDKTVNor/dO5n5ILbRH+ssZdlC5t9Pli+A0AXqZYvTkLKmtTOx9YKzstbTpttUWpK20IFxfCThyyTst6s+i1MRgTJjGzwQI8xI2gh2ppiyLdBGXiUaZcrvI1rL0n1FKAvVTEwOg+D9AWmTWjm4r0JPQQRX7w2jDg45TzmfHuudZ9XKjK3mtm2YJIu9Cm7Csi4cH6LRDViea6IwVTNDwZ9XKsASMR4yfiTNTIDjkhJKazP1c9NwXMk3FcgMz2tbJuHUFD5hbL8PYjRMLMs0vaZ+xAG/DibHpFO6tteVMrZVbE72UEfLZgjZ9Z8RMF74WYUHTiI0GrgEd2kHg9BDRq3nz8DEtYbWflfZgVLPbl2nYI2Zq6kS4r3/ETfI3OhE6MXfN9VKkMxmpR0h39f9mzKywLTwhlpKCB4SWjfDSHVbo6zTvFsWLpHZdmqkmnlImwFXEq14s2U9+ZBb4uyU6fILQ7u36McygpHHGVj+2EJ0cneTDA1pqGCdci/BDFsRVIOUK9ElC5Jv0Lm1p7TIkX3MCByYhAfBhZI4so8h9yHH8t/g14qtk2vc+wQJ6FijYKINmsojQgvuAe9k4PNVlLlbCjLNwRO9V1JjDXUyAZn+lutnU3fmf9CXuXMwgipE5QXu++qREDrVpBGjjpfp+Xa1Swy1pnFRMGoA2sQLLdhh4oljhp4j9+1bpgCVfAt4t</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4E1o7Is7aq+wrwMknHEW88WYInagQGulzZyMdwsO998ksTcAEucYb9eQP9qNEOP/KIvHIWvlFdqhlyk6CS7r+iEmCOd1IVvq7Vh/Fe3v45og==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ayGeBGQudaG3KaHZ9rzRUoilRlLnkc0MB/ykekvrte95hdrpMP6mtRccjSgwrsfOLQwg3opxoDJDXY1RkoxhOxv84VzGSY0OhL6Ag5FB5tu</encrypted>]]>
    </text>
  </css>
</dir>