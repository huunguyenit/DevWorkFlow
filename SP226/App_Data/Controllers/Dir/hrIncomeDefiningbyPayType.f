<?xml version="1.0" encoding="utf-8"?>

<dir table="hrkieuluong" code="ma_loai_lg, ma_pc" order="ma_loai_lg, ma_pc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo chỉ tiêu thu nhập cho loại lương" e="Income Defining by Pay Type"></title>
  <fields>
    <field name="ma_loai_lg" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại lương" e="Type Code"></header>
      <items style="AutoComplete" controller="hrPayType" key="status='1'" check="1 = 1" reference="ten_loai_lg%l" information="ma_loai_lg$hrloailuong.ten_loai_lg%l"/>
    </field>
    <field name="ten_loai_lg%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_pc" isPrimaryKey="true">
      <header v="Mã phụ cấp" e="Allowance"></header>
      <items style="AutoComplete" controller="hrAllowance" reference="ten_pc%l" key="status = '1'" check="1=1" information="ma_pc$hrdmpc.ten_pc%l"/>
    </field>
    <field name="ten_pc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="chi_tieu1" dataFormatString="@upperCaseFormat">
      <header v="Chỉ tiêu lũy tiến" e="Progressive Tax Tariff"></header>
      <items style="AutoComplete" controller="Pattern" reference="ten_ct1%l" key="status = '1' and kieu_thue = '1'" check="kieu_thue = '1'" information="ma_tn$vtdmtn.ten_tn%l"/>
    </field>
    <field name="ten_ct1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu2" dataFormatString="@upperCaseFormat">
      <header v="Chỉ tiêu toàn phần" e="Flat Rate Tariff"></header>
      <items style="AutoComplete" controller="Pattern" reference="ten_ct2%l" key="status = '1' and kieu_thue = '2'" check="kieu_thue = '2'" information="ma_tn$vtdmtn.ten_tn%l"/>
    </field>
    <field name="ten_ct2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu3" dataFormatString="@upperCaseFormat">
      <header v="Chỉ tiêu không cư trú" e="Non-resident"></header>
      <items style="AutoComplete" controller="Pattern" reference="ten_ct3%l" key="status = '1' and kieu_thue = '2'" check="kieu_thue = '2'" information="ma_tn$vtdmtn.ten_tn%l"/>
    </field>
    <field name="ten_ct3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Thu nhập, 2 - Khác" e="1 - Income, 2 - Other"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="11001: [ma_loai_lg].Label, [ma_loai_lg], [ten_loai_lg%l]"/>
      <item value="11001: [ma_pc].Label, [ma_pc], [ten_pc%l]"/>
      <item value="11001: [chi_tieu1].Label, [chi_tieu1], [ten_ct1%l]"/>
      <item value="11001: [chi_tieu2].Label, [chi_tieu2], [ten_ct2%l]"/>
      <item value="11001: [chi_tieu3].Label, [chi_tieu3], [ten_ct3%l]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtU6/6YMKrGXHzyORnVT4VbpECDzsqe4CQse32KSRSJvdxFTkK1b8yLO4+C2ngzbJcpvbZV9lsqDL184d+21BlrfWxKdPpS5Jl4742WYSfFS4BgB8Z6elQDUxYgFRYezXFV1o+v9bZJTh91HY9bn6vtUomxua0WETfjLYZIuVftTfKCAvbdGEcyIHrk9UGtRUvsfBDPuaTHaEfdf7dBsTFfnIDdrrVIRmqXmfRuaAn6ClyRYUta+6v961erdsMZ2r7V0qEkYc+9U8i8ykVrwI/IxkFBfchSgZbT90Y731hxeRWHyPWHXCrKjKaQO/YetX+aBwk/WRNiX/IU0bVig1IXPhtV+gU4BooME07rErX7NmmMRwNs6b+1LUwOsqCFBQliudrK88rt5YwEpILsw+6t4wx+pHp+5CQWch/V3e9YFY</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n7mabqlAqIm2fQgzYQEt8pchZM3o4wsYdH6KwJmeH7md6yGJgkT4NRnT3GoxZCZCmRYS6nHmX9NP8BiIni4YMA/qm1rQlYvl+KN06UJE7L468VaHY6uHY2oD9HIpwbjzShbE5wFK0zfAEvFsUGXkeOAO1BkHYGDeazEKwoTgOlxea2fxdU6L2kLmF6PWQpnAh</encrypted>]]>
      </text>
    </command>


    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4nEKPGZI3hmdwEoNKuI524A6pSuM7TQvQ+Wnqp2+4/yPBLXGJl2v47osWtZKdjtLK0m5nfB9P7EnSSfzJIYaKOSsESilgpMeJdwSfhSYsUvhR2hhNIBKljRMTaXs4VwbzXw20Rpupp4X+f6mE+SoUJngtWxSGWFezOczzkMcZ/AvtDeLHyNA+SvgCd3VSndCRmhWrfMmT8oVWfGbJhQNYTbEgcpd3eL1WA4a3nLqcG6PxPpoHDsa7PrHG9qW3EwK7O</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbegAkg2N50C+nqU7Z0LKyakedcN2wn4gD1naz/wW9lQ8Lh8y1A74fh5XoSOiHyLf5Gg==</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>