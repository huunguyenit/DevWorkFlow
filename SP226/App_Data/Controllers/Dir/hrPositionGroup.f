<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnhvt" code="loai_nh, ma_nh" order="loai_nh,ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm vị trí công việc" e="Position Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type: 1, 2 or 3"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
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
      <item value="11100: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="1100: [ma_nh].Label, [ma_nh]"/>
      <item value="11000: [ten_nh].Label, [ten_nh]"/>
      <item value="11000: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxweeLlQjPLrtZqe+nBURQHhwTCAh/svfJ6RmlClGo7C9CuUNOpXB3QGtoYqURg1WXGU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYb6ondZpoSf/D3b7fS1XCkaP4kGBonRs9pWWnQk05/V+uwd3cszpfhPHcPLaw2mHNs=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEKB5namNr+pUUo+cYvOAif96ck7r0WURDjcEjtuHFlM1YbBt83B2O2xM0o2mQx1qiA7BpLvxqhL/c2LFccgEk3z7LZ5PXKtsbwyttIWmcsh4BV4rhY7ikPgZWu9eI+q4+wquAqfuT6VqTQwl5Jl6leOMj8NwJyWJ7SuIw27zXv1r+R/vvcY6QszdePzsWzDypBenWKMTT87K1Tn1Lhhxw6062tki4m4+36G5p7DZRbRbWM2M2ZqJRkSVtKHDIXvWmXKisxhN3sO3RqRzfyJiLrBHCLkP/r3IQdVbz82FgXiShrBux3f45h19whsLKdyBXqiYideMbI1RPArhSBwfC5Kh7zy/Gn8yTjxUGy/CjV5fYWYOX1462un/W2/gCNd6q4a4SdXZgD3jeM8JrFK+sNk=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82naZcogpCeajCtEhgkNU3pq3pzFxVd3rZUs80tXohCT3xb9xkoR1ANYQ5qEgOKBxWcAP7D3mrVik8XpOWat8+nMZmhlaBlMdqQ32gaYgnwpj7xBvQ9+FNu62XNtX24e0LnwLdrTB50tMGqZUi9RRkxEhfs51+fVQNTqsz+XcAVlmpdVeWk0f9RGpA64qe8u5qm4P8kyFf/a0+MmTsJXoNjLcdGeUgX8m9NcJMDeFvYtlSFR//iHorYErc6NtmpVxTI</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jYVHtnfab9pOCUbSkAnVHEvsWHmqRhGNaf8MosDxAH4F6ImDynGyCmSQvRVXhpH4Pvfka9QVfhCfzHSjBMefD3g7B5GO7e8nUPQBNKPBZKOwrnFKSZBg3iT0OaEVxDX+0GjS/Mo/bPbgJT4Dt5no1WHjxmSCYdF49n8owvugG4uJinI8RnPgh4bWrTHDc1dDKeIitHgIqxNBBkZMPCPG7rHEaf97hitilkPd02xaoqEVVuwBr/8+kqPbDnWPMeAUqQHTV4Uoc9f4tBaldyAz629ZJfZyh7Apv2EKxCPKdu102RM37tLD31O0TzvyzyC+x+g6yxqiPYuKK5zePh2wyRg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbehRCaqK7mRRSejil883DxjntSP1IFG0A7PU3T7C/6L5/Zb7/zagAyL76MHlhRZUzlQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbNXeCwJoK8gaFUnIXWSwX5em1SO94/nza8sOwA7Bcc9uE12F1JUI1zpSzEY0mqA43oURdxIciCs6QcWjo3pnXK6v2nE3olhDAfCEJ7Sm/FLKu/YixLyWefIPCCVg5HbNarHjPoM8TUOqoN/Y5oJvwzx7YWKjvYw8W7a3BCKytQ8eBsYHk6nk1e6Y0FAgUoI/J68ulMQhUxqF6SiZUnGvrEY16UUVoTQHTeqNuC6oUlxdrObLBUcs4gMAY6nS8Gh2O3YrMwBdRt5TDDxvGsOCDKSZqWRAMK2HUBHVGYutUSViuJnSRzjknR31bLpV7SibfMzt5oEAuosq3fqDu6Zh1D</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>